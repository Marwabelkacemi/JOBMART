import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/worker_profile.dart';
import '../../domain/entities/portfolio_item.dart';
import '../models/worker_profile_model.dart';
import '../models/portfolio_item_model.dart';

class WorkerRemoteDataSource {
  final FirebaseFirestore firestore;

  WorkerRemoteDataSource({required this.firestore});

  final String collectionName = 'workerProfiles';

  /// Fetch a worker’s profile and its portfolio from Firestore.
  Future<WorkerProfile> getWorkerProfile(String userId) async {
    // Get worker profile document
    final docSnapshot = await firestore.collection(collectionName).doc(userId).get();

    if (!docSnapshot.exists) {
      throw Exception('Worker profile not found');
    }

    // Fetch portfolio items from subcollection "portfolio"
    final portfolioSnapshot = await firestore
        .collection(collectionName)
        .doc(userId)
        .collection('portfolio')
        .get();

    final List<PortfolioItem> portfolio = portfolioSnapshot.docs
        .map((doc) => PortfolioItemModel.fromMap(doc.data()))
        .toList();

    final data = docSnapshot.data()!;
    return WorkerProfileModel.fromFirestore(data, docSnapshot.id, portfolio);
  }

  /// Update the worker profile in Firestore.
  Future<void> updateWorkerProfile(WorkerProfile profile) async {
    await firestore.collection(collectionName).doc(profile.userId).update({
      'specialization': profile.profession,
      'bio': profile.bio,
      'pricePerHour': profile.pricePerHour,
      'pricePerDay': profile.pricePerDay,
      'pricePerProject': profile.pricePerProject,
      'isAvailable': profile.isAvailable,
    });
  }

  /// Update the availability status of a worker.
  Future<void> setAvailabilityStatus(String userId, bool isAvailable) async {
    await firestore.collection(collectionName).doc(userId).update({
      'isAvailable': isAvailable,
    });
  }

  /// Add a portfolio item to the worker's subcollection.
  Future<void> addPortfolioItem(String userId, PortfolioItem item) async {
    final portfolioCollection = firestore
        .collection(collectionName)
        .doc(userId)
        .collection('portfolio');

    // If item.id is empty, Firestore will generate an id
    final docRef = (item.id.isNotEmpty)
        ? portfolioCollection.doc(item.id)
        : portfolioCollection.doc();

    // Create the portfolio item model using the document id from Firestore
    final portfolioItemModel = PortfolioItemModel(
      id: docRef.id,
      title: item.title,
      description: item.description,
      mediaUrl: item.mediaUrl,
    );
    await docRef.set(portfolioItemModel.toMap());
  }

  /// Update an existing portfolio item.
  Future<void> updatePortfolioItem(String userId, PortfolioItem item) async {
    final portfolioCollection = firestore
        .collection(collectionName)
        .doc(userId)
        .collection('portfolio');
    await portfolioCollection.doc(item.id).update({
      'title': item.title,
      'description': item.description,
      'mediaUrl': item.mediaUrl,
    });
  }

  /// Remove a portfolio item from the worker's subcollection.
  Future<void> removePortfolioItem(String userId, String portfolioItemId) async {
    final portfolioCollection = firestore
        .collection(collectionName)
        .doc(userId)
        .collection('portfolio');
    await portfolioCollection.doc(portfolioItemId).delete();
  }

 
}

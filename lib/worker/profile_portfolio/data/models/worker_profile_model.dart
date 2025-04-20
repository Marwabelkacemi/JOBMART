import '../../domain/entities/worker_profile.dart';
import '../../domain/entities/portfolio_item.dart';

class WorkerProfileModel extends WorkerProfile {
  const WorkerProfileModel({
    required super.id,
    required super.userId,
    required String specialization,
    required super.bio,
    required super.pricePerHour,
    required super.pricePerDay,
    required super.pricePerProject,
    required List<PortfolioItem> portfolio,
    required super.isAvailable,
  }) : super(
          profession: specialization,
          portfolioUrls: portfolio,
          mode: WorkerMode.serviceProvider,
        );

  /// Create a [WorkerProfileModel] from Firestore data.
  factory WorkerProfileModel.fromFirestore(
      Map<String, dynamic> data, String documentId, List<PortfolioItem> portfolio) {
    return WorkerProfileModel(
      id: documentId,
      userId: data['userId'] as String,
      specialization: data['specialization'] as String,
      bio: data['bio'] as String,
      pricePerHour: (data['pricePerHour'] as num).toDouble(),
      pricePerDay: (data['pricePerDay'] as num).toDouble(),
      pricePerProject: (data['pricePerProject'] as num).toDouble(),
      portfolio: portfolio,
      isAvailable: data['isAvailable'] as bool,
    );
  }

  /// Convert the model into a map for updating Firestore.
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'specialization': profession,
      'bio': bio,
      'pricePerHour': pricePerHour,
      'pricePerDay': pricePerDay,
      'pricePerProject': pricePerProject,
      'isAvailable': isAvailable,
      // Do not include portfolio here because it is stored in a subcollection.
    };
  }
}

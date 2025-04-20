// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class AuthRemoteDataSource {
  final fbAuth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSource({
    required this.firebaseAuth,
    required this.firestore,
  });

  /// Log in a user using Firebase Authentication.
  Future<UserModel> login(String email, String password) async {
    // Sign in with Firebase Auth.
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Once authenticated, fetch the user document from Firestore.
    final userDoc = await firestore
        .collection('users')
        .doc(credential.user!.uid)
        .get();

    if (!userDoc.exists) {
      throw Exception('User data not found in Firestore.');
    }

    return UserModel.fromFirestore(userDoc.data()!, userDoc.id);
  }

  /// Register a new user with email, phone, and role.
  Future<UserModel> register(
    String name,
    String email,
    String phoneNumber,
    String password,
    String role,
  ) async {
    // Create the user with Firebase Authentication.
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Construct the UserModel.
    final userModel = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      role: role,
    );

    // Save user info in Firestore.
    await firestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toMap());

    return userModel;
  }

  /// Sign out the current user.
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  /// Returns the currently authenticated user (if any).
  Future<UserModel?> getCurrentUser() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await firestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        return UserModel.fromFirestore(userDoc.data()!, userDoc.id);
      }
    }
    return null;
  }
}

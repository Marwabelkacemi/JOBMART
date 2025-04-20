import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.role,
  });

  // Create a UserModel from a Firestore document snapshot.
  factory UserModel.fromFirestore(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      name: data['name'] as String,
      email: data['email'] as String,
      phoneNumber: data['phoneNumber'] as String,
      role: data['role'] as String,
    );
  }

  // Convert a UserModel to a map to store it in Firestore.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }
}

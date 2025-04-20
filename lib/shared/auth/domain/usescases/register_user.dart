import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<User> call({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String role,
  }) {
    return repository.register(name, email, phoneNumber, password, role);
  }
}

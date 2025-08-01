// login_user.dart
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<User> call(String identif, String password) {
    return repository.login(identifier: identif, password: password);
  }
}

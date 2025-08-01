import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String identifier, required String password});
  Future<User> register({required String phone, required String password, required String username});
  Future<User?> getCurrentUser();
  Future<void> logout();
}

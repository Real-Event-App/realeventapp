import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<User> login({required String identifier, required String password}) {
    return remoteDatasource.login(identifier, password);
  }

  @override
  Future<User> register({required String phone, required String password, required String username}) {
    return remoteDatasource.register(phone, password, username);
  }

  @override
  Future<User?> getCurrentUser() {
    return remoteDatasource.getCurrentUser();
  }

  @override
  Future<void> logout() {
    return remoteDatasource.logout();
  }
}

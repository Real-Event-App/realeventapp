import '../models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDatasource {
  final SupabaseClient client;

  AuthRemoteDatasource(this.client);
  
  Future<UserModel> login(String identifier, String password) async {
    final result = await client
        .from('users')
        .select('phone')
        //.or('username.eq.$identifier,phone.eq.$identifier')
        .maybeSingle();

    if (result == null) {
      throw Exception('User not found');
    }

    final phone = result['phone'];

    final response = await client.auth.signInWithPassword(
      phone: phone,
      password: password,
    );

    final user = response.user;
    if (user == null) throw Exception("Login failed!");

    return UserModel(
      id: user.id,
      phoneNumber: user.userMetadata?['phoneNumber'],
      username: user.userMetadata?['username'],
    );
  }

  Future<UserModel> register(String phoneNumber, String password, String username) async {
  final response = await client.auth.signUp(
    phone: phoneNumber,
    password: password,
    data: {
      'username': username,
    },
  );

  final user = response.user;
  if (user == null) throw Exception("Registration failed");

  return UserModel(
    id: user.id,
    phoneNumber: user.userMetadata?['username'],
    username: user.userMetadata?['username'],
  );
}


  Future<UserModel?> getCurrentUser() async {
    final user = client.auth.currentUser;
    if (user == null) return null;
    return UserModel(id: user.id, phoneNumber: user.userMetadata?['phoneNumber'], username: user.userMetadata?['username']);
  }

  Future<void> logout() async {
    await client.auth.signOut();
  }
}

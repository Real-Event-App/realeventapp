import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.phoneNumber,
    required super.username,
    super.dateOfBirth,
    super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      username: json['username'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'phoneNumber': phoneNumber,
    'username': username,
    'dateOfBirth': dateOfBirth?.toIso8601String(),
    'name': name,
  };
}

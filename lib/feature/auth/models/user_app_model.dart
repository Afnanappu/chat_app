// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAppModel {
  final String uid;
  final String username;
  final String email;
  final String? profileImage;

  UserAppModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'email': email,
      'profileImage': profileImage,
    };
  }

  factory UserAppModel.fromMap(Map<String, dynamic> map) {
    return UserAppModel(
      uid: map['uid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAppModel.fromJson(String source) =>
      UserAppModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserAppModel copyWith({
    String? uid,
    String? username,
    String? email,
    String? profileImage,
  }) {
    return UserAppModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  String toString() {
    return 'UserAppModel(uid: $uid, username: $username, email: $email, profileImage: $profileImage)';
  }
}

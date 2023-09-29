// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String photoUrl;
  final String telephoneNumber;
  const AppUser({
    required this.uid,
    required this.email,
    required this.username,
    required this.photoUrl,
    required this.telephoneNumber,
  });

  AppUser copyWith({
    String? uid,
    String? email,
    String? username,
    String? photoUrl,
    String? telephoneNumber,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      photoUrl: photoUrl ?? this.photoUrl,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'photoUrl': photoUrl,
      'telephoneNumber': telephoneNumber,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: (map['uid'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      username: (map['username'] ?? '') as String,
      photoUrl: (map['photoUrl'] ?? '') as String,
      telephoneNumber: (map['telephoneNumber'] ?? '') as String,
    );
  }

  factory AppUser.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc, SnapshotOptions? options) {
    return AppUser(
      uid: (doc.data()?['uid'] ?? '') as String,
      email: (doc.data()?['email'] ?? '') as String,
      username: (doc.data()?['username'] ?? '') as String,
      photoUrl: (doc.data()?['photoUrl'] ?? '') as String,
      telephoneNumber: (doc.data()?['telephoneNumber'] ?? '') as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'photoUrl': photoUrl,
      'telephoneNumber': telephoneNumber,
    };
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      uid,
      email,
      username,
      photoUrl,
      telephoneNumber,
    ];
  }
}

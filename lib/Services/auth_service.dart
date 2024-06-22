import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone_flutter/Models/user_models.dart';
import 'package:instagram_clone_flutter/Services/storage_service.dart';

abstract class AuthService {
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String username,
    required String bio,
    required File photoURL,
    required String password,
  });
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final StorageService _storageService;
  final FirebaseFirestore _firebaseFirestore;
  AuthServiceImpl(FirebaseAuth firebaseAuth, StorageService storageService,
      FirebaseFirestore firebaseFirestore)
      : _firebaseAuth = firebaseAuth,
        _storageService = storageService,
        _firebaseFirestore = firebaseFirestore;
  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        throw FirebaseAuthException;
      }
    } catch (e) {
      FirebaseAuthException;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String username,
    required String bio,
    required File photoURL,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = credential.user!.uid;
        final photoUrl = await _storageService.saveUserProfile(photoURL, '');

        UserModel userModel = UserModel(
          uid: uid,
          email: email,
          username: username,
          bio: bio,
          photoURL: photoUrl,
          following: [],
          followers: [],
          posts: [],
        );
        await _firebaseFirestore
            .collection('Users')
            .doc(uid)
            .set(userModel.toJson());
      }
    } catch (e) {
      FirebaseAuthException;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageService {
  Future<String> saveUserProfile(File file, String childName);
}

class StorageServiceImpl implements StorageService {
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;

  StorageServiceImpl(FirebaseStorage firebaseStorage, FirebaseAuth firebaseAuth)
      : _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage;
  @override
  Future<String> saveUserProfile(File file, String childName) async {
    Reference ref = _firebaseStorage
        .ref()
        .child(childName)
        .child(_firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  FirestoreRepository();

  final instance = FirebaseFirestore.instance;

  Future<void> addUserName({required String userName}) async {
    await instance.collection('users').doc('userNames').update({
      'userNames': FieldValue.arrayUnion(<String>[userName])
    });
  }

  Future<void> updateUserName({
    required String oldUserName,
    required String newUserName,
  }) async {
    await instance.collection('users').doc('userNames').update({
      'userNames': FieldValue.arrayRemove(<String>[oldUserName])
    });
    await addUserName(userName: newUserName);
  }

  Future<bool> isUserNameBusy({required String userName}) async {
    final snapshot = await instance.collection('users').doc('userNames').get();
    final data = snapshot.data();
    if (data == null) return false;
    final userNames = List<String>.from(data['userNames'] as List);

    return userNames.contains(userName);
  }
}

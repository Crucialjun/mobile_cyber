import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_cyber/common/models/app_user.dart';
import 'package:mobile_cyber/services/database_service/i_database_service.dart';
import 'package:mobile_cyber/utils/app_strings.dart';

class DatabaseService implements IDatabaseService {
  final db = FirebaseFirestore.instance;

  @override
  Future addUserToDb(AppUser user) async {
    final docRef = db
        .collection(AppStrings.usersTable)
        .doc(user.uid)
        .withConverter(
            fromFirestore: AppUser.fromFirestore,
            toFirestore: (AppUser user, options) => user.toFirestore());

    await docRef.set(user);
  }

  @override
  Future<AppUser?> getUserFromDb(String uid) async {
    final ref = db.collection(AppStrings.usersTable).doc(uid).withConverter(
        fromFirestore: AppUser.fromFirestore,
        toFirestore: (AppUser user, options) => user.toFirestore());
    final docSnap = await ref.get();

    if (docSnap.exists) {
      return docSnap.data();
    } else {
      return null;
    }
  }
}

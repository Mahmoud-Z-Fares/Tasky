import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky/utils/data_base.dart';
import 'package:tasky/views/auth/data/models/user_model.dart';

abstract class DataBaseUserAuth {
  static CollectionReference<UserModel> get _getCollection {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (users, _) => users.toJson(),
        );
  }

  static Future<void> addUser(UserModel userModel) async {
    try {
      await _getCollection.doc(userModel.uid).set(userModel);
    } catch (e) {
      throw ("error from FirebaseAuthException $e");
    }
  }

  static Future<DataBaseResult<UserModel>> registerUser({
    required UserModel userModel,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userModel.email ?? "",
            password: password,
          );
      final token = FirebaseAuth.instance.currentUser?.uid;
      userModel.uid = token ?? "";
      await DataBaseUserAuth.addUser(userModel);
      return DataBaseSuccess(data: userModel);
    } catch (e) {
      return DataBaseError(e.toString());
    }
  }

  static Future<DataBaseResult<void>> logingUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return DataBaseSuccess(data: userCredential);
    } catch (e) {
      return DataBaseError(e.toString());
    }
  }
}

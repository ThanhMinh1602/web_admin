import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_admin/common/constants/define_collection.dart';
import 'package:web_admin/entities/models/login_request.dart';
import 'package:web_admin/entities/models/signup_request.dart';
import 'package:web_admin/entities/models/user_model.dart';
import 'package:web_admin/services/sevice_status.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<SignupResult> signUpWithEmail(SignupRequest signupRequest) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupRequest.email,
        password: signupRequest.password,
      );
      String uid = userCredential.user!.uid;
      final usermodel = UserModel(
          email: signupRequest.email,
          password: signupRequest.password,
          avatar: 'https://avatar-management.services.atlassian.com/default/16',
          name: signupRequest.name);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(usermodel.toJson());
      return SignupResult.success;
    } catch (e) {
      return SignupResult.emailAlreadyExists;
    }
  }

  Future<bool?> checkRole(String email) async {
    try {
      final querySnapshot = await _firestore
          .collection(AppDefineCollection.APP_USER)
          .where('email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final role = querySnapshot.docs.first;
        if (role['role'] == 'admin') {
          return true;
        } else if (role['role'] == 'staff') {
          return false;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error checking role: $e');
    }
  }

  Future<SigninResult> signInWithEmail(LoginRequest loginRequest) async {
    try {
      final check = await checkRole(loginRequest.email);
      if (check == true) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password,
        );
        return SigninResult.successIsAdmin;
      } else if (check == false) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password,
        );
        return SigninResult.successIsStaff;
      } else {
        return SigninResult.failure;
      }
    } catch (e) {
      return SigninResult.failure;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'Không tìm thấy người dùng. Vui lòng đăng nhập lại.',
        );
      }
      await currentUser.updatePassword(newPassword);
      _firestore
          .collection(AppDefineCollection.APP_USER)
          .doc(currentUser.uid)
          .update({'password': newPassword});
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<UserModel>> fetchUser() async {
    try {
      final queryData =
          await _firestore.collection(AppDefineCollection.APP_USER).get();
      var userData =
          queryData.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      return userData;
    } catch (e) {
      rethrow;
    }
  }
}

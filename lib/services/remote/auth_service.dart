import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_admin/common/constants/define_collection.dart';
import 'package:web_admin/entities/models/requests/login_request.dart';
import 'package:web_admin/entities/models/requests/signup_request.dart';
import 'package:web_admin/entities/models/requests/user_model.dart';
import 'package:web_admin/services/sevice_status.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<SignupResult> signUpWithEmail(SignupRequest signupRequest) async {
    try {
      final auth = await FirebaseAuth.instance
          // ignore: deprecated_member_use
          .fetchSignInMethodsForEmail(signupRequest.email);
      if (auth.isNotEmpty) {
        return SignupResult.emailAlreadyExists;
      }
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

  Future<bool> checkAdmin(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppDefineCollection.APP_ADMIN_ACCOUNT)
          .where('email', isEqualTo: email)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      throw Exception('Error checking admin: $e');
    }
  }

  Future<SigninResult> signInWithEmail(LoginRequest loginRequest) async {
    try {
      final isAdmin = await checkAdmin(loginRequest.email);
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );

      if (result.user != null) {
        if (isAdmin) {
          return SigninResult.successIsAdmin;
        } else {
          return SigninResult.successIsUser;
        }
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

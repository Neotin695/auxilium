import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  static final AuthController instance = AuthController._instance();

  AuthController._instance();

  late final FirebaseAuth _auth;

  User? user;

  init() {
    _auth = FirebaseAuth.instance;
  }

  Future<bool> register({
    required String? email,
    required String? password,
  }) async {
    user = (await _auth.createUserWithEmailAndPassword(
      email: email ?? '',
      password: password ?? '',
    ))
        .user;

    if (user != null) {
      // PreferencesHelper.instance.setUser(
      //   UserModel(
      //     name: user?.displayName,
      //     email: user?.email,
      //   ),
      // );
      return true;
    } else {
      return false;
    }
  }
}

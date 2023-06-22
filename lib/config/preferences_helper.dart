import 'dart:convert';

import 'package:auxilium2/model/user_model.dart';
import 'package:auxilium2/view/screens/splash_screen.dart';
import 'package:flutter/Material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static final PreferencesHelper instance = PreferencesHelper._init();

  PreferencesHelper._init();

  static const String isOpenedKey = 'is_opened';

  static const String signed = 'signed';

  static const String user = 'user';
  static const String userAdmin = 'adminUser';


  static SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool getIsOpened() {
    return _preferences?.getBool(isOpenedKey) ?? false;
  }

  UserModel? getUser() {
    String? json = _preferences?.getString(user);
    return json == null ? null : UserModel.fromMap(jsonDecode(json));
  }
  UserModel? getUserAdmin() {
    String? json = _preferences?.getString(userAdmin);
    return json == null ? null : UserModel.fromMap(jsonDecode(json));
  }

  bool getSigned() {
    return _preferences?.getBool(signed) ?? false;
  }

  Future<void> setUser(UserModel? value) async
  {
    if (value == null) return;
    String json = jsonEncode(value.toMap());

    _preferences!.setString(user, json);
    setSigned(true);
  }
  Future<void> setAdminUser(UserModel? value) async
  {
    if (value == null) return;
    String json = jsonEncode(value.toMap());
    _preferences!.setString(userAdmin, json);
    setSigned(true);
  }
  Future<void> setIsOpened(bool value) async {
    _preferences!.setBool(isOpenedKey, value);
  }

  Future<void> setSigned(bool value) async {
    _preferences!.setBool(signed, value);
  }

  void clearAllData() {
    _preferences!.clear();
  }

  void logout(BuildContext context) {
    // clearItem(isOpenedKey);
    clearItem(signed);
    clearItem(user);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      ),
      (route) => false,
    );
  }

  void clearItem(String key) {
    _preferences!.remove(key);
  }
}

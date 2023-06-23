import 'package:auxilium2/controller/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/Material.dart';

import '../config/preferences_helper.dart';
import 'auth_controller.dart';

class DI {
  static final DI instance = DI._instance();

  DI._instance();

  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await NotificationSerivce.instance().initializeNotification();
    await Firebase.initializeApp();
    PreferencesHelper.instance.init();
    AuthController.instance.init();
  }
}

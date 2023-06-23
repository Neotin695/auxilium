import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:auxilium2/view/screens/patient_screens/medicine_screens/manage_medicine.dart';

class NotificationSerivce {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final NotificationSerivce _notificationSerivce =
      NotificationSerivce.__internal();
  factory NotificationSerivce.instance() => _notificationSerivce;
  NotificationSerivce.__internal();
  Future<void> initializeNotification() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('drawable/ic_launcher');

    tz.initializeTimeZones();
    //final timeZone = DateTime.now().timeZoneName.toString();

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body,
      DateTime dateTime, Repeat repeat) async {
    tz.TZDateTime date = tz.TZDateTime.from(dateTime, tz.local);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        _handleDateTime(date, repeat),
        NotificationDetails(
            android: AndroidNotificationDetails(id.toString(), 'basic_channel',
                importance: Importance.max,
                priority: Priority.max,
                icon: 'drawable/ic_launcher')),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _handleDateTime(tz.TZDateTime date, Repeat repeat) {
    if (date.isBefore(tz.TZDateTime.now(tz.local))) {
      if (repeat == Repeat.daily) {
        date = tz.TZDateTime(tz.local, date.year, date.month, (date.day) + 1,
            date.hour, date.minute, date.second);
      } else if (repeat == Repeat.weekly) {
        date = tz.TZDateTime(tz.local, date.year, date.month, (date.day) + 7,
            date.hour, date.minute, date.second);
      } else if (repeat == Repeat.monthly) {
        date = tz.TZDateTime(tz.local, date.year, (date.month) + 1, date.day,
            date.hour, date.minute, date.second);
      }
    }

    date = date.subtract(const Duration(minutes: 1));
    return date;
  }
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:silaper_korang/common/constans.dart';
import 'package:silaper_korang/model/singleton_model.dart';
import 'package:silaper_korang/tool/helper.dart';

class FcmService {
  FirebaseMessaging? _messaging;
  late FlutterLocalNotificationsPlugin _localNotification;
 late Helper _helper;
late  SingletonModel _model;


  void _instance() {
    _helper =  Helper();
    _model = SingletonModel.shared;
    if (_messaging == null) {
      _localNotification = FlutterLocalNotificationsPlugin();
      FirebaseMessaging m = FirebaseMessaging.instance;
      _messaging = m;
    }
  }

  Future init() async {
    _instance();
    _configLocalNotification();
    _messaging!.requestPermission(
      alert: true,
      criticalAlert: true,
      badge: true,
      provisional: true,
      sound: true,
    );
    _messaging!.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message.notification!);
      _checkNotif(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _checkNotif(message);
    });
  }

  void _configLocalNotification() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    _localNotification.initialize(initializationSettings);
  }

  void _showNotification(RemoteNotification notification) async {
    DateTime now = DateTime.now();

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      kGPackageName,
      kGAppName,
      kGAppName,
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(notification.title!),
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _localNotification.show(
      now.hour + now.minute + now.second,
      "${notification.title}",
      "${notification.body}",
      platformChannelSpecifics,
    );
  }

  void _checkNotif(RemoteMessage msg) async {
    // _model = SingletonModel.shared;
    // if (msg.data.containsKey("chat_room") &&
    //     (!msg.data.containsKey("is_session") ||
    //         (msg.data.containsKey("is_session") &&
    //             msg.data["is_session"].toString() == "true"))) {
    //   DocumentReference r = Firestore.chatRoom.doc(msg.data["chat_room"]);
    //   _helper.backToRootPage(_model.context);
    //   _helper.jumpToPage(_model.context, page: ChatDetailPage(room: r));
    // }
    //
    // if (msg.data.containsKey("order_id")) {
    //   _helper
    //       .showToast("Payment Success for Order Id : ${msg.data["order_id"]}");
    //   Navigator.pop(_model.context);
    // }
  }

  Future getToken() async {
    _instance();
    return await _messaging!.getToken();
  }
}

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? mtoken = '';
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //controllers to type in and post message to the cloud server
  TextEditingController username = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   //requestPermission(); for notification
  //   requestPermission();
  //   //getToken(); to connect with Firbase
  //   getToken();
  //   //initInfo(); to load the information
  //   //initInfo();
  //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  // }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('title: ${message.notification?.title}');
    print('body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }

  // initInfo() {
  //   var androidInitialize = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var iosInitialize = DarwinInitializationSettings();
  //   var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iosInitialize);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) async {
  //     try {
  //       if (payload != null && payload.isNotEmpty) {
  //       } else {
  //         print('Notification clicked');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //     return;
  //   });
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
  //     print('..........onMessage: ........');
  //     print('onMessage: ${message.notification?.title}/${message.notification?.body})');
  //     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
  //       message.notification!.body.toString(),
  //       htmlFormatBigText: true,
  //       contentTitle: message.notification!.title.toString(),
  //       htmlFormatContentTitle: true,
  //       summaryText: 'Summary',
  //       htmlFormatSummaryText: true,
  //     );
  //    })
  // }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    } else {
      print('user declined or has not accepted permission');
    }
  }

  /// these are per device tokens, therefore if saved as a User2, the token is going to be the same
  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print('My token is $mtoken');
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection('UserTokens').doc('User1').set({
      'token': token,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: username,
            ),
            TextFormField(
              controller: title,
            ),
            TextFormField(
              controller: body,
            ),
            GestureDetector(
              onTap: () {
                String name = username.text.trim();
                String titleText = title.text;
                String bodyText = body.text;
              },
              child: Container(
                margin: EdgeInsets.all(20),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'BUTTON',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

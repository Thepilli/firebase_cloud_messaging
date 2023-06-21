// ignore_for_file: unnecessary_string_interpolations

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notification_screen';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('title: ${message.notification?.title}'),
            Text('body: ${message.notification?.body}'),
            Text('data: ${message.data}'),
          ],
        ),
      ),
    );
  }
}

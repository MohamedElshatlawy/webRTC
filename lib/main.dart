import 'dart:math';

import 'package:flutter/material.dart';
import 'screens/join_screen.dart';
import 'services/signalling.service.dart';

void main() {
  // start videoCall app
  runApp(VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  VideoCallApp({super.key});

  // signalling server url
  //final String websocketUrl = "ws://10.0.2.2:8080";
  final String websocketUrl = "ws://192.168.1.2:8080";

  // generate callerID of local user
  final String selfCallerID =
      Random().nextInt(999999).toString().padLeft(6, '0');

  @override
  Widget build(BuildContext context) {
    // init signalling service
    SignallingService.instance.init(
      websocketUrl: websocketUrl,
      selfCallerID: selfCallerID,
    );

    // return material app
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
      ),
      themeMode: ThemeMode.dark,
      home: JoinScreen(selfCallerId: selfCallerID),
    );
  }
}

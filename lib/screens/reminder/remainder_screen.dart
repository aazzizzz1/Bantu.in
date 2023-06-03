import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_remainder.dart';
import 'alarm.dart';

class RemainderScreen extends StatefulWidget {
  const RemainderScreen({Key? key}) : super(key: key);

  @override
  _RemainderScreenState createState() => _RemainderScreenState();
}

class _RemainderScreenState extends State<RemainderScreen> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Alarm.init(showDebugLogs: true);
    prefs = await SharedPreferences.getInstance(); // Initialize prefs
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remainder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleAlarmHomeScreen(),
    );
  }
}

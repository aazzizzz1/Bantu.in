import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_remainder.dart';

class RemainderScreen extends StatefulWidget {
  const RemainderScreen({Key? key}) : super(key: key);

  @override
  _RemainderScreenState createState() => _RemainderScreenState();
}

class _RemainderScreenState extends State<RemainderScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Alarm.init(showDebugLogs: true);
    prefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Remainder'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //       },
      //       icon: const Icon(Icons.add),
      //     ),
      //   ],
      // ),
      body: Container(
        child: ExampleAlarmHomeScreen(),
      ),
    );
    // MaterialApp(
    //   title: 'Remainder',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: ExampleAlarmHomeScreen(),
    // );
  }
}

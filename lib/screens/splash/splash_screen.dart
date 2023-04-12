import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget textFlicker = Container(
    alignment: Alignment.center,
    width: 300.0,
    child: DefaultTextStyle(
      textAlign: TextAlign.center,
      style: GoogleFonts.josefinSans(
        textStyle: const TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 237, 247, 246),
          shadows: [
            Shadow(
              blurRadius: 15.0,
              color: Color.fromARGB(255, 15, 244, 179),
              offset: Offset(0, 0),
            ),
            Shadow(
              blurRadius: 20.0,
              color: Color.fromARGB(255, 15, 244, 179),
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 1500),
        totalRepeatCount: 5,
        repeatForever: true,
        animatedTexts: [
          FlickerAnimatedText('WELCOME IN'),
          FlickerAnimatedText('BANTU.IN'),
        ],
      ),
    ),
  );

  Widget textLiquid = SizedBox(
    width: 250.0,
    child: TextLiquidFill(
      text: 'BANTU.IN',
      waveColor: Colors.blueAccent,
      boxBackgroundColor: Colors.redAccent,
      textStyle: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
      ),
      boxHeight: 300.0,
    ),
  );

  setdata(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 10250), () {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BottomMenu(
            currentTab: 0,
            currentScreen: HomePages(),
          );
        }));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setdata(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            width: MediaQuery.of(context).size.width - 50,
            child: TextLiquidFill(
              text: 'BANTU.IN',
              waveColor: Colors.blueAccent,
              loadDuration: Duration(seconds: 10),
              waveDuration: Duration(seconds: 3),
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 55.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 100.0,
            ),
          ),
          // Container(
          //   //create button to navigate to home
          //   child: Center(
          //     child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) {
          //           return BottomMenu(
          //             currentTab: 0,
          //             currentScreen: HomePages(),
          //           );
          //         }));
          //       },
          //       child: const Text('Go to Home'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

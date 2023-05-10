import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bantuin/screens/auth/login_screen.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/font/app_font.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BottomMenu(currentTab: 0, currentScreen: const HomePages())),
      ),
    );
    // Future.delayed(
    //   const Duration(milliseconds: 3000),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const LoginScreen()),
    //   ),
    // );
  }

  // setdata(BuildContext context) async {
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     SchedulerBinding.instance.addPostFrameCallback((_) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const LoginScreen()),
  //       );
  //       // Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       //   return BottomMenu(
  //       //     currentTab: 0,
  //       //     currentScreen: const HomePages(),
  //       //   );
  //       // }));
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // setdata(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('lib/assets/images/Gif SplashScreen.gif'),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SvgPicture.asset(
        //       'lib/assets/images/logoApp.svg',
        //       width: 200,
        //       height: 100,
        //     ),
        //     const SizedBox(height: 16),
        //     Text(
        //       'Selamat Datang di Bantu.in',
        //       style: AppFont.semiBold20,
        //     ),
        //     // Container(
        //     //   alignment: Alignment.center,
        //     //   height: 300,
        //     //   width: MediaQuery.of(context).size.width - 50,
        //     //   child: TextLiquidFill(
        //     //     text: 'BANTU.IN',
        //     //     waveColor: Colors.blueAccent,
        //     //     loadDuration: Duration(seconds: 10),
        //     //     waveDuration: Duration(seconds: 3),
        //     //     boxBackgroundColor: Colors.white,
        //     //     textStyle: TextStyle(
        //     //       fontSize: 55.0,
        //     //       fontWeight: FontWeight.bold,
        //     //     ),
        //     //     boxHeight: 100.0,
        //     //   ),
        //     // ),
        //     // Container(
        //     //   //create button to navigate to home
        //     //   child: Center(
        //     //     child: ElevatedButton(
        //     //       onPressed: () {
        //     //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     //           return BottomMenu(
        //     //             currentTab: 0,
        //     //             currentScreen: HomePages(),
        //     //           );
        //     //         }));
        //     //       },
        //     //       child: const Text('Go to Home'),
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}

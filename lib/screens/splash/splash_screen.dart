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
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // setdata(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'lib/assets/images/Bantuin 2 GIF.gif',
          height: 180,
          width: 180,
        ),
      ),
    );
  }
}

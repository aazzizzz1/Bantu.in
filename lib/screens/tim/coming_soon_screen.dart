import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoonScreen extends StatelessWidget {
  ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 76,
        title: Text(
          'Tim',
          style: AppFont.regular20,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/icons/Logo Apps Bantuin.png',
              height: 200,
              width: 200,
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'COMING SOON',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: AppColorPrimary.primary5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

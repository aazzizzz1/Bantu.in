import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/tim/tim_form.dart';
import 'package:bantuin/widgets/floating_button/floating_tim.dart';
import 'package:flutter/material.dart';

class TimScreen extends StatefulWidget {
  const TimScreen({super.key});

  @override
  State<TimScreen> createState() => _TimScreenState();
}

class _TimScreenState extends State<TimScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Tim',
          style: AppFont.semiBold20,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(),
      floatingActionButton: FloatingButtonTim(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TimForm(),
            ),
          );
        },
      ),
    );
  }
}
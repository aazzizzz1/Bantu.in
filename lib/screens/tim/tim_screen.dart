import 'package:bantuin/components/list_daftar_tim.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/tim/tim_card_group.dart';
import 'package:bantuin/screens/tim/tim_card_screen.dart';
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
          style: AppFont.regular20,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListDaftarTim(),
        ],
      ),
      // Container(
      //   child: TextButton(
      //     child: Text('Come in'),
      //     onPressed: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => TimCardScreen(),
      //       ));
      //     },
      //   ),
      // ),
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

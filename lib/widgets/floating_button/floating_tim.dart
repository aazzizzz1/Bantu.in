import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingButtonTim extends StatelessWidget {
  final Function onPressed;

  FloatingButtonTim({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: FloatingActionButton(
        onPressed: () => onPressed(),
        child: SvgPicture.asset(
          "lib/assets/icons/Add Team 2.svg",
          height: 26,
          width: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}

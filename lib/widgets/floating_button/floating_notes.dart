import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingButtonNotes extends StatelessWidget {
  final Function onPressed;

  FloatingButtonNotes({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: FloatingActionButton(
        onPressed: () => onPressed(),
        child: SvgPicture.asset(
          "lib/assets/icons/Add Task.svg",
          height: 26,
          width: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
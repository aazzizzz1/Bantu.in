import 'package:flutter/material.dart';

class FloatingButtonNotes extends StatelessWidget {
  final Function onPressed;

  FloatingButtonNotes({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      child: Icon(Icons.add),
    );
  }
}
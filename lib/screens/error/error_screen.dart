import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //create note screen text in middle
      child: const Center(
        child: Text('Error Screen please go back'),
      ),
    );
  }
}
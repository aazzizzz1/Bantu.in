import 'package:flutter/material.dart';

class TimScreen extends StatefulWidget {
  const TimScreen({super.key});

  @override
  State<TimScreen> createState() => _TimScreenState();
}

class _TimScreenState extends State<TimScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //create note screen text in middle
      child: const Center(
        child: Text('Tim Screen'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //create note screen text in middle
      child: const Center(
        child: Text('Note Invitation'),
      ),
    );
  }
}
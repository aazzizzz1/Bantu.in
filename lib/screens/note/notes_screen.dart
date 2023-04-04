import 'package:bantuin/components/floating_notes.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pages Bantuin'),
      ),
      body: Stack(
        children: [
          // content of the page
          Center(
            child: Text('Hello World'),
          ),
          // floating button above bottom navbar
          Positioned(
            bottom: 20,
            right: 16.0,
            child: FloatingButtonNotes(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoteScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
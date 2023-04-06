import 'package:flutter/material.dart';

class NotesDetail extends StatefulWidget {
  const NotesDetail({super.key});

  @override
  State<NotesDetail> createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Notes'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text('Detail Notes'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        )
      ),
    );
  }
}

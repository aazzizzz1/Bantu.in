import 'package:bantuin/components/floating_home.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
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
            bottom: 80,
            right: 16.0,
            child: FloatingButtonHome(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotesForm()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

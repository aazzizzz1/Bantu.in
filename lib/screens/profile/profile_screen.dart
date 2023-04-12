import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String text = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // create note screen text in middle
        child: Column(
          children: [
            // Text("$text"),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       var url = Uri.parse('http://bantuin.fly.dev/api/notes/');
            //       var response = await http.get(url);
            //       var responseBody =
            //           json.decode(response.body)['data'][0]['subject'];
            //       print(responseBody);
            //       setState(() {
            //         text = responseBody;
            //       });
            //     },
            //     child: Text('testing'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

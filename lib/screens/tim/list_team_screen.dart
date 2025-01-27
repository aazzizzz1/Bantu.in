import 'package:bantuin/components/list_daftar_tim.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/tim/card_team.dart';
import 'package:bantuin/screens/tim/team_screen.dart';
import 'package:bantuin/screens/tim/tim_form.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:bantuin/widgets/floating_button/floating_tim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimScreen extends StatefulWidget {
  const TimScreen({super.key});

  @override
  State<TimScreen> createState() => _TimScreenState();
}

class _TimScreenState extends State<TimScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() =>
        Provider.of<TeamViewModel>(context, listen: false).fetchAllTeam());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 76,
        title: Text(
          'Tim',
          style: AppFont.regular20,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListDaftarTim(),
        ],
      ),
      // Container(
      //   child: TextButton(
      //     child: Text('Come in'),
      //     onPressed: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => TimCardScreen(),
      //       ));
      //     },
      //   ),
      // ),
      floatingActionButton: FloatingButtonTim(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TimForm(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/tim/list_team_screen.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../models/post_tim_model.dart';

class ButtonFormToScreenTim extends StatelessWidget {
  final PostTimModel timModel;

  const ButtonFormToScreenTim({Key? key, required this.timModel});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                height: 44,
                child: Consumer<TeamViewModel>(
                  builder: (context, value, child) => ElevatedButton(
                    onPressed: () async {
                      print(timModel.title);
                      try {
                        await value
                            .addTeam(timModel)
                            .then((value) => Fluttertoast.showToast(
                                msg: 'Berhasil membuat tim'))
                            .then((value) => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BottomMenu(
                                    currentTab: 2,
                                    currentScreen: const TimScreen(),
                                  );
                                })));
                      } catch (e) {
                        await Fluttertoast.showToast(msg: e.toString());
                      }
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return BottomMenu(
                      //     currentTab: 2,
                      //     currentScreen: const TimScreen(),
                      //   );
                      // }));
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                      ),
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.activeColor),
                    ),
                    child: Center(
                      child: Text(
                        'Buat Tim',
                        style: AppFont.textFillButtonActive,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

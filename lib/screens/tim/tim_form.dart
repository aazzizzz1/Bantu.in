import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/tim/tim_screen.dart';
import 'package:bantuin/widgets/notes/email_picker.dart';
import 'package:bantuin/widgets/team/button_form_to_screen_tim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../models/post_tim_model.dart';
import '../../view_models/tim_view_model.dart';
import '../../widgets/bottom_navigation/bottom_menu.dart';

class TimForm extends StatefulWidget {
  const TimForm({super.key});

  @override
  State<TimForm> createState() => _TimFormState();
}

class _TimFormState extends State<TimForm> {
  List<String> _selectedEmails = [];

  void _handleEmailsChanged(List<String> selectedEmails) {
    _selectedEmails = selectedEmails;
    // setState(() {
    // });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController timNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buat Tim",
                  style: AppFont.textTitleScreen,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Nama Tim",
                  style: AppFont.medium14,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  controller: timNameController,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Tulis Nama Tim',
                    hintStyle: AppFont.hintTextField,
                    fillColor: AppColorNeutral.neutral1,
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorPrimary.primary6)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColorNeutral.neutral2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColorNeutral.neutral2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Masukan email anggota",
                  style: AppFont.medium14,
                ),
                const SizedBox(
                  height: 4,
                ),
                MultipleEmailPicker(onChanged: _handleEmailsChanged),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
                        try {
                          await value
                              .addTeam(PostTimModel(
                                  title: timNameController.text,
                                  email: _selectedEmails))
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
      ),

      // bottomNavigationBar: ButtonFormToScreenTim(
      //     timModel: PostTimModel(
      //         title: timNameController.text, email: _selectedEmails)),
    );
  }
}

import 'package:bantuin/models/post_tim_model.dart';
import 'package:bantuin/models/tim_model.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';

class TimAddMember extends StatefulWidget {
  final TeamDetailModel teamDetail;
  const TimAddMember({super.key, required this.teamDetail});

  @override
  State<TimAddMember> createState() => _TimAddMemberState();
}

class _TimAddMemberState extends State<TimAddMember> {
  TextEditingController _emailController = TextEditingController();
  List<String> _emails = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addEmail() {
    final String email = _emailController.text.trim();
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      setState(() {
        _emails.add(email);
        _emailController.clear();
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Email tidak valid"),
              content: Text("Masukan email yang sesuai"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  void _removeEmail(int index) {
    setState(() {
      _emails.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        backgroundColor: Colors.white,
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          alignment: Alignment.center,
          splashColor: AppColorNeutral.neutral1,
          splashRadius: 25,
          iconSize: 30,
        ),
        elevation: 1,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah anggota',
              style: AppFont.textTitleScreen,
            ),
            const SizedBox(height: 26.0),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masukkan email anggota',
                    style: AppFont.labelTextForm,
                  ),
                  const SizedBox(height: 10.0),
                  Wrap(
                    spacing: 8.0,
                    children: _emails.map((email) {
                      return InputChip(
                        label: Text(email),
                        onDeleted: () => _removeEmail(_emails.indexOf(email)),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    controller: _emailController,
                    scrollPadding: const EdgeInsets.only(left: 10),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != null) {
                        final email = value.trim();
                        if (email.isNotEmpty &&
                            !EmailValidator.validate(email)) {
                          return 'Masukan email yang sesuai';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColorNeutral.neutral1,
                      hintText: 'Masukan email anggota',
                      hintStyle: AppFont.hintTextField,
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
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorPrimary.primary6)),
                      errorStyle: AppFont.errorTextForm,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'lib/assets/icons/Contact.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  ElevatedButton(
                    onPressed: _addEmail,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      elevation: MaterialStatePropertyAll(0),
                    ),
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: AppColorPrimary.primary6,
                          ),
                          const SizedBox(width: 16.0),
                          Text(
                            'Tambahkan Email',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: AppColorPrimary.primary6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<TeamViewModel>(
              builder: (context, team, child) {
                return Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await team
                              .editTeam(
                                widget.teamDetail,
                                PostTimModel(
                                  title: widget.teamDetail.title,
                                  email: _emails,
                                ),
                              )
                              .then((value) => Fluttertoast.showToast(
                                  msg: 'Berhasil menambahkan anggota'))
                              .then((value) => Navigator.pop(context));
                        } catch (e) {
                          await Fluttertoast.showToast(msg: e.toString());
                        }
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.activeColor),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Tambah anggota',
                          style: AppFont.textFillButtonActive,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

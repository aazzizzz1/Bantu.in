import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constant.dart';

class TimAddMember extends StatefulWidget {
  const TimAddMember({super.key});

  @override
  State<TimAddMember> createState() => _TimAddMemberState();
}

class _TimAddMemberState extends State<TimAddMember> {
  final _emailController = TextEditingController();
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
                  TextFormField(
                    controller: _emailController,
                    scrollPadding: const EdgeInsets.only(left: 10),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Anda belum mengisi email anggota';
                      }
                      if (EmailValidator.validate(_emailController.text)) {
                        return 'Email yang anda masukan belum sesuai';
                      }
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
                    onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}

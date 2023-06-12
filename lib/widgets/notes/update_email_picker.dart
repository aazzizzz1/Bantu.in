import 'package:bantuin/constants/constant.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/note_model.dart';

class UpdateEmailPicker extends StatefulWidget {
  final void Function(List<String> selectedEmails) onChanged;
  final List<MemberDetailModel> memberEmails;
  final NoteDetailModel noteDetail;

  const UpdateEmailPicker({
    Key? key,
    required this.onChanged,
    required this.memberEmails,
    required this.noteDetail,
  }) : super(key: key);

  @override
  _UpdateEmailPickerState createState() => _UpdateEmailPickerState();
}

class _UpdateEmailPickerState extends State<UpdateEmailPicker> {
  List<String> _emails = [];
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> dataApi = [];

  @override
  void initState() {
    // TODO: implement initState
    for (var index = 0; index < widget.memberEmails.length; index++) {
      dataApi.add(widget.memberEmails[index].email);
    }
    // _emails = dataApi;
    super.initState();
  }

  void _addEmail() {
    final String email = _emailController.text.trim();
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      setState(() {
        _emails.add(email);
        _emailController.clear();
        widget.onChanged(_emails); // Call the onChanged callback
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
      widget.onChanged(_emails); // Call the onChanged callback
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0,
          children: dataApi.map((email) {
            return Consumer<NoteViewModel>(
              builder: (context, note, child) {
                return InputChip(
                  label: Text(email),
                  onDeleted: () async {
                    try {
                      await note
                          .removeMember(widget.noteDetail, email)
                          .then((value) => _removeEmail(dataApi.indexOf(email)))
                          .then((value) => Fluttertoast.showToast(
                              msg: 'Member berhasil di hapus'));
                    } catch (e) {
                      await Fluttertoast.showToast(msg: e.toString());
                    }
                    // _removeEmail(_emails.indexOf(email));
                  },
                );
              },
            );
          }).toList(),
        ),
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
          keyboardType: TextInputType.emailAddress,
          style: AppFont.medium14,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Masukan email anggota',
            hintStyle: AppFont.hintTextField,
            fillColor: AppColorNeutral.neutral1,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColorPrimary.primary6)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColorNeutral.neutral2),
              borderRadius: BorderRadius.circular(3),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColorNeutral.neutral2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          validator: (value) {
            if (value != null) {
              final email = value.trim();
              if (email.isNotEmpty && !EmailValidator.validate(email)) {
                return 'Masukan email yang sesuai';
              }
            }
            return null;
          },
        ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: _addEmail,
          child: Row(
            children: [
              IconButton(
                onPressed: _addEmail,
                icon: Icon(Icons.add),
                color: AppColorPrimary.primary6,
              ),
              TextButton(
                onPressed: _addEmail,
                child: Text(
                  'Tambahkan Email',
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: AppColorPrimary.primary6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

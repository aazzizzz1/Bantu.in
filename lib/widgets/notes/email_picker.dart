import 'package:bantuin/constants/constant.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class MultipleEmailPicker extends StatefulWidget {
  final void Function(List<String> selectedEmails) onChanged;

  const MultipleEmailPicker({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MultipleEmailPickerState createState() => _MultipleEmailPickerState();
}

class _MultipleEmailPickerState extends State<MultipleEmailPicker> {
  final List<String> _emails = [];
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addEmail() {
    final String email = _emailController.text.trim();
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      setState(() {
        _emails.add(email);
        _emailController.clear();
        widget.onChanged(_emails); // Call the onChanged callback
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            decoration: InputDecoration(
              labelText: 'Masukkan email',
              labelStyle: AppFont.hintTextField,
              border: OutlineInputBorder(),
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
                IconButton(onPressed: _addEmail, icon: Icon(Icons.add), color: AppColorPrimary.primary6,),
                TextButton(
                  onPressed: _addEmail,
                  child: Text(
                    'Tambahkan Email',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
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
      ),
    );
  }
}

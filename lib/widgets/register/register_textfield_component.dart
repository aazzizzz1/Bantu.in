import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class TextFieldComponent extends StatefulWidget {
  final String label;
  final String hint;
  final String type;
  final String? description;
  final TextEditingController controller;
  bool? obscure;
  final bool? passwordConfirm;
  final String? password;
  final String? confirm;
  final bool? email;
  final IconData? icon;

  TextFieldComponent({
    super.key,
    required this.label,
    required this.hint,
    required this.type,
    this.description,
    required this.controller,
    this.obscure,
    this.passwordConfirm,
    this.password,
    this.confirm,
    this.email,
    this.icon,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppFont.labelTextForm,
        ),
        const SizedBox(height: 4),
        TextFormField(
          scrollPadding: const EdgeInsets.only(left: 10),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          obscureText: widget.obscure == null ? false : widget.obscure!,
          inputFormatters: widget.obscure != null
              ? [
                  LengthLimitingTextInputFormatter(16),
                  FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z0-9 !@#\$%^&*()_+-]+"),
                              ),
                ]
              : null,
          validator: (value) {
            print(value);
            if (value!.isEmpty) {
              return 'Maaf anda belum memasukan ${widget.type} anda';
            } else {
              if (widget.email != null) {
                return EmailValidator.validate(value)
                    ? null
                    : 'Maaf email anda tidak valid';
              } else if (widget.obscure != null) {
                bool passValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);
                return passValid
                    ? null
                    : 'Maaf kata sandi anda belum memenuhi kriteria';
              }
              // else if (widget.passwordConfirm != null) {
              //   return widget.password != widget.confirm
              //       ? 'Maaf kata sandi anda belum sesuai dengan sebelumnya'
              //       : null;
              // }
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColorNeutral.neutral1,
            hintText: widget.hint,
            hintStyle: AppFont.hintTextField,
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
            errorBorder: InputBorder.none,
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColorPrimary.primary6)),
            errorStyle: AppFont.errorTextForm,
            suffixIcon: widget.icon != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.obscure!) {
                          widget.obscure = false;
                        } else {
                          widget.obscure = true;
                        }
                      });
                    },
                    icon: Icon(
                      widget.icon,
                      color: Colors.black,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 4.0),
        widget.description != null
            ? Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  widget.description!,
                  style: AppFont.labelTextForm,
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

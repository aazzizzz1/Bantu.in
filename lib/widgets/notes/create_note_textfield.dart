import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/constant.dart';

class CreateNoteTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String message;
  final TextEditingController controller;
  final bool? isSubject;

  const CreateNoteTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.message,
    required this.controller,
    this.isSubject,
  });

  @override
  State<CreateNoteTextField> createState() => _CreateNoteTextFieldState();
}

class _CreateNoteTextFieldState extends State<CreateNoteTextField> {
  late var timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      widget.controller.addListener(() {
        setState(() {});
      });
      // timer =
      //     Timer.periodic(Duration(seconds: 60), (Timer t) => setState(() {}));
    }
  }

  // @override
  // // void dispose() {
  // //   // timer.cancel();
  // //   // widget.controller.dispose();
  // //   super.dispose();
  // // }

  @override
  Widget build(BuildContext context) {
    int maxLength = 250;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == 'Subjek'
            //Another field
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: widget.label, style: AppFont.labelTextForm),
                    TextSpan(text: ' *', style: AppFont.textStatusError),
                  ],
                ),
              )
            //Description field
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: widget.label, style: AppFont.labelTextForm),
                        TextSpan(text: ' *', style: AppFont.textStatusError),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '${widget.controller.text.length}',
                            style: AppFont.labelTextForm),
                        TextSpan(
                            text: '/$maxLength', style: AppFont.labelTextForm),
                      ],
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: AppFont.medium14,
          buildCounter: (context,
                  {required currentLength, required isFocused, maxLength}) =>
              const SizedBox(),
          keyboardType:
              widget.isSubject == null ? TextInputType.multiline : null,
          maxLines: widget.label == 'Subjek' ? null : 5,
          maxLength: widget.label == 'Subjek' ? 30 : maxLength,
          inputFormatters: widget.label == 'Subjek'
              ? []
              : [LengthLimitingTextInputFormatter(maxLength)],
          validator: (value) {
            if (value!.isEmpty) {
              return 'Anda belum mengisi ${widget.message}';
            }
          },
          decoration: InputDecoration(
            filled: true,
            hintText: widget.label == 'Subjek'
                ? 'Tulis ${widget.hint}'
                : 'Tulis ${widget.hint} catatan',
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
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColorNeutral.neutral2),
              borderRadius: BorderRadius.circular(3),
            ),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColorPrimary.primary6)),
          ),
        ),
      ],
    );
  }
}

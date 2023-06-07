import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class PopupDelete extends StatefulWidget {
  final NoteDetailModel noteDetail;
  const PopupDelete({super.key, required this.noteDetail});

  @override
  State<PopupDelete> createState() => _PopupDeleteState();
}

class _PopupDeleteState extends State<PopupDelete> {
  late TextEditingController _deleteController;
  final formKey = GlobalKey<FormState>();
  bool _isValidated = false;

  Future<String> validateMessage(String value) async {
    if (value == null || value.isEmpty) {
      return 'Anda belum mengisi pesan';
    } else {
      setState() {
        _isValidated = true;
      }

      return '';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteController = TextEditingController();
    _deleteController.addListener(() {
      final _buttonEnable = _deleteController.text.isNotEmpty;
      setState(() {
        this._isValidated = _buttonEnable;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _deleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Apakah anda yakin untuk menghapus catatan ini?',
        textAlign: TextAlign.center,
        style: AppFont.textSubjectOrTitle,
      ),
      content: Text(
        'Anda tidak dapat mengembalikan pesan ini setelah dihapus.',
        textAlign: TextAlign.center,
        style: AppFont.textDescription,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              widget.noteDetail.notesType == 'collaboration'
                  ? messageCollaboration()
                  : const SizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<NoteViewModel>(
                      builder: (context, value, child) => Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                                AppColorNeutral.neutral2),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 10),
                            ),
                            elevation: MaterialStatePropertyAll(0),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: AppColorNeutral.neutral2)),
                            backgroundColor: MaterialStatePropertyAll(
                              widget.noteDetail.notesType == 'collaboration'
                                  ? _isValidated
                                      ? Colors.white
                                      : AppColorNeutral.neutral2
                                  : Colors.white,
                            ),
                          ),
                          onPressed: widget.noteDetail.notesType ==
                                  'collaboration'
                              ? _isValidated
                                  ? () async {
                                      try {
                                        await value
                                            .deletePersonalNote(
                                                widget.noteDetail,
                                                _deleteController.text)
                                            .then((value) =>
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Note berhasil dihapus'))
                                            .then((value) =>
                                                Navigator.pop(context))
                                            .then((value) =>
                                                Navigator.pop(context));
                                      } catch (e) {
                                        await Fluttertoast.showToast(
                                            msg: e.toString());
                                      }
                                    }
                                  : null
                              : () {
                                  value
                                      .deletePersonalNote(widget.noteDetail, '')
                                      .then((value) => Fluttertoast.showToast(
                                          msg: 'Note berhasil dihapus'))
                                      .then((value) => Navigator.pop(context))
                                      .then((value) => Navigator.pop(context));
                                },
                          child: Text(
                            'Hapus',
                            style:
                                widget.noteDetail.notesType == 'collaboration'
                                    ? _isValidated
                                        ? AppFont.textButtonDisable
                                        : AppFont.hintTextField
                                    : AppFont.textButtonDisable,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(AppColorRed.red4),
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                          ),
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColorRed.red6),
                        ),
                        onPressed: () {
                          // Perform delete operation and navigate back to previous screen
                          // ...
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Batal',
                          style: AppFont.textFillButtonActive,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget messageCollaboration() {
    int maxLength = 250;
    return Form(
      key: formKey,
      child: SizedBox(
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: AppColorNeutral.neutral2,
            ),
            Text(
              "Pesan untuk dilaporkan kepada orang yang dilibatkan",
              textAlign: TextAlign.center,
              style: AppFont.textSubjectOrTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Pesan',
                            style: AppFont.labelTextForm,
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(
                              color: AppColor.errorColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${_deleteController.text.length}',
                            style: AppFont.labelTextForm,
                          ),
                          TextSpan(
                            text: '/$maxLength',
                            style: AppFont.labelTextForm,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _deleteController,
                  maxLines: 5,
                  // maxLength: maxLength,
                  keyboardType: TextInputType.multiline,
                  autovalidateMode: AutovalidateMode.always,
                  inputFormatters: [LengthLimitingTextInputFormatter(250)],
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Tulis pesan',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

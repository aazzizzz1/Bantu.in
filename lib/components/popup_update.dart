import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';
import '../models/post_note_model.dart';

class PopupUpdate extends StatefulWidget {
  final NoteDetailModel noteDetail;
  final PostNoteModel postNotePersonal;
  const PopupUpdate(
      {super.key, required this.noteDetail, required this.postNotePersonal});

  @override
  State<PopupUpdate> createState() => _PopupUpdateState();
}

class _PopupUpdateState extends State<PopupUpdate> {
  late TextEditingController _updateController;
  final formKey = GlobalKey<FormState>();
  bool _isValidated = false;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.postNotePersonal.email);
    super.initState();
    _updateController = TextEditingController();
    _updateController.addListener(() {
      final _buttonEnable = _updateController.text.isNotEmpty;
      setState(() {
        this._isValidated = _buttonEnable;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _updateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Apakah anda yakin untuk mengubah catatan ini?',
        textAlign: TextAlign.center,
        style: AppFont.textSubjectOrTitle,
      ),
      content: Text(
        'Anda dapat mengubah lagi sewaktu-waktu anda membutuhkan perubahan.',
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
                    Expanded(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(
                              AppColorNeutral.neutral2),
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                          ),
                          elevation: MaterialStatePropertyAll(0),
                          side: MaterialStatePropertyAll(
                              BorderSide(color: AppColorNeutral.neutral2)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          // Perform delete operation and navigate back to previous screen
                          // ...
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Batal',
                          style: AppFont.textButtonDisable,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Consumer<NoteViewModel>(
                        builder: (context, value, child) => ElevatedButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                                AppColorPrimary.primary2),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 10),
                            ),
                            elevation: MaterialStatePropertyAll(0),
                            // side: MaterialStatePropertyAll(
                            //     BorderSide(color: AppColorPrimary.primary6)),
                            backgroundColor: MaterialStatePropertyAll(
                              widget.noteDetail.notesType == 'collaboration'
                                  ? _isValidated
                                      ? AppColorPrimary.primary6
                                      : AppColorNeutral.neutral2
                                  : AppColorPrimary.primary6,
                            ),
                          ),
                          onPressed: widget.noteDetail.notesType ==
                                  'collaboration'
                              ? _isValidated
                                  //ISSCOLLAAABB
                                  ? () async {
                                      // Perform delete operation and navigate back to previous screen
                                      // ...
                                      // Navigator.pop(context);
                                      try {
                                        await value
                                            .updateCollaborationNote(
                                                widget.postNotePersonal,
                                                _updateController.text,
                                                widget.noteDetail)
                                            .then((value) => Fluttertoast.showToast(
                                                msg:
                                                    'Berhasil mengubah catatan'))
                                            .then((value) =>
                                                Navigator.pop(context))
                                            .then((value) =>
                                                Navigator.pop(context));
                                      } catch (e) {
                                        Fluttertoast.showToast(
                                            msg: e.toString());
                                      }
                                    }
                                  : null
                              //ISSPERSONAALLL
                              : () async {
                                  // Perform delete operation and navigate back to previous screen
                                  // ...
                                  // Navigator.pop(context);
                                  try {
                                    await value
                                        .updatePersonalNote(
                                            widget.postNotePersonal,
                                            widget.noteDetail)
                                        .then((value) => Fluttertoast.showToast(
                                            msg: 'Berhasil mengubah catatan'))
                                        .then((value) => Navigator.pop(context))
                                        .then(
                                            (value) => Navigator.pop(context));
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: e.toString());
                                  }
                                },
                          child: Text(
                            'Ubah',
                            style: AppFont.textFillButtonActive,
                          ),
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
                            text: '${_updateController.text.length}',
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
                  controller: _updateController,
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

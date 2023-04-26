import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class PopupDelete extends StatelessWidget {
  const PopupDelete({super.key});

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
                              text: '0',
                              style: AppFont.labelTextForm,
                            ),
                            TextSpan(
                              text: '/100',
                              style: AppFont.labelTextForm,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
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
                                EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 10),
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
                              // Navigator.pop(context);
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
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  AppColorPrimary.primary4),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 10),
                              ),
                              elevation: MaterialStatePropertyAll(0),
                              // side: MaterialStatePropertyAll(
                              //     BorderSide(color: AppColorPrimary.primary3)),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColorPrimary.primary5),
                            ),
                            onPressed: () {
                              // Perform delete operation and navigate back to previous screen
                              // ...
                              // Navigator.pop(context);
                            },
                            child: Text(
                              'Ya',
                              style: AppFont.textFillButtonActive,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

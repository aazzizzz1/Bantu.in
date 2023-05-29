import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';

class BottomSheetFilter extends StatefulWidget {
  final List<String> filter;
  final String typeNote;
  const BottomSheetFilter(
      {super.key, required this.filter, required this.typeNote});

  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  late List filterList = [];
  late double height;
  @override
  void initState() {
    // TODO: implement initState
    filterList = widget.filter;
    if (filterList.length < 3) {
      height = 0.2;
    } else {
      height = 0.35;
    }
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteViewModel>(
      builder: (context, note, child) => Container(
        height: MediaQuery.of(context).size.height * height,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: filterList
              .map((e) => ElevatedButton(
                    onPressed: () async {
                      try {
                        //UPCOMING NOTE
                        if (widget.typeNote == 'upcoming') {
                          if (filterList.length < 3) {
                            switch (filterList.indexOf(e)) {
                              case 0:
                                await note.filterAscUpcoming();
                                break;
                              default:
                                await note.filterDescUpcoming();
                            }
                          } else {
                            switch (filterList.indexOf(e)) {
                              case 0:
                                await note.filterUpcomingNote();
                                break;
                              case 1:
                                await note.filterIsUploadNote('no');
                                break;
                              case 2:
                                await note.filterIsUploadNote('yes');
                                break;
                              default:
                                await note.filterIsOwnerUpcoming();
                                break;
                            }
                          }
                        } else {
                          // PASSED NOTE
                          if (filterList.length < 3) {
                            switch (filterList.indexOf(e)) {
                              case 0:
                                await note.filterAscPassed();
                                break;
                              default:
                                await note.filterDescPassed();
                            }
                          } else {
                            switch (filterList.indexOf(e)) {
                              case 0:
                                await note.filterPassedNote();
                                break;
                              case 1:
                                await note.filterCompleteNote();
                                break;
                              case 2:
                                await note.filterLateNote();
                                break;
                              default:
                                await note.filterIsOwnerPassed();
                                break;
                            }
                          }
                        }
                        setState(() {});
                        Navigator.pop(context);
                      } catch (e) {
                        await Fluttertoast.showToast(msg: e.toString());
                      }
                    },
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(AppColorNeutral.neutral2),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 10),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e,
                        style: AppFont.textBottomSheet,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget buttonList() {
    return Consumer<NoteViewModel>(
      builder: (context, note, child) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                await note
                    .filterUpcomingNote()
                    .then((value) => Navigator.pop(context));
                setState(() {});
              } catch (e) {
                await Fluttertoast.showToast(msg: e.toString());
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(AppColorNeutral.neutral2),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Semua',
                style: AppFont.textBottomSheet,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await note
                    .filterIsUploadNote('no')
                    .then((value) => Navigator.pop(context));
                setState(() {});
              } catch (e) {
                await Fluttertoast.showToast(msg: e.toString());
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(AppColorNeutral.neutral2),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Belum Upload',
                style: AppFont.textBottomSheet,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await note
                    .filterIsUploadNote('yes')
                    .then((value) => Navigator.pop(context));
                setState(() {});
              } catch (e) {
                await Fluttertoast.showToast(msg: e.toString());
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(AppColorNeutral.neutral2),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sudah Upload',
                style: AppFont.textBottomSheet,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // try {
              //   await note
              //       .filterIsUploadNote('yes')
              //       .then((value) => Navigator.pop(context));
              //   setState(() {});
              // } catch (e) {
              //   await Fluttertoast.showToast(msg: e.toString());
              // }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(AppColorNeutral.neutral2),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pemilik',
                style: AppFont.textBottomSheet,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

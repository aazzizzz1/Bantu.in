import 'package:bantuin/models/post_tim_model.dart';
import 'package:bantuin/models/tim_model.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';

class EditDetailTim extends StatefulWidget {
  final TeamDetailModel teamDetail;
  const EditDetailTim({super.key, required this.teamDetail});

  @override
  State<EditDetailTim> createState() => _EditDetailTimState();
}

class _EditDetailTimState extends State<EditDetailTim> {
  TextEditingController _teamNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _teamNameController.text = widget.teamDetail.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ubah Informasi Tim',
                  style: AppFont.textTitleScreen,
                ),
                const SizedBox(height: 48),
                Text(
                  'Nama tim',
                  style: AppFont.labelTextForm,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _teamNameController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Tulis Nama Tim',
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
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Foto Latar',
                      style: AppFont.textNotificationTime,
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      height: 125,
                      width: MediaQuery.of(context).size.width - 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://s3-alpha-sig.figma.com/img/e5d9/68a5/edb3551077afa0cdb0e206b26afba2fd?Expires=1685923200&Signature=kRo7H5AiYtGCA8AL5Yeku3dczaf4ZWH3yIQN8GwHDdNpZrPvgKcdgvJ1zOLj507febIfWsudtmMOZ6uoKLfxoKFR8MMIsX5C5FDRTneSb58zfly4VdflZbq65rNblwKK6m6SXbO3Tf9CxeKDMjdemrkibZDBstpwvuegVtePLDrUJMffKlxYPZ6Jx6LUMP4W4kSNMze0eFm7uIAGSdSwusAxj6qDD4TpIqRjBolyzzqpViTqnYE~QxoITWS-VSfd2rYNTRJHG97yMjttaSOMlMvzSysHSt~mnOa2ENHdw9IU4HnOE~bSBDLTqfeC1kmN~2xISwk7RZ413yryee41Xg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                              fit: BoxFit.cover)),
                      child: Container(
                        margin: EdgeInsets.only(top: 4, right: 4),
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromARGB(99, 49, 49, 95),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(Icons.edit_outlined),
                            iconSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48.0),
                Consumer<TeamViewModel>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        // Navigator.pop(context);
                        // print('simpan' + _fileUrl.toString());
                        try {
                          await value
                              .editTeam(
                                  widget.teamDetail,
                                  PostTimModel(
                                      title: _teamNameController.text,
                                      email: widget.teamDetail.participant
                                          .map((e) => e.toString())
                                          .toList()))
                              .then((value) => Fluttertoast.showToast(
                                  msg: 'Berhasil Edit Tim'))
                              .then((value) => Navigator.pop(context));
                        } catch (e) {
                          await Fluttertoast.showToast(msg: e.toString());
                        }
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        ),
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.activeColor),
                      ),
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: AppFont.textFillButtonActive,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

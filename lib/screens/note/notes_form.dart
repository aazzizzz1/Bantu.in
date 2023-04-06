import 'package:bantuin/components/date_picker.dart';
import 'package:bantuin/components/multi_reminder_picker.dart';
import 'package:bantuin/components/reminder_picker.dart';
import 'package:bantuin/components/ringtones_picker.dart';
import 'package:bantuin/components/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesForm extends StatefulWidget {
  const NotesForm({super.key});

  @override
  State<NotesForm> createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  List<DateTime> _selectedDates = [];
  String? _selectedRingtone;

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
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buat Catatan",
                  style: AppFont.semiBold20,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Subjek",
                  style: AppFont.labelTextForm,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Tulis Subject',
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
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Deskripsi",
                  style: AppFont.labelTextForm,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Tulis deskripsi catatan',
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
                const SizedBox(
                  height: 26,
                ),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  "Masukan email anggota",
                  style: AppFont.labelTextForm,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: SvgPicture.asset(
                      "lib/assets/icons/Contact.svg",
                      alignment: Alignment.centerRight,
                    ),
                    filled: true,
                    hintText: 'Masukan email anggota',
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
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 48,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: AppColorPrimary.primary6,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Tambah email",
                          style: GoogleFonts.ibmPlexSans(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: AppColorPrimary.primary6),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  "Tambahkan tanggal",
                  style: AppFont.labelTextForm,
                ),
                DatePicker(
                  onChanged: (DateTime value) {
                    // Do something with the selected date value
                  },
                ),
                // const SizedBox(
                //   height: 16,
                // ),
                // const Divider(
                //   thickness: 1,
                // ),
                // Text(
                //   "Tambahkan waktu",
                //   style: AppFont.labelTextForm,
                // ),
                // TimePicker(
                //   onChanged: (TimeOfDay value) {
                //     // Do something with the selected time value
                //   },
                // ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  "Tambahkan pengingat",
                  style: AppFont.labelTextForm,
                ),
                MultiReminderPicker(
                  initialDates: _selectedDates,
                  onChanged: (List<DateTime> dates) {
                    setState(() {
                      _selectedDates = dates;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  "Tambahkan Ringtones",
                  style: AppFont.labelTextForm,
                ),
                RingtonePickerWidget(
                  label: 'Ringtone',
                  initialRingtone: _selectedRingtone,
                  onChanged: (ringtone) {
                    setState(() {
                      _selectedRingtone = ringtone;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.activeColor),
                  ),
                  child: Center(
                    child: Text(
                      'Buat Catatan',
                      style: AppFont.textFillButtonActive,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bantuin/widgets/notes/date_time_picker.dart';
import 'package:bantuin/widgets/notes/email_picker.dart';
import 'package:bantuin/widgets/notes/my_reminder.dart';
import 'package:bantuin/widgets/notes/reminder_picker.dart';
import 'package:bantuin/widgets/notes/ringtones_picker.dart';
import 'package:bantuin/widgets/notes/multi_reminder_picker.dart';
import 'package:bantuin/widgets/notes/my_date_picker.dart';
import 'package:bantuin/widgets/notes/my_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesUpdate extends StatefulWidget {
  final String title;
  final String description;
  final String avatarUrl;
  final String name;
  final String fileUrl;
  final String createdBy;
  final String eventDate;
  final String reminder;
  final String ringtone;

  NotesUpdate({
    super.key,
    required this.title,
    required this.description,
    required this.avatarUrl,
    required this.name,
    required this.fileUrl,
    required this.createdBy,
    required this.eventDate,
    required this.reminder,
    required this.ringtone,
  });

  @override
  State<NotesUpdate> createState() => _NotesUpdateState();
}

class _NotesUpdateState extends State<NotesUpdate> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _eventDateController = TextEditingController();
  TextEditingController _reminderController = TextEditingController();
  TextEditingController _ringtoneController = TextEditingController();
  List<DateTime> _selectedDates = [];
  String? _selectedRingtone;

  List<String> _selectedEmails = [];

  @override
  void initState() {
    // TODO: implement initState
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
    _eventDateController.text = widget.eventDate;
    _ringtoneController.text = widget.ringtone;
    super.initState();
  }

  void _handleEmailsChanged(List<String> selectedEmails) {
    setState(() {
      _selectedEmails = selectedEmails;
    });
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
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buat Catatan",
                  style: AppFont.textTitleScreen,
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
                  controller: _titleController,
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
                  controller: _descriptionController,
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
                MultipleEmailPicker(onChanged: _handleEmailsChanged),
                // TextField(
                //   decoration: InputDecoration(
                //     prefixIcon: SvgPicture.asset(
                //       "lib/assets/icons/Contact.svg",
                //       alignment: Alignment.centerRight,
                //     ),
                //     filled: true,
                //     hintText: 'Masukan email anggota',
                //     hintStyle: AppFont.hintTextField,
                //     fillColor: AppColorNeutral.neutral1,
                //     focusedBorder: const OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: AppColorPrimary.primary6)),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: AppColorNeutral.neutral2),
                //       borderRadius: BorderRadius.circular(3),
                //     ),
                //     disabledBorder: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: AppColorNeutral.neutral2),
                //       borderRadius: BorderRadius.circular(3),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 4,
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width - 200,
                //   height: 48,
                //   child: ElevatedButton(
                //     style: const ButtonStyle(
                //       elevation: MaterialStatePropertyAll(0),
                //       backgroundColor:
                //           MaterialStatePropertyAll(Colors.transparent),
                //     ),
                //     onPressed: () {},
                //     child: Row(
                //       children: [
                //         const Icon(
                //           Icons.add,
                //           color: AppColorPrimary.primary6,
                //         ),
                //         const SizedBox(
                //           width: 8,
                //         ),
                //         Text(
                //           "Tambah email",
                //           style: GoogleFonts.ibmPlexSans(
                //               fontSize: 14,
                //               fontStyle: FontStyle.normal,
                //               fontWeight: FontWeight.w400,
                //               color: AppColorPrimary.primary6),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  "Tambahkan tanggal acara",
                  style: AppFont.labelTextForm,
                ),
                const SizedBox(
                  height: 16,
                ),
                DateTimePicker(
                  onChanged: (DateTime selectedDate) {
                    // Handle date selection changes
                  },
                  initialDateTime: DateTime.now(),
                ),
                // MyDatePicker(
                //   onChanged: (DateTime selectedDate) {
                //     // Handle date selection changes
                //   },
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // MyTimePicker(
                //   onChanged: (selectedTime) {
                //     // Handle the selected time change here
                //     print('Selected time: ${selectedTime.format(context)}');
                //   },
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // SizedBox(
                // width: 200.0,
                // height: 150.0,
                // child: MyDateTimeList(),
                //   // your child widgets here
                // ),
                // DatePicker(
                //   onChanged: (DateTime value) {
                //     // Do something with the selected date value
                //   },
                // ),
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
                MyReminder(
                  initialDates: _selectedDates,
                  onChanged: (newDates) {
                    setState(() {
                      _selectedDates = newDates;
                    });
                  },
                ),
                // MultiReminderPicker(
                //   initialDates: _selectedDates,
                //   onChanged: (List<DateTime> dates) {
                //     setState(() {
                //       _selectedDates = dates;
                //     });
                //   },
                // ),
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
                  initialRingtone: _ringtoneController.text,
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
                      EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.activeColor),
                  ),
                  child: Center(
                    child: Text(
                      'Update Catatan',
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

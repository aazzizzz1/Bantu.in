import 'package:bantuin/widgets/notes/add_repeat.dart';
import 'package:bantuin/widgets/notes/create_note_textfield.dart';
import 'package:bantuin/widgets/notes/date_time_picker.dart';
import 'package:bantuin/widgets/notes/email_picker.dart';
import 'package:bantuin/widgets/form/button_to_screen_notes.dart';
import 'package:bantuin/widgets/notes/my_reminder.dart';
import 'package:bantuin/widgets/notes/ringtones_picker.dart';
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

  List<String> _selectedEmails = [];

  void _handleEmailsChanged(List<String> selectedEmails) {
    setState(() {
      _selectedEmails = selectedEmails;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _descriptionController = TextEditingController();
    final _subjectController = TextEditingController();
    final formKey = GlobalKey<FormState>();
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
            key: formKey,
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
                CreateNoteTextField(
                  label: 'Subject',
                  hint: 'Subject',
                  message: 'subject',
                  controller: _subjectController,
                  isSubject: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                //Description
                CreateNoteTextField(
                  label: 'Deskripsi',
                  hint: 'Deskripsi',
                  message: 'deskripsi',
                  controller: _descriptionController,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Masukan email anggota",
                  style: AppFont.labelTextForm,
                ),
                const SizedBox(
                  height: 4,
                ),
                MultipleEmailPicker(onChanged: _handleEmailsChanged),
                // const SizedBox(
                //   height: 24,
                // ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Tambahkan tanggal acara',
                          style: AppFont.labelTextForm),
                      TextSpan(text: ' *', style: AppFont.textStatusError),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                DateTimePicker(
                  onChanged: (DateTime selectedDate) {
                    // Handle date selection changes
                  },
                  initialDateTime: DateTime.now(),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Tambahkan pengingat',
                          style: AppFont.labelTextForm),
                      TextSpan(text: ' *', style: AppFont.textStatusError),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                MyReminder(
                  initialDates: _selectedDates,
                  onChanged: (newDates) {
                    setState(() {
                      _selectedDates = newDates;
                    });
                  },
                ),
                // isRepeat
                const SizedBox(
                  height: 24,
                ),
                const AddRepeat(),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Tambahkan ringtones',
                          style: AppFont.labelTextForm),
                      TextSpan(text: ' *', style: AppFont.textStatusError),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
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
                  height: 24,
                ),
                ButtonScreenNotes(formKey: formKey),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


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

// MultiReminderPicker(
//   initialDates: _selectedDates,
//   onChanged: (List<DateTime> dates) {
//     setState(() {
//       _selectedDates = dates;
//     });
//   },
// ),
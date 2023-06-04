import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/widgets/notes/add_repeat.dart';
import 'package:bantuin/widgets/notes/create_note_textfield.dart';
import 'package:bantuin/widgets/notes/date_time_picker.dart';
import 'package:bantuin/widgets/notes/date_time_picker2.dart';
import 'package:bantuin/widgets/notes/email_picker.dart';
import 'package:bantuin/widgets/form/button_to_screen_notes.dart';
import 'package:bantuin/widgets/notes/my_reminder.dart';
import 'package:bantuin/widgets/notes/my_reminder2.dart';
import 'package:bantuin/widgets/notes/ringtones_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bantuin/models/post_note_model.dart';

import '../../view_models/note_viewmodel.dart';
import '../../view_models/ringtone_viewmodel.dart';
import '../../widgets/bottom_navigation/bottom_menu.dart';
import 'notes_screen.dart';

class NoteForm2 extends StatefulWidget {
  const NoteForm2({super.key});

  @override
  State<NoteForm2> createState() => _NoteForm2State();
}

class _NoteForm2State extends State<NoteForm2> {
  // List<DateTime> _selectedDatesReminder = [];
  DateTime _selectedDatesReminder = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  String? _selectedRingtone;

  List<String> _selectedEmails = [];

  void _handleEmailsChanged(List<String> selectedEmails) {
    _selectedEmails = selectedEmails;
    // setState(() {
    // });
  }

  @override
  void initState() {
    // TODO: implement initState

    Future.microtask(() =>
        Provider.of<RingtoneViewModel>(context, listen: false).fetchRingtone());
    initializeDateFormatting('id_ID', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _descriptionController = TextEditingController();
    final _subjectController = TextEditingController();
    final _reminderController = TextEditingController();
    final _dateController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    var ringtones = Provider.of<RingtoneViewModel>(context, listen: false);
    int? ringtoneId;

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
                  label: 'Subjek',
                  hint: 'Subjek',
                  message: 'subjek',
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
                //EVENT DATE FEATURE =====
                TextFormField(
                  readOnly: true,
                  controller: _dateController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
                  style: AppFont.medium14,
                  onTap: () async {
                    final DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: _selectedDate.add(Duration(days: 365)),
                    );
                    if (selectedDate != null) {
                      final DateTime now = DateTime.now();
                      final TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        final DateTime selectedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        if (selectedDateTime.isBefore(now)) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Peringatan'),
                              content: Text(
                                  'Anda tidak dapat memilih waktu sebelum waktu saat ini.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          _selectedDate = selectedDateTime;
                          _dateController.text =
                              DateFormat('EEEE, dd MMMM yyyy - hh:mm', 'id_ID')
                                  .format(selectedDateTime.toLocal());
                        }
                      }
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Anda belum memasukkan tanggal';
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'mm/dd/yyyy',
                    hintStyle: AppFont.hintTextField,
                    fillColor: AppColorNeutral.neutral1,
                    prefixIcon: const Icon(Icons.calendar_month_outlined),
                    prefixIconColor: Colors.black,
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorNeutral.neutral2)),
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
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColorNeutral.neutral2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorPrimary.primary6)),
                  ),
                ),
                //EVENT DATE FEATURE END =====
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
                //REMINDER FEATURE BEGIN =====
                TextFormField(
                  readOnly: true,
                  controller: _reminderController,
                  keyboardType: TextInputType.multiline,
                  style: AppFont.medium14,
                  onTap: () async {
                    final DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: _selectedDate,
                    );
                    if (selectedDate != null) {
                      final DateTime now = DateTime.now();
                      final TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        final DateTime selectedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        if (selectedDateTime.isBefore(now)) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Peringatan'),
                              content: Text(
                                  'Anda tidak dapat memilih waktu sebelum waktu saat ini.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          _selectedDatesReminder = selectedDateTime;
                          _reminderController.text =
                              DateFormat('EEEE, dd MMMM yyyy - hh:mm', 'id_ID')
                                  .format(selectedDateTime.toLocal());
                        }
                      }
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Anda belum memasukkan tanggal';
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Pilih tanggal dan waktu pengingat.',
                    hintStyle: AppFont.hintTextField,
                    fillColor: AppColorNeutral.neutral1,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        "lib/assets/icons/Alarm.svg",
                        height: 26,
                        width: 26,
                      ),
                    ),
                    prefixIconColor: Colors.black,
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorNeutral.neutral2)),
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
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColorNeutral.neutral2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorPrimary.primary6)),
                  ),
                ),
                //REMINDER FEATURE END =====
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
                Consumer<RingtoneViewModel>(
                  builder: (context, value, child) => RingtonePickerWidget(
                    label: 'Ringtone',
                    listRingtone: value.listOfRingtone,
                    initialRingtone: _selectedRingtone,
                    onChanged: (value) {
                      _selectedRingtone = value;
                      // setState(() {
                      // });
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Consumer<NoteViewModel>(
                  builder: (context, note, _) => ElevatedButton(
                    onPressed: () async {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        try {
                          await note
                              .postPersonalNote(
                                PostNoteModel(
                                  subject: _subjectController.text,
                                  description: _descriptionController.text,
                                  eventDate: _dateController.text,
                                  reminder: _reminderController.text,
                                  ringtoneId: ringtones.listOfRingtone
                                      .where((element) => _selectedRingtone!
                                          .contains(element.name))
                                      .reduce((value, element) => value)
                                      .id,
                                  email: _selectedEmails,
                                ),
                              )
                              .then(
                                (value) => Fluttertoast.showToast(
                                        msg: 'Berhasil menambahkan note')
                                    .then(
                                  (value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomMenu(
                                            currentTab: 1,
                                            currentScreen: const NoteScreen())),
                                  ),
                                ),
                              );
                        } catch (e) {
                          Fluttertoast.showToast(msg: e.toString());
                          print(e);
                        }
                      }
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
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
                ),
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

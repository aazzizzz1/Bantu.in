import 'package:bantuin/components/popup_update.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/widgets/notes/add_repeat.dart';
import 'package:bantuin/widgets/notes/create_note_textfield.dart';
import 'package:bantuin/widgets/notes/date_time_picker.dart';
import 'package:bantuin/widgets/notes/email_picker.dart';
import 'package:bantuin/widgets/form/button_to_screen_notes.dart';
import 'package:bantuin/widgets/notes/my_reminder.dart';
import 'package:bantuin/widgets/notes/my_reminder2.dart';
import 'package:bantuin/widgets/notes/ringtones_picker.dart';
import 'package:bantuin/widgets/notes/update_date_reminder.dart';
import 'package:bantuin/widgets/notes/update_email_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bantuin/models/post_note_model.dart';

import '../../view_models/note_viewmodel.dart';
import '../../view_models/ringtone_viewmodel.dart';
import '../../widgets/notes/update_date_time_picker.dart';
import 'notes_screen.dart';

class NoteUpdate extends StatefulWidget {
  final NoteDetailModel noteDetail;
  const NoteUpdate({super.key, required this.noteDetail});

  @override
  State<NoteUpdate> createState() => _NoteUpdateState();
}

class _NoteUpdateState extends State<NoteUpdate> {
  // List<DateTime> _selectedDatesReminder = [];
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _eventDateController = TextEditingController();
  TextEditingController _reminderController = TextEditingController();
  TextEditingController _ringtoneController = TextEditingController();
  late DateTime _selectedDatesReminder;
  late DateTime _selectedDate;
  String? _selectedRingtone;

  List<String> _selectedEmails = [];

  void _handleEmailsChanged(List<String> selectedEmails) {
    _selectedEmails = selectedEmails;
    // setState(() {
    // });
  }

  void initState() {
    // TODO: implement initState
    _subjectController.text = widget.noteDetail.subject;
    _descriptionController.text = widget.noteDetail.description;
    _eventDateController.text = DateFormat('dd/MM/yyyy hh:mm', 'en_US')
        .format(widget.noteDetail.eventDate);
    _reminderController.text = DateFormat('dd/MM/yyyy hh:mm', 'en_US')
        .format(widget.noteDetail.reminder);
    _ringtoneController.text = widget.noteDetail.ringtone;
    _selectedRingtone = widget.noteDetail.ringtone;
    _selectedDate = widget.noteDetail.eventDate;
    _selectedDatesReminder = widget.noteDetail.reminder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Future.microtask(() =>
          Provider.of<RingtoneViewModel>(context, listen: false)
              .fetchRingtone());
    });
    final formKey = GlobalKey<FormState>();
    final ringtones = Provider.of<RingtoneViewModel>(context, listen: false);
    int? ringtoneId;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Apakah anda yakin ingin tidak simpan perubahan catatan ini',
                    textAlign: TextAlign.center,
                    style: AppFont.textSubjectOrTitle,
                  ),
                  actions: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: AppColorNeutral.neutral2)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () async {
                                // Perform delete operation and navigate back to previous screen
                                // ...
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Buang',
                                style: AppFont.textButtonDisable,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                overlayColor:
                                    MaterialStatePropertyAll(AppColorRed.red4),
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 10),
                                ),
                                elevation: MaterialStatePropertyAll(0),
                                // side: MaterialStatePropertyAll(
                                //     BorderSide(color: AppColorPrimary.primary6)),
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColorRed.red6),
                              ),
                              onPressed: () async {
                                // Perform delete operation and navigate back to previous screen
                                // ...
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Kembali',
                                style: AppFont.textFillButtonActive,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
            // Navigator.pop(context);
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
                  "Edit Catatan",
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
                UpdateEmailPicker(
                  onChanged: _handleEmailsChanged,
                  memberEmails: widget.noteDetail.member,
                ),
                // MultipleEmailPicker(onChanged: _handleEmailsChanged),
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
                UpdateDateTimePicker(
                  onChanged: (DateTime selectedDate) {
                    // Handle date selection changes
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  },
                  initialDateTime: _selectedDate != null
                      ? _selectedDate
                      : widget.noteDetail.eventDate,
                  controller: _eventDateController,
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
                UpdateDateReminder(
                  initialDates: _selectedDatesReminder != null
                      ? _selectedDatesReminder
                      : widget.noteDetail.reminder,
                  initialLastDate: _selectedDate,
                  onChanged: (newDate) {
                    setState(() {
                      _selectedDatesReminder = newDate;
                    });
                  },
                  controller: _reminderController,
                ),
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
                        if (widget.noteDetail.notesType != 'personal') {
                          await showDialog(
                            context: context,
                            builder: (context) => PopupUpdate(
                              noteDetail: widget.noteDetail,
                              postNotePersonal: PostNoteModel(
                                subject: _subjectController.text,
                                description: _descriptionController.text,
                                eventDate: _eventDateController.text,
                                reminder: _reminderController.text,
                                ringtoneId: ringtones.listOfRingtone
                                    .where((element) => _selectedRingtone!
                                        .contains(element.name))
                                    .reduce((value, element) => value)
                                    .id,
                              ),
                            ),
                          );
                        } else {
                          try {
                            await note
                                .updatePersonalNote(
                                    PostNoteModel(
                                      subject: _subjectController.text,
                                      description: _descriptionController.text,
                                      eventDate: _eventDateController.text,
                                      reminder: _reminderController.text,
                                      ringtoneId: ringtones.listOfRingtone
                                          .where((element) => _selectedRingtone!
                                              .contains(element.name))
                                          .reduce((value, element) => value)
                                          .id,
                                    ),
                                    widget.noteDetail)
                                .then(
                                  (value) => Fluttertoast.showToast(
                                          msg: 'Berhasil mengubah note')
                                      .then(
                                    (value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NoteScreen()),
                                    ),
                                  ),
                                );
                          } catch (e) {
                            Fluttertoast.showToast(msg: e.toString());
                          }
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
                        'Simpan catatan',
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

import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../constants/constant.dart';

class UpdateDateReminder extends StatefulWidget {
  final DateTime initialDates;
  final ValueChanged<DateTime> onChanged;
  final TextEditingController controller;
  final DateTime initialLastDate;

  const UpdateDateReminder({
    Key? key,
    required this.initialDates,
    required this.initialLastDate,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  _UpdateDateReminderState createState() => _UpdateDateReminderState();
}

class _UpdateDateReminderState extends State<UpdateDateReminder> {
  DateTime? _selectedDates;
  final _reminderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDates = widget.initialDates;
    initializeDateFormatting('id_ID', null);
  }

  Future<void> _addNewReminder() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDates,
      firstDate: DateTime.now(),
      lastDate: widget.initialLastDate,
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
          setState(() {
            _selectedDates = selectedDateTime;
            widget.controller.text = DateFormat('dd/MM/yyyy HH:mm', 'id_ID')
                .format(selectedDateTime);
            // widget.controller.text =
            //     DateFormat.yMd().add_jm().format(selectedDateTime);
            // _reminderController.text =
            //     DateFormat.yMMMMEEEEd('id_ID').format(selectedDateTime);
          });
          widget.onChanged(selectedDateTime);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.controller,
      keyboardType: TextInputType.multiline,
      style: AppFont.medium14,
      onTap: () {
        initializeDateFormatting('id_ID', null).then(
          (value) => _addNewReminder(),
        );
        // initializeDateFormatting('id_ID', null)
        //     .then((_) => _selectDate());
      },
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
            borderSide: BorderSide(color: AppColorNeutral.neutral2)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColorNeutral.neutral2),
          borderRadius: BorderRadius.circular(3),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColorNeutral.neutral2),
          borderRadius: BorderRadius.circular(3),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColorNeutral.neutral2),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorPrimary.primary6)),
      ),
    );
  }
}

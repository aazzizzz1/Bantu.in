import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../constants/constant.dart';

class DateTimePicker2 extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onChanged;
  final TextEditingController controller;

  const DateTimePicker2({
    Key? key,
    required this.initialDate,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  _DateTimePicker2State createState() => _DateTimePicker2State();
}

class _DateTimePicker2State extends State<DateTimePicker2> {
  late DateTime _selectedDateTime;
  final _dateController = TextEditingController();

  @override
  void initState() {
    _selectedDateTime = widget.initialDate;
    initializeDateFormatting('id_ID', null);
    super.initState();
  }

  // _selectDate() async {
  //   final DateTime now = DateTime.now();
  //   final DateTime? selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDateTime,
  //     firstDate: now,
  //     lastDate: _selectedDateTime.add(Duration(days: 365)),
  //   );
  //   if (selectedDate != null) {
  //     TimeOfDay initialTime = TimeOfDay.now();
  //     if (selectedDate == now) {
  //       initialTime = TimeOfDay.fromDateTime(now);
  //     }
  //     final TimeOfDay? selectedTime = await showTimePicker(
  //       context: context,
  //       initialTime: initialTime,
  //     );
  //     if (selectedTime != null) {
  //       final DateTime selectedDateTime = DateTime(
  //         selectedDate.year,
  //         selectedDate.month,
  //         selectedDate.day,
  //         selectedTime.hour,
  //         selectedTime.minute,
  //       );
  //       if (selectedDateTime.isBefore(now)) {
  //         // Jika waktu yang dipilih sebelum waktu saat ini, tampilkan pesan kesalahan
  //         showDialog(
  //           context: context,
  //           builder: (_) => AlertDialog(
  //             title: Text('Peringatan'),
  //             content: Text(
  //                 'Anda tidak dapat memilih waktu sebelum waktu saat ini.'),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: Text('OK'),
  //               ),
  //             ],
  //           ),
  //         );
  //       } else {
  //         setState(() {
  //           _selectedDateTime = selectedDateTime;
  //           // widget.controller.text =
  //           //     DateFormat.yMMMEd().format(_selectedDateTime);
  //           // widget.controller.text = DateFormat('dd/MM/yyyy hh:mm', 'en_US')
  //           //     .format(_selectedDateTime);
  //           widget.onChanged(_selectedDateTime);
  //         });
  //         print(_selectedDateTime);
  //       }
  //     }
  //   }
  // }

  // void _onReminderChanged(DateTime dateTime) {
  //   setState(() {
  //     if (_selectedDates.contains(dateTime)) {
  //       _selectedDates.remove(dateTime);
  //     } else {
  //       _selectedDates.add(dateTime);
  //       _selectedDates.sort();
  //     }
  //   });
  //   widget.onChanged(_selectedDates);
  // }

  // void _removeReminder(int index) {
  //   setState(() {
  //     _selectedDates.removeAt(index);
  //   });
  //   widget.onChanged(_selectedDates);
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.controller,
      keyboardType: TextInputType.multiline,
      style: AppFont.medium14,
      onTap: () async {
        final DateTime now = DateTime.now();
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDateTime,
          firstDate: now,
          lastDate: _selectedDateTime.add(Duration(days: 365)),
        );
        if (selectedDate != null) {
          TimeOfDay initialTime = TimeOfDay.now();
          if (selectedDate == now) {
            initialTime = TimeOfDay.fromDateTime(now);
          }
          final TimeOfDay? selectedTime = await showTimePicker(
            context: context,
            initialTime: initialTime,
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
              // Jika waktu yang dipilih sebelum waktu saat ini, tampilkan pesan kesalahan
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
              // setState(() {
              //   // widget.controller.text =
              //   //     DateFormat.yMMMEd().format(_selectedDateTime);
              //   // widget.controller.text = DateFormat('dd/MM/yyyy hh:mm', 'en_US')
              //   //     .format(_selectedDateTime);
              // });
              setState(() {
                _selectedDateTime = selectedDate;

                widget.onChanged(selectedDate);
                _dateController.text =
                    DateFormat.yMMMMEEEEd().format(_selectedDateTime);
              });
              print(_dateController.text);
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
    // TextFormField(
    //   readOnly: true,
    //   controller: widget.controller,
    //   keyboardType: TextInputType.multiline,
    //   style: AppFont.medium14,
    //   onTap: () {
    //     initializeDateFormatting('en_US', null).then(
    //       (value) => _selectDate(),
    //     );
    //   },
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return 'Anda belum memasukkan tanggal';
    //     }
    //   },
    //   decoration: InputDecoration(
    //     filled: true,
    //     hintText: 'Pilih tanggal dan waktu pengingat.',
    //     hintStyle: AppFont.hintTextField,
    //     fillColor: AppColorNeutral.neutral1,
    //     prefixIcon: Padding(
    //       padding: const EdgeInsets.all(10),
    //       child: SvgPicture.asset(
    //         "lib/assets/icons/Alarm.svg",
    //         height: 26,
    //         width: 26,
    //       ),
    //     ),
    //     prefixIconColor: Colors.black,
    //     focusedBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: AppColorNeutral.neutral2)),
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: AppColorNeutral.neutral2),
    //       borderRadius: BorderRadius.circular(3),
    //     ),
    //     disabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: AppColorNeutral.neutral2),
    //       borderRadius: BorderRadius.circular(3),
    //     ),
    //     errorBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: AppColorNeutral.neutral2),
    //       borderRadius: BorderRadius.circular(3),
    //     ),
    //     focusedErrorBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: AppColorPrimary.primary6)),
    //   ),
    // );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     ListView.builder(
    //       reverse: true,
    //       shrinkWrap: true,
    //       physics: const NeverScrollableScrollPhysics(),
    //       itemCount: _selectedDates.length + 1,
    //       itemBuilder: (context, index) {
    //         if (index == _selectedDates.length) {
    //           return TextFormField(
    //             readOnly: true,
    //             controller: _reminderController,
    //             keyboardType: TextInputType.multiline,
    //             style: AppFont.medium14,
    //             onTap: () {
    //               initializeDateFormatting().then(
    //                 (value) => _addNewReminder(),
    //               );
    //               // initializeDateFormatting('id_ID', null)
    //               //     .then((_) => _selectDate());
    //             },
    //             validator: (value) {
    //               if (_selectedDates.length == 0) {
    //                 return 'Anda belum memasukkan tanggal';
    //               }
    //             },
    //             decoration: InputDecoration(
    //               filled: true,
    //               hintText: 'Pilih tanggal dan waktu pengingat.',
    //               hintStyle: AppFont.hintTextField,
    //               fillColor: AppColorNeutral.neutral1,
    //               prefixIcon: Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: SvgPicture.asset(
    //                   "lib/assets/icons/Alarm.svg",
    //                   height: 26,
    //                   width: 26,
    //                 ),
    //               ),
    //               prefixIconColor: Colors.black,
    //               focusedBorder: const OutlineInputBorder(
    //                   borderSide: BorderSide(color: AppColorNeutral.neutral2)),
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide:
    //                     const BorderSide(color: AppColorNeutral.neutral2),
    //                 borderRadius: BorderRadius.circular(3),
    //               ),
    //               disabledBorder: OutlineInputBorder(
    //                 borderSide:
    //                     const BorderSide(color: AppColorNeutral.neutral2),
    //                 borderRadius: BorderRadius.circular(3),
    //               ),
    //               errorBorder: OutlineInputBorder(
    //                 borderSide:
    //                     const BorderSide(color: AppColorNeutral.neutral2),
    //                 borderRadius: BorderRadius.circular(3),
    //               ),
    //               focusedErrorBorder: const OutlineInputBorder(
    //                   borderSide: BorderSide(color: AppColorPrimary.primary6)),
    //             ),
    //           );
    //         } else {
    //           return Container(
    //             decoration: BoxDecoration(
    //               color: AppColorNeutral.neutral1,
    //               borderRadius: BorderRadius.circular(3.0),
    //               border: Border.all(color: AppColorNeutral.neutral2),
    //             ),
    //             margin: const EdgeInsets.symmetric(
    //               vertical: 10,
    //             ),
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 SvgPicture.asset(
    //                   "lib/assets/icons/Alarm.svg",
    //                   height: 26,
    //                   width: 26,
    //                 ),
    //                 Text(DateFormat('dd MMMM yyyy, hh:mm a', 'id_ID')
    //                     .format(_selectedDates[index])),
    //                 IconButton(
    //                   icon: const Icon(Icons.delete),
    //                   onPressed: () => _removeReminder(index),
    //                 ),
    //               ],
    //             ),
    //           );
    //         }
    //       },
    //     ),
    //   ],
    // );
  }
}

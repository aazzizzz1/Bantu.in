import 'package:bantuin/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddRepeat extends StatefulWidget {
  const AddRepeat({super.key});

  @override
  State<AddRepeat> createState() => _AddRepeatState();
}

class _AddRepeatState extends State<AddRepeat> {
  List<String> repeats = [
    'Tidak diulang',
    'Diulang',
  ];
  String selectedValue = 'Tidak diulang';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tambahkan pengingat ulangan',
          style: AppFont.labelTextForm,
        ),
        const SizedBox(height: 4.0),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: repeats
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_outlined)),
            buttonStyleData: ButtonStyleData(
              height: 50,
              padding: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: AppColorNeutral.neutral2,
                ),
                color: AppColorNeutral.neutral1,
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Disesuaikan dengan tanggal acara',
          style: AppFont.textDescription,
        ),
      ],
    );
  }
}

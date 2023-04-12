import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataFilter extends StatefulWidget {
  final Function(DateTime? date) onDateFilterChanged;

  const DataFilter(
      {Key? key,
      required this.onDateFilterChanged,
      required Null Function(String sortBy) onSortByChanged})
      : super(key: key);

  @override
  _DataFilterState createState() => _DataFilterState();
}

class _DataFilterState extends State<DataFilter> {
  String _filterOption = 'Tanggal';

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: _filterOption,
                items: [
                  DropdownMenuItem<String>(
                    value: 'Tanggal',
                    child: Text(
                      'Tanggal',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Bulan',
                    child: Text(
                      'Bulan',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Tahun',
                    child: Text(
                      'Tahun',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _filterOption = value!;
                  });
                },
              ),
              SizedBox(width: 16),
              if (_filterOption == 'Tanggal')
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        _selectedDate = picked;
                      });
                      widget.onDateFilterChanged(_selectedDate);
                    }
                  },
                  child: Text(
                    _selectedDate != null
                        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                        : 'Pilih Tanggal',
                    style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                  ),
                ),
              if (_filterOption == 'Bulan')
                DropdownButton<int>(
                  value: _selectedDate?.month,
                  items: List.generate(
                    14,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = DateTime(
                          _selectedDate?.year ?? DateTime.now().year,
                          value!,
                          1);
                    });
                    widget.onDateFilterChanged(_selectedDate);
                  },
                ),
              if (_filterOption == 'Tahun')
                DropdownButton<int>(
                  value: _selectedDate?.year,
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem<int>(
                      value: DateTime.now().year - index,
                      child: Text('${DateTime.now().year - index}',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = DateTime(value!,
                          _selectedDate?.month ?? DateTime.now().month, 1);
                    });
                    widget.onDateFilterChanged(_selectedDate);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

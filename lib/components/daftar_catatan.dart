import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/widgets/home/filtering_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaftarCatatan extends StatefulWidget {
  const DaftarCatatan({super.key});

  @override
  State<DaftarCatatan> createState() => _DaftarCatatanState();
}

class _DaftarCatatanState extends State<DaftarCatatan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Daftar Catatan', style: AppFont.semiBold20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sortir berdasarkan',
                  style: GoogleFonts.ibmPlexSans(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                ),
                DataFilter(
                  onSortByChanged: (String sortBy) {
                    // handle sorting based on selected value
                  },
                  onDateFilterChanged: (DateTime? date) {
                    // handle filtering based on selected date
                  },
                ),
              ],
            ),
          ],
        ));
  }
}

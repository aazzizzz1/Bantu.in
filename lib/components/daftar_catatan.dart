import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';

class DaftarCatatan extends StatefulWidget {
  const DaftarCatatan({super.key});

  @override
  State<DaftarCatatan> createState() => _DaftarCatatanState();
}

class _DaftarCatatanState extends State<DaftarCatatan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Daftar Catatan',
                        style: AppFont.semiBold20
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sortir berdasarkan',
                        style: AppFont.semiBold14,
                      ),
                      DropdownButton<String>(
                        value: 'tanggal',
                        items: [
                          DropdownMenuItem<String>(
                            value: 'tanggal',
                            child: Text('Tanggal'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'bulan',
                            child: Text('Bulan'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'tahun',
                            child: Text('Tahun'),
                          ),
                        ],
                        onChanged: (value) {
                          // handle sorting based on selected value
                        },
                      ),
                    ],
                  ),
                ],
              )
    );
  }
}
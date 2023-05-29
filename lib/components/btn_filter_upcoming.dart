import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constant.dart';
import 'bottom_sheet_filter.dart';

class BtnFilterUpcoming extends StatelessWidget {
  const BtnFilterUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => const BottomSheetFilter(
                filter: ['Semua', 'Belum Upload', 'Sudah Upload', 'Pemilik'],
                typeNote: 'upcoming',
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            elevation: const MaterialStatePropertyAll(0),
            overlayColor:
                const MaterialStatePropertyAll(AppColorNeutral.neutral2),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              side: const BorderSide(color: AppColorNeutral.neutral3),
              borderRadius: BorderRadius.circular(6),
            )),
          ),
          child: Container(
            height: 32,
            width: MediaQuery.of(context).size.width * 0.35,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/Setting.svg',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(width: 20.0),
                Text(
                  'Semua',
                  style: AppFont.disableText,
                )
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const BottomSheetFilter(
                filter: ['Terdekat', 'Terjauh'],
                typeNote: 'upcoming',
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            elevation: const MaterialStatePropertyAll(0),
            overlayColor:
                const MaterialStatePropertyAll(AppColorNeutral.neutral2),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              side: const BorderSide(color: AppColorNeutral.neutral3),
              borderRadius: BorderRadius.circular(6),
            )),
          ),
          child: Container(
            height: 32,
            width: MediaQuery.of(context).size.width * 0.35,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/sort.svg',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(width: 20.0),
                Text(
                  'Terdekat',
                  style: AppFont.disableText,
                )
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}

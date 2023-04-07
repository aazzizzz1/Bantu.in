import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PointRoyalty extends StatefulWidget {
  const PointRoyalty({super.key});

  @override
  State<PointRoyalty> createState() => _PointRoyaltyState();
}

class _PointRoyaltyState extends State<PointRoyalty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 24),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.fromBorderSide(BorderSide(
          color: AppColorNeutral.neutral2,
          width: 2,
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "lib/assets/images/logos.svg",
                    height: 26,
                    width: 26,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Bantu.in Point :',
                    style: AppFont.titlePoint,
                  ),
                ],
              ),
              Text(
                "100",
                style: AppFont.regular20,
              ),
            ],
          ),
          Expanded(
            child: VerticalDivider(
              indent: 12,
              endIndent: 12,
              color: AppColorNeutral.neutral2,
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kuota Catatan :",
                  style: AppFont.medium12,
                ),
                Text(
                  "3",
                  style: AppFont.quotaOfNote,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bantuin/screens/point/detail_product_redeem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class CardRedeemPoint extends StatelessWidget {
  final String title;
  const CardRedeemPoint({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailProductRedeem(),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.bottomCenter,
        height: 180,
        width: 225,
        decoration: BoxDecoration(
          color: AppColorPrimary.primary1,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColorNeutral.neutral5,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Text(
            title,
            style: AppFont.medium12,
          ),
        ),
      ),
    );
  }
}

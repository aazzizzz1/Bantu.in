import 'package:bantuin/models/product_point_model.dart';
import 'package:bantuin/screens/point/detail_product_redeem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class CardRedeemPoint extends StatelessWidget {
  final DetailProductPointModel product;
  const CardRedeemPoint({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProductRedeem(
                detailProduct: product,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        alignment: Alignment.bottomCenter,
        height: 160,
        width: 225,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(product.photoProduct), fit: BoxFit.fill),
          // color: AppColorPrimary.primary1,
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
          height: 70,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Text(
            product.name,
            style: AppFont.medium12,
          ),
        ),
      ),
    );
  }
}

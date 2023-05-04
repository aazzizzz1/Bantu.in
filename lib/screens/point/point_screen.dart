import 'package:bantuin/components/card_redeem_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/Ellipse 1.png'),
                    alignment: Alignment.topRight),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColorNeutral.neutral5,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                border: const Border.fromBorderSide(BorderSide(
                  color: AppColorNeutral.neutral2,
                  width: 2,
                )),
              ),
              child: Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "lib/assets/images/logos.svg",
                              height: 26,
                              width: 26,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Bantu.in Point :',
                              style: AppFont.titlePoint,
                            ),
                          ],
                        ),
                        Text(
                          "100",
                          style: AppFont.regular28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    'Tawaran lebaran',
                    style: AppFont.semiBold14,
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: const [
                          CardRedeemPoint(
                              title:
                                  'Berkah lebaran, tukar THR-mu dengan 10 note'),
                          CardRedeemPoint(
                              title:
                                  'Dapatkan note dengan menukar 1000 point dengan 10 note'),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    'Tawaran lainnya',
                    style: AppFont.semiBold14,
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: const [
                            CardRedeemPoint(
                                title:
                                    'Berkah lebaran, tukar THR-mu dengan 10 note'),
                            CardRedeemPoint(
                                title:
                                    'Dapatkan note dengan menukar 1000 point dengan 10 note'),
                          ],
                        );
                      },
                    )
                    // _cardRedeem(
                    //     'Berkah lebaran, tukar THR-mu dengan 10 Notes'),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.width;

    final path = Path();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

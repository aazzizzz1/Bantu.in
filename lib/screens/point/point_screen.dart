import 'package:bantuin/components/card_redeem_point.dart';
import 'package:bantuin/view_models/product_viewmodel.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';
import '../../utils/app_state.dart';
import '../../widgets/shimmer_loading/shimmer_card_widget.dart';

class PointScreen extends StatefulWidget {
  final int point;
  const PointScreen({super.key, required this.point});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductViewModel>(context, listen: false).fetchProduct());
  }

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
      body: SingleChildScrollView(
        child: Container(
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
                          "${widget.point}",
                          style: AppFont.regular28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Consumer<ProductViewModel>(builder: (context, product, child) {
                if (product.appState == AppState.loading) {
                  return _loadingContainer();
                }
                if (product.appState == AppState.loaded) {
                  return Column(
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
                      product.listOfProduct.isEmpty
                          ? SizedBox(
                              child: Text('Kosong'),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: product.listOfProduct.length,
                                itemBuilder: (context, index) {
                                  var data = product.listOfProduct[index];
                                  return CardRedeemPoint(product: data);
                                },
                              )
                              // _cardRedeem(
                              //     'Berkah lebaran, tukar THR-mu dengan 10 Notes'),
                              ),
                    ],
                  );
                }
                if (product.appState == AppState.noData) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Tim masih kosong',
                      style: AppFont.textScreenEmpty,
                    ),
                  );
                }
                if (product.appState == AppState.failure) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Gagal mengambil data tim',
                      style: AppFont.textScreenEmpty,
                    ),
                  );
                }
                return const SizedBox();
              }),
              const SizedBox(height: 48.0),
              Consumer<ProductViewModel>(builder: (context, product, child) {
                if (product.appState == AppState.loading) {
                  return _loadingContainer();
                }
                if (product.appState == AppState.loaded) {
                  return Column(
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
                      product.listOfProduct.isEmpty
                          ? SizedBox(
                              child: Text('Kosong'),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: product.listOfProduct.length,
                                itemBuilder: (context, index) {
                                  var data = product.listOfProduct[index];
                                  return CardRedeemPoint(product: data);
                                },
                              )
                              // _cardRedeem(
                              //     'Berkah lebaran, tukar THR-mu dengan 10 Notes'),
                              ),
                    ],
                  );
                }
                if (product.appState == AppState.noData) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Tim masih kosong',
                      style: AppFont.textScreenEmpty,
                    ),
                  );
                }
                if (product.appState == AppState.failure) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Gagal mengambil data tim',
                      style: AppFont.textScreenEmpty,
                    ),
                  );
                }
                return const SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadingContainer() {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerContainer.rectangle(height: 16, width: 100),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: ShimmerContainer.circular(
                    height: 150,
                    width: 225,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                );
              },
            ),
          ),
        ],
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

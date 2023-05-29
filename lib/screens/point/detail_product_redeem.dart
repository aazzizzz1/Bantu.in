import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/models/product_point_model.dart';
import 'package:flutter/material.dart';
import 'package:bantuin/constants/constant.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class DetailProductRedeem extends StatefulWidget {
  final DetailProductPointModel detailProduct;
  const DetailProductRedeem({super.key, required this.detailProduct});

  @override
  State<DetailProductRedeem> createState() => _DetailProductRedeemState();
}

class _DetailProductRedeemState extends State<DetailProductRedeem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: AppColorPrimary.primary1,
              ),
              child: Text(''),
            ),
            const SizedBox(height: 4.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.detailProduct.name,
                          style: AppFont.semiBold20,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Syarat dan ketentuan',
                          style: AppFont.medium14,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          lorem(paragraphs: 1, words: 100),
                          style: AppFont.textDescriptionRedeem,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Yeaay, anda berhasil menukarkan point dengan 10 notes',
                                textAlign: TextAlign.center,
                                style: AppFont.textSubjectOrTitle,
                              ),
                              content: Text(
                                'Anda mendapatkan 10 notes untuk pekerjaan anda sehari-hari. Selamat menggunakan.',
                                textAlign: TextAlign.center,
                                style: AppFont.textDescription,
                              ),
                              actionsPadding: const EdgeInsets.only(
                                  left: 18, right: 18, bottom: 16),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(16.0)),
                                    elevation: MaterialStatePropertyAll(0),
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColor.activeColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Kembali ke tawaran',
                                      style: AppFont.textFillButtonActive,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                        // Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.activeColor),
                      ),
                      child: Center(
                        child: Text(
                          'Tukarkan point',
                          style: AppFont.textFillButtonActive,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

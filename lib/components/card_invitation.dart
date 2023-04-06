import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class CardInvitation extends StatelessWidget {
  const CardInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      //create note screen text in middle
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
              BorderSide(color: AppColorNeutral.neutral2, width: 1)),
          borderRadius: BorderRadius.circular(4),
          color: AppColorNeutral.neutral1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // content of component
          children: [
            // message invitation
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=900&t=st=1680684886~exp=1680685486~hmac=b9176641b65dc64df37ed7f0cfba49259ea8908fbe7bd96cecc07b7d42e46633"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: RichText(
                          overflow: TextOverflow.visible,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Nadim Makarim",
                                style: AppFont.semiBold14,
                              ),
                              TextSpan(
                                text: " Melibatkan anda pada sebuah catatan",
                                style: AppFont.medium14,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.note_add,
                            color: AppColorPrimary.primary6,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Membeli Tiket Pesawat",
                            style: AppFont.textInvitation,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // button accept or reject
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(AppColorRed.red3),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: AppColor.borderErrorColor)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      'Tolak',
                      style: AppFont.textOutlineButton,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    overlayColor:
                        MaterialStatePropertyAll(AppColorPrimary.primary4),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.activeColor),
                  ),
                  child: Center(
                    child: Text(
                      'Terima',
                      style: AppFont.textFillButton,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

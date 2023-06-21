import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class HomeCardInvitation extends StatefulWidget {
  const HomeCardInvitation({super.key});

  @override
  State<HomeCardInvitation> createState() => _HomeCardInvitationState();
}

class _HomeCardInvitationState extends State<HomeCardInvitation> {
  bool _isDone = false;
  @override
  bool _isAccept = false;
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: const Border.fromBorderSide(
          BorderSide(color: AppColorNeutral.neutral2, width: 1),
        ),
        borderRadius: BorderRadius.circular(4),
        color: AppColorNeutral.neutral1,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=900&t=st=1680684886~exp=1680685486~hmac=b9176641b65dc64df37ed7f0cfba49259ea8908fbe7bd96cecc07b7d42e46633',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Nadim Makarim',
                        style: AppFont.semiBold14,
                      ),
                      TextSpan(
                        text: ' mengirim anda sebuah catatan.',
                        style: AppFont.regular12,
                      ),
                      TextSpan(
                        text: ' 10 menit lalu',
                        style: AppFont.textDescription,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.note_add_outlined,
                        color: AppColorPrimary.primary5,
                      ),
                      Text(
                        'Membeli tiket pesawat',
                        style: AppFont.textInvitation,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _isDone ? textResponse(_isAccept) : buttonOffering(),
              ],
            ),
          )
        ],
      ),
    );
    // SizedBox(
    //   // width: MediaQuery.of(context).size.width,
    //   //create note screen text in middle
    //   child: Container(
    //     // width: MediaQuery.of(context).size.width,
    //     height: 150,
    //     decoration: BoxDecoration(
    //       border: const Border.fromBorderSide(
    //           BorderSide(color: AppColorNeutral.neutral2, width: 1)),
    //       borderRadius: BorderRadius.circular(4),
    //       color: AppColorNeutral.neutral1,
    //     ),
    //     child: SizedBox(
    //       // height: 70,
    //       child: Container(
    //         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 CachedNetworkImage(
    //                   imageUrl:
    //                       'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=900&t=st=1680684886~exp=1680685486~hmac=b9176641b65dc64df37ed7f0cfba49259ea8908fbe7bd96cecc07b7d42e46633',
    //                   placeholder: (context, url) =>
    //                       CircularProgressIndicator(),
    //                   errorWidget: (context, url, error) => Icon(Icons.error),
    //                   imageBuilder: (context, imageProvider) => Container(
    //                     width: 50,
    //                     height: 50,
    //                     decoration: BoxDecoration(
    //                       shape: BoxShape.circle,
    //                       image: DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: imageProvider,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               width: 12,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width - 100,
    //                   child: RichText(
    //                     overflow: TextOverflow.visible,
    //                     text: TextSpan(
    //                       children: [
    //                         TextSpan(
    //                           text: "Nadim Makarim",
    //                           style: AppFont.semiBold14,
    //                         ),
    //                         TextSpan(
    //                           text: " Melibatkan anda pada sebuah catatan",
    //                           style: AppFont.medium14,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     Icon(
    //                       Icons.note_add,
    //                       color: AppColorPrimary.primary6,
    //                     ),
    //                     SizedBox(
    //                       width: 8,
    //                     ),
    //                     Text(
    //                       "Membeli Tiket Pesawat",
    //                       style: AppFont.textInvitation,
    //                     ),
    //                   ],
    //                 ),
    //                 _isDone ? textResponse(_isAccept) : buttonOffering(),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget buttonOffering() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              _isAccept = false;
              _isDone = true;
              // setState(() {
              // });
            },
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
                style: AppFont.textErrorOutlineButton,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isAccept = true;
                _isDone = true;
              });
            },
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(AppColorPrimary.primary4),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              ),
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(AppColor.activeColor),
            ),
            child: Center(
              child: Text(
                'Terima',
                style: AppFont.textFillButtonActive,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textResponse(bool response) {
    return Expanded(
      child: response
          ? Text('Selamat anda telah menerima catatan ini.',
              style: AppFont.medium14)
          : Text(
              'Anda menolak catatan ini.',
              style: AppFont.textUploadError,
            ),
    );
  }
}

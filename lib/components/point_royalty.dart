import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/point/point_screen.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/user_viewmodel.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PointRoyalty extends StatefulWidget {
  const PointRoyalty({super.key});

  @override
  State<PointRoyalty> createState() => _PointRoyaltyState();
}

class _PointRoyaltyState extends State<PointRoyalty> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewModel>(
      builder: (context, user, child) {
        // if (point.appState == AppState.loading) {
        //   return _loadingContainer();
        // }
        // if (point.appState == AppState.loading) {
        //   return _loadingContainer();
        // }
        // if (point.appState == AppState.loading) {
        //   return _loadingContainer();
        // }
        // if (point.appState == AppState.loading) {
        //   return _loadingContainer();
        // }
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PointScreen(
                    point: user.listOfUsers.point,
                  ),
                ));
          },
          child: Container(
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
                    Consumer<UsersViewModel>(
                      builder: (context, point, child) {
                        if (point.appState == AppState.loading) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: ShimmerContainer.rectangle(
                                height: 20, width: 60),
                          );
                        }
                        if (point.appState == AppState.loaded) {
                          return Text(
                            '${point.listOfUsers.point}',
                            // "100",
                            style: AppFont.regular20,
                          );
                        }
                        if (point.appState == AppState.noData) {
                          return Text(
                            "0",
                            style: AppFont.regular20,
                          );
                        }
                        if (point.appState == AppState.failure) {
                          return Text(
                            "gagal",
                            style: AppFont.regular20,
                          );
                        }
                        return const SizedBox();
                      },
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
                      Consumer<UsersViewModel>(
                        builder: (context, point, child) {
                          if (point.appState == AppState.loading) {
                            return const ShimmerContainer.rectangle(
                                height: 20, width: 60);
                          }
                          if (point.appState == AppState.loaded) {
                            return Text(
                              "${point.listOfUsers.notesCount}",
                              style: AppFont.quotaOfNote,
                            );
                          }
                          if (point.appState == AppState.noData) {
                            return Text(
                              "0",
                              style: AppFont.regular20,
                            );
                          }
                          if (point.appState == AppState.failure) {
                            return Text(
                              "gagal",
                              style: AppFont.regular20,
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

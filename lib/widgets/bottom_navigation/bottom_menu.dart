import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:bantuin/widgets/bottom_navigation/list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomMenu extends StatefulWidget {
  BottomMenu({Key? key, required this.currentScreen, required this.currentTab})
      : super(key: key);
  Widget currentScreen;
  int currentTab;

  @override
  State<BottomMenu> createState() =>
      _BottomMenuState(currentTab: currentTab, currentScreen: currentScreen);
}

class _BottomMenuState extends State<BottomMenu> {
  _BottomMenuState({required this.currentTab, required this.currentScreen});
  Widget currentScreen;
  int currentTab;

  final PageStorageBucket bucket = PageStorageBucket();
  late ListMenu statusLayar;

  @override
  void initState() {
    statusLayar = ListMenu(
        currentTab,
        currentScreen,
        UsersDetailModel(
          email: '',
          id: 0,
          job: '',
          phone: '',
          username: '',
          photo: '',
          notesCount: 0,
          point: 0,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldpop = await showDialog<bool>(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0)),
            title: const Text('Keluar Aplikasi'),
            content: const Text('Apakah kamu yakin keluar aplikasi?'),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Iya',
                  style: GoogleFonts.ibmPlexSans(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppColorPrimary.primary6),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Tidak',
                  style: GoogleFonts.ibmPlexSans(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppColorPrimary.primary6),
                ),
              )
            ],
          ),
        );
        return shouldpop!;
      },
      child: Scaffold(
        extendBody: true,
        body: PageStorage(
          child: statusLayar.screens[statusLayar.currentTab],
          bucket: bucket,
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   heroTag: "btnnotescreen",
        //   backgroundColor: Colors.transparent,
        //   child: Container(
        //     height: 60,
        //     width: 60,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       gradient: LinearGradient(
        //         colors: [
        //           Color.fromARGB(255, 0, 0, 183),
        //           Color.fromARGB(255, 0, 25, 246),
        //         ],
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //       ),
        //     ),
        //     child: Image.asset(
        //       'lib/assets/images/logo.png',
        //       height: 50,
        //       width: 50,
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.push((context),
        //         MaterialPageRoute(builder: (context) => const NoteScreen()));
        //   },
        // ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          elevation: 9,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.2,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            statusLayar.currentTab = 0;
                            statusLayar.screens[0];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "lib/assets/icons/Home.svg",
                              height: 26,
                              width: 26,
                              color: statusLayar.currentTab == 0
                                  ? AppColorPrimary.primary6
                                  : Colors.black,
                            ),
                            // Icon(
                            //   Icons.home_filled,
                            //   color: statusLayar.currentTab == 0
                            //       ? AppColorPrimary.primary6
                            //       : Colors.grey,
                            // ),
                            Text(
                              'Beranda',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 9,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: statusLayar.currentTab == 0
                                    ? AppColorPrimary.primary6
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            statusLayar.currentTab = 1;
                            statusLayar.screens[1];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "lib/assets/icons/Task 2.svg",
                              height: 26,
                              width: 26,
                              color: statusLayar.currentTab == 1
                                  ? AppColorPrimary.primary6
                                  : Colors.black,
                            ),
                            // Icon(
                            //   Icons.mail_outline_rounded,
                            //   color: statusLayar.currentTab == 2
                            //       ? AppColorPrimary.primary6
                            //       : Colors.grey,
                            // ),
                            Text(
                              'Catatan',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 9,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: statusLayar.currentTab == 1
                                    ? AppColorPrimary.primary6
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            statusLayar.currentTab = 2;
                            statusLayar.screens[2];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "lib/assets/icons/Team.svg",
                              height: 26,
                              width: 26,
                              color: statusLayar.currentTab == 2
                                  ? AppColorPrimary.primary6
                                  : Colors.black,
                            ),
                            // Icon(
                            //   Icons.group_add_rounded,
                            //   color: statusLayar.currentTab == 1
                            //       ? AppColorPrimary.primary6
                            //       : Colors.grey,
                            // ),
                            Text(
                              'Tim',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 9,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: statusLayar.currentTab == 2
                                    ? AppColorPrimary.primary6
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 25),
                //   width: size.width * 0.2,
                //   alignment: Alignment.center,
                //   child: Text(
                //     'Catatan',
                //     style: GoogleFonts.ibmPlexSans(
                //       fontSize: 9,
                //       fontStyle: FontStyle.normal,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.2,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            statusLayar.currentTab = 3;
                            statusLayar.screens[3];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "lib/assets/icons/email.svg",
                              height: 26,
                              width: 26,
                              color: statusLayar.currentTab == 3
                                  ? AppColorPrimary.primary6
                                  : Colors.black,
                            ),
                            // Icon(
                            //   Icons.mail_outline_rounded,
                            //   color: statusLayar.currentTab == 2
                            //       ? AppColorPrimary.primary6
                            //       : Colors.grey,
                            // ),
                            Text(
                              'Undangan',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 9,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: statusLayar.currentTab == 3
                                    ? AppColorPrimary.primary6
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: MaterialButton(
                        minWidth: 9,
                        onPressed: () {
                          setState(() {
                            statusLayar.currentTab = 4;
                            statusLayar.screens[4];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "lib/assets/icons/Avatar.svg",
                              height: 26,
                              width: 26,
                              color: statusLayar.currentTab == 4
                                  ? AppColorPrimary.primary6
                                  : Colors.black,
                            ),
                            // Icon(
                            //   Icons.account_circle,
                            //   color: statusLayar.currentTab == 3
                            //       ? AppColorPrimary.primary6
                            //       : Colors.grey,
                            // ),
                            Text(
                              'Profil',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 9,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: statusLayar.currentTab == 4
                                    ? AppColorPrimary.primary6
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

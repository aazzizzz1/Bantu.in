import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:bantuin/widgets/bottom_navigation/list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    // TODO: implement initState
    statusLayar = ListMenu(currentTab, currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldpop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: const Text('Exit App'),
            content: const Text('Are you sure to exit the app?'),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.tealAccent[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Colors.tealAccent[700],
                    fontWeight: FontWeight.bold,
                  ),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          heroTag: "btnnotescreen",
          backgroundColor: Colors.transparent,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 0, 183)!,
                  Color.fromARGB(255, 0, 25, 246)!,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Image.asset(
              'lib/assets/images/logo.png',
              height: 50,
              width: 50,
            ),
          ),
          onPressed: () {
            Navigator.push((context),
                MaterialPageRoute(builder: (context) => const NoteScreen()));
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          elevation: 10,
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
                            Icon(
                              Icons.home_filled,
                              color: statusLayar.currentTab == 0
                                  ? AppColorPrimary.primary6
                                  : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: statusLayar.currentTab == 0
                                    ? AppColorPrimary.primary6
                                    : Colors.grey,
                                fontFamily: 'Poppins',
                                fontSize: 10,
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
                            Icon(
                              Icons.group_add_rounded,
                              color: statusLayar.currentTab == 1
                                  ? AppColorPrimary.primary6
                                  : Colors.grey,
                            ),
                            Text(
                              'Tim',
                              style: TextStyle(
                                color: statusLayar.currentTab == 1
                                    ? AppColorPrimary.primary6
                                    : Colors.grey,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: size.width * 0.2,
                  alignment: Alignment.center,
                  child: const Text(
                    'Notes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
                Row(
                  children: [
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
                            Icon(
                              Icons.mail_outline_rounded,
                              color: statusLayar.currentTab == 2
                                  ? AppColorPrimary.primary6
                                  : Colors.grey,
                            ),
                            Text(
                              'Invitation',
                              style: TextStyle(
                                color: statusLayar.currentTab == 2
                                    ? AppColorPrimary.primary6
                                    : Colors.grey,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: MaterialButton(
                        minWidth: 10,
                        onPressed: () {
                          setState(() {
                            statusLayar.currentTab = 3;
                            statusLayar.screens[3];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: statusLayar.currentTab == 3
                                  ? AppColorPrimary.primary6
                                  : Colors.grey,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: statusLayar.currentTab == 3
                                    ? AppColorPrimary.primary6
                                    : Colors.grey,
                                fontFamily: 'Poppins',
                                fontSize: 10,
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

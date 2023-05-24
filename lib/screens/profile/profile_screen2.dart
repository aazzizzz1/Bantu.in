import 'package:bantuin/models/user_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant.dart';
import '../../view_models/user_viewmodel.dart';
import '../auth/login_screen.dart';
import 'edit_profile.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({super.key});

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  String password = '';
  TextEditingController _passwordController = TextEditingController();

  @override
  Future getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      password = prefs.getString('password').toString();
    });
  }

  void initState() {
    // TODO: implement initState
    // Future.microtask(() =>
    //     Provider.of<PasswordViewModel>(context, listen: false).getPassword());
    Future.microtask(
        () => Provider.of<UsersViewModel>(context, listen: false).getUsers());
    getDataUser();
    _passwordController.text = password;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                InkWell(
                  child: Text(
                    'Edit Foto Profil',
                    style: AppFont.textButtonActive,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Informasi Personal',
                      style: AppFont.textTitleScreen,
                    ),
                    Consumer<UsersViewModel>(
                      builder: (context, value, child) {
                        var data = value.listOfUsers;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                        usersDetail: data,
                                      )),
                            );
                          },
                          child: Text(
                            'Ubah',
                            style: AppFont.textButtonActive,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Consumer<UsersViewModel>(
                  builder: (context, value, child) {
                    var data = value.listOfUsers;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama',
                          style: AppFont.textNotificationTime,
                        ),
                        SizedBox(height: 7),

                        Text(
                          data.username,
                          style: AppFont.medium14,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Email',
                          style: AppFont.textNotificationTime,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          data.email,
                          style: AppFont.medium14,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pekerjaan',
                          style: AppFont.textNotificationTime,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          data.job,
                          style: AppFont.medium14,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Nomor Telepon',
                          style: AppFont.textNotificationTime,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          data.phone,
                          style: AppFont.medium14,
                        ),
                        Divider(thickness: 1, color: AppColorNeutral.neutral2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Password',
                              style: AppFont.semiBold16w500,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: AppFont.semiBold16w500,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   (context),
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           EditPasswordProfile(users: users,)),
                                // );
                              },
                              child: const Text('Ubah'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(' ${password.replaceAll(RegExp(r"."), "●")}'),
                        // Consumer<PasswordViewModel>(
                        //   builder: (context, pass, child) {
                        //     var data = pass.listOfPassword;
                        //     return Text(
                        //       data.password,
                        //       style: AppFont.regular16w500,
                        //     );
                        //   },
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  height: 37,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: AppColor.errorColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(5.0),
                      primary: Colors.white,
                      shadowColor: Colors.black,
                      textStyle: AppFont.semiBold16w500,
                    ),
                    onPressed: () {
                      Navigator.push(
                        (context),
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text('Keluar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

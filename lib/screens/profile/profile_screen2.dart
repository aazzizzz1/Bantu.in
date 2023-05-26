import 'dart:io';

import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/profile/edit_password_profile.dart';
import 'package:bantuin/utils/navigator_fade_transition.dart';
import 'package:bantuin/view_models/login_viewmodel.dart';
import 'package:bantuin/view_models/user_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant.dart';
import '../../view_models/user_viewmodel.dart';
import '../auth/login_screen.dart';
import 'edit_profile.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  String password = '';
  PlatformFile platformFileUrl = PlatformFile(name: '', size: 0, path: '');
  File _fileUrl = File('');

  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<UsersViewModel>(context, listen: false).getUsers();
      getDataUser();
    });
    _passwordController.text = password;
  }

  Future<void> getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      password = prefs.getString('password') ?? '';
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null && result.files.isNotEmpty) {
      /// Load result and file details
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      /// normal file
      File _file = File(result.files.single.path!);
      setState(() {
        platformFileUrl = result.files.first;
        _fileUrl = _file;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                Consumer<UsersViewModel>(
                  builder: (context, value, child) {
                    var data = value.listOfUsers;
                    return Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: data.photo,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                        Consumer<UsersViewModel>(
                          builder: (context, value, child) {
                            final UsersDetailModel data = value.listOfUsers;
                            return InkWell(
                              onTap: () async {
                                try {
                                  await _pickFile();
                                  if (_fileUrl != null) {
                                    await value.updateProfilePicture(
                                        data, Photo(photo: _fileUrl));
                                    Fluttertoast.showToast(
                                      msg: "Berhasil mengubah foto profil",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColor.activeColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }
                                  print(_fileUrl);
                                } catch (e) {
                                  Fluttertoast.showToast(
                                    msg: e.toString(),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: AppColor.activeColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  print(e.toString());
                                }
                              },
                              child: Text(
                                'Edit Foto Profil',
                                style: AppFont.textButtonActive,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
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
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(
                                  usersDetail: data,
                                ),
                              ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPasswordProfile(),
                                  ),
                                );
                              },
                              child: const Text('Ubah'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(' ${password.replaceAll(RegExp(r"."), "●")}'),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
                _logout(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logout({required BuildContext context}) {
    return Consumer<LoginViewModel>(
      builder: (context, login, _) => SizedBox(
          width: 140,
          child: Container(
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
              onPressed: () async {
                await login.logout().then(
                      (_) => Fluttertoast.showToast(msg: "Berhasil Keluar").then(
                        (_) => Navigator.of(context).pushAndRemoveUntil(
                            NavigatorFadeTransitionHelper(
                                child: const LoginScreen()),
                            (route) => false),
                      ),
                    );
              },
              child: const Text('Keluar'),
            ),
          )),
    );
  }
}
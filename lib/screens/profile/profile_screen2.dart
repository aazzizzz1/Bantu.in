import 'dart:io';

import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/profile/edit_password_profile.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/screens/reminder/remainder_screen.dart';
import 'package:bantuin/utils/navigator_fade_transition.dart';
import 'package:bantuin/view_models/login_viewmodel.dart';
import 'package:bantuin/view_models/user_viewmodel.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
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
                    if (value.appState == AppState.loading) {
                      return ShimmerContainer.circular(height: 160, width: 160);
                    }
                    if (value.appState == AppState.loaded) {
                      return Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: data.photo,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
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
                                    await _pickFile()
                                        .then(
                                          (_) => value.updateImageProfile(
                                              id: data.id,
                                              selectedFile: _fileUrl),
                                        )
                                        .then(
                                          (value) => Fluttertoast.showToast(
                                              msg:
                                                  'berhasil mengubah foto profile'),
                                        );
                                  } catch (e) {
                                    await Fluttertoast.showToast(
                                      msg: e.toString(),
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColor.activeColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
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
                    }
                    if (value.appState == AppState.failure) {
                      return Column(
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColorNeutral.neutral3),
                            child: const Text(
                              'Gagal memuat foto',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Consumer<UsersViewModel>(
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () async {},
                                child: Text(
                                  'Edit Foto Profil',
                                  style: AppFont.textButtonActive,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
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
                        _loadingContainer(data.username),
                        // Text(
                        //   data.username,
                        //   style: AppFont.medium14,
                        // ),
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
                        _loadingContainer(data.email),
                        // Text(
                        //   data.email,
                        //   style: AppFont.medium14,
                        // ),
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
                        _loadingContainer(data.job),
                        // Text(
                        //   data.job,
                        //   style: AppFont.medium14,
                        // ),
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
                        _loadingContainer(data.phone),
                        // Text(
                        //   data.phone,
                        //   style: AppFont.medium14,
                        // ),
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
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemainderScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Buat remainder',
                    style: AppFont.medium14,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.activeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _logout(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingContainer(String data) {
    return Consumer<UsersViewModel>(
      builder: (context, user, child) {
        if (user.appState == AppState.loading) {
          return ShimmerContainer.rectangle(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.5,
          );
        }
        if (user.appState == AppState.loaded) {
          return Text(
            data,
            style: AppFont.medium14,
          );
        }
        if (user.appState == AppState.noData) {
          return Text(
            'kosong',
            style: AppFont.medium14,
          );
        }
        if (user.appState == AppState.failure) {
          return Text(
            'gagal',
            style: AppFont.medium14,
          );
        }
        return const SizedBox();
      },
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
                      (_) =>
                          Fluttertoast.showToast(msg: "Berhasil Keluar").then(
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

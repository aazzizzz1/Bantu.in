import 'dart:convert';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/auth/login_screen.dart';
import 'package:bantuin/screens/profile/edit_password_profile.dart';
import 'package:bantuin/screens/profile/edit_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Informasi Personal',
          style: AppFont.regular20,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(children: [
                Image(
                  image: AssetImage('lib/assets/images/backtim.png'),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 37,
                        margin: EdgeInsets.only(top: 70),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.activeColor,
                              AppColor.secondColor
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
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
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()),
                            );
                          },
                          child: const Text('Edit Foto Profil'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nama',
                                  style: AppFont.semiBold16w500,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: AppFont.semiBold16w500,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile()),
                                    );
                                  },
                                  child: const Text('Ubah'),
                                ),
                              ],
                            ),
                            Text(
                              'Aziz',
                              style: AppFont.regular16w500,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Email',
                              style: AppFont.semiBold16w500,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'azizvbi33@gmail.com',
                              style: AppFont.regular16w500,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Pekerjaan',
                              style: AppFont.semiBold16w500,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Programer',
                              style: AppFont.regular16w500,
                            ),
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
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditPasswordProfile()),
                                    );
                                  },
                                  child: const Text('Ubah'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              '********',
                              style: AppFont.regular16w500,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
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
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: const Text('Keluar'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: CircleAvatar(
                radius: 88,
                backgroundColor: const Color(0xFFFFFFFF),
                child: CachedNetworkImage(
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
                        fit: BoxFit.cover,
                        image: imageProvider,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

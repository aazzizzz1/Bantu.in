import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/notification/notification_screen.dart';
import 'package:bantuin/screens/point/detail_product_redeem.dart';
import 'package:bantuin/screens/point/point_screen.dart';
import 'package:bantuin/screens/splash/splash_screen.dart';
import 'package:bantuin/utils/routes.dart';
import 'package:bantuin/view_models/invitation_viewmodel.dart';
import 'package:bantuin/view_models/login_viewmodel.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/view_models/password_viewmodel.dart';
import 'package:bantuin/view_models/product_viewmodel.dart';
import 'package:bantuin/view_models/register_viewmodel.dart';
import 'package:bantuin/view_models/ringtone_viewmodel.dart';
import 'package:bantuin/view_models/user_viewmodel.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/auth/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RingtoneViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeamViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => InvitationViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Bantuin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

//coba
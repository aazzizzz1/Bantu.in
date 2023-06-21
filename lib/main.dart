import 'package:alarm/alarm.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/notification/notification_screen.dart';
import 'package:bantuin/screens/point/detail_product_redeem.dart';
import 'package:bantuin/screens/point/point_screen.dart';
import 'package:bantuin/screens/splash/splash_screen.dart';
import 'package:bantuin/utils/routes.dart';
import 'package:bantuin/view_models/column_viewmodel.dart';
import 'package:bantuin/view_models/history_viewmodel.dart';
import 'package:bantuin/view_models/invitation_viewmodel.dart';
import 'package:bantuin/view_models/login_viewmodel.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/view_models/notification_viewmodel.dart';
import 'package:bantuin/view_models/password_viewmodel.dart';
import 'package:bantuin/view_models/product_viewmodel.dart';
import 'package:bantuin/view_models/register_viewmodel.dart';
import 'package:bantuin/view_models/ringtone_viewmodel.dart';
import 'package:bantuin/view_models/user_viewmodel.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/auth/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import '';

void main() async {
  runApp(const MyApp());
  await FlutterDownloader.initialize(debug: true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterExceptionHandler? originalOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError!(errorDetails);
  };
  await Alarm.init(showDebugLogs: true);
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
        ChangeNotifierProvider(
          create: (context) => ColumnViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Bantuin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        home: const SplashScreen(),
      ),
    );
  }
}

//coba
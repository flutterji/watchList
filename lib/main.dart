import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/dashBoard/dash_Board_Page.dart';
import 'package:flutter_application_1/loginPage/login_And_Sign_In_Page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


bool isLoggedIn = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final key = "my_16_byte_key!!";
  await EncryptedSharedPreferences.initialize(key);
    var sharedPref = EncryptedSharedPreferences.getInstance();

   isLoggedIn =   sharedPref.getBool('userLoggedIn') == null ? false : true; 

  await Supabase.initialize(
    url: 'https://cdoyxizflkxixxgnmmvy.supabase.co', 
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkb3l4aXpmbGt4aXh4Z25tbXZ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4OTU5NzMsImV4cCI6MjA2MzQ3MTk3M30.TeAA4kNXMk6rohN4bgtm1UnbA_F_Lpsbif6ZiJfGYG0', // 🔁 Replace this
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: backgroundBlackColor, 
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(410, 840),

      child: MaterialApp(
        theme: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(primaryColor: blueColor),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: blueColor, // Change the cursor color. Change red to blue or as per your requirement
        )),
        debugShowCheckedModeBanner: false,
        home: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),

          child: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),

        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle
              .light, // to change the status bar icon color to white
          elevation: 0.0,
        ),
      ),
      body: isLoggedIn ? DashBoardPage() : LoginAndSignInPage(),
    );
  }
}


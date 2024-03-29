import 'package:flutter/material.dart';
import 'package:kltn_mobile/Authentication/forget_password.dart';
import 'package:kltn_mobile/Authentication/login_page.dart';
import 'package:kltn_mobile/Authentication/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Khải - share prefs - 8/10
  late SharedPreferences logindata;
  late bool login;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    login = (logindata.getBool('login') ?? true);
    if (login == false) {
      logindata.setString('username', 'user');
    }
  }
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: {
        //   'FirstPage': (context) => FirstPage(),
        // },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(125, 31, 31, 1.0)),
          useMaterial3: true,
          focusColor: const Color.fromRGBO(125, 31, 31, 1.0),
          hoverColor: const Color.fromRGBO(125, 31, 31, 1.0),
        ),
        home: const LoginPage());
  }
}

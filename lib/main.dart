import 'package:design_app/pages/home_page.dart';
import 'package:design_app/pages/home_page_future.dart';
import 'package:design_app/pages/login_page.dart';
import 'package:design_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePageFuture()
          : LoginPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage()
      },
    );
  }
}

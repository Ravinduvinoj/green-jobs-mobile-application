import 'package:flutter/material.dart';
import 'package:mobileapp/pages/ad_view.dart';
import 'package:mobileapp/pages/apply.dart';
import 'package:mobileapp/pages/home_page.dart';
// import 'package:mobileapp/pages/login_page.dart';
// import 'package:mobileapp/pages/register_page.dart';
// import 'package:mobileapp/pages/login_page.dart';


Widget _defaultHome = const HomePage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // bool _result = await SharedService.isLoggedIn();

  // if (_result) {
  //   _defaultHome = const HomePage();
  // }

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Jobs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => _defaultHome,
        '/home': (context) => const HomePage(),
        '/Adview':(context)=> const Addshow(),
        '/apply' : (context)=> const application(),
        
        // '/login': (context) => const LoginPage(),
        // '/register': (context) => const RegisterPage(),
      },
    );
  }
}


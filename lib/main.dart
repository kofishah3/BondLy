import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:bondly/colors.dart';

// pages imports
import 'package:bondly/pages/landingpage.dart';
import 'package:bondly/pages/loginpage.dart';
import 'package:bondly/pages/signuppage.dart';
import 'package:bondly/pages/createprofile.dart';
import 'package:bondly/pages/cp_aboutyourself.dart';
import 'package:bondly/pages/cp_preferences.dart';
import 'package:bondly/pages/setupcomplete.dart';
import 'package:bondly/pages/homepage/homepage.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      //please rename home to landingpage
      GoRoute(path: '/', builder: (context, state) => LandingPage()), 
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => SignUpPage()),
      GoRoute(path: '/createprofile', builder: (context, state) => CreateProfilePage()),
      GoRoute(path: '/cp_aboutyourself', builder: (context, state) => CpAboutyourself()),
      GoRoute(path: '/cp_preferences', builder: (context, state) => CpPreferences()),
      GoRoute(path: '/setupcomplete', builder: (context, state) => SetUpComplete()),
      GoRoute(path: '/homepage', builder: (context, state) => HomePage()),

    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router
    (
      title: 'BondLy',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      
      debugShowCheckedModeBanner: false,
      
      routerConfig: _router,
    );
  }
}
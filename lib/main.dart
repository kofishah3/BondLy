import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// pages imports
import 'package:bondly/pages/landingpage.dart';
import 'package:bondly/pages/loginpage.dart';
import 'package:bondly/pages/signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      //please rename home to landingpage
      GoRoute(path: '/', builder: (context, state) => LandingPage()), 
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => SignUpPage()),
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
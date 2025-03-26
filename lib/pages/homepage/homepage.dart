import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets.dart';
import 'package:bondly/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static TextStyle optionStyle = TextStyle(color: defaultTextColor, fontSize: 30, fontWeight: FontWeight.w700);
  final List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Friends', style: optionStyle),
    Text('Index 2: Calendar', style: optionStyle),
    Text('Index 3: Memories', style: optionStyle),
    Text('Index 4: Profile', style: optionStyle),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: whiteGradientBg),
        child: Stack(
          children:[
            Center(child: _widgetOptions.elementAt(_selectedIndex)),

            Align(
              alignment: Alignment.bottomCenter,
              child: bottomNavBar(),
            )
          ],
        )
      ),
    );
  }

  Container bottomNavBar() {
    final themeProvider = Provider.of<ThemeProvider>(context);    

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, spreadRadius: 3, offset: Offset(0, 5))],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),

        child: BottomNavigationBar(
          //dont give it appearance, make the container have the appearance
          backgroundColor: Colors.transparent,
          elevation: 0,

          type: BottomNavigationBarType.shifting,
          selectedItemColor: themeProvider.currentThemeColor,
          unselectedItemColor: defaultTextColor,
        
          selectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: themeProvider.currentThemeColor,
          ),
        
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: defaultTextColor
          ),
          
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.people_outline_rounded), label: 'FRIENDS'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'PLANS'),
            BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: 'MEMORIES'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'PROFILE'),
          ],
        
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
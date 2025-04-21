import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bondly/providers/theme_provider.dart';
import 'package:bondly/screens/main_hub/homepageIndices/hp_homewidget.dart';

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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    TextStyle optionStyle = TextStyle(color: themeProvider.currentTextColor, fontSize: 30, fontWeight: FontWeight.w700);
    final List<Widget> _widgetOptions = <Widget>[
      HomeWidget(themeProvider: themeProvider),

      Stack(
        alignment: Alignment.topCenter,
        children: [      
          SafeArea(            
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Centered title
                Text(
                  "Friends",
                  style: TextStyle(
                    color: themeProvider.currentTextColor,
                    shadows: [defaultTextShadow],
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Row of icons overlaid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline),
                      iconSize: 25,
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none_outlined),
                          iconSize: 25,
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz),
                          iconSize: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      Text('Index 2: Calendar', style: optionStyle),
      Text('Index 3: Memories', style: optionStyle),
      Text('Index 4: Profile', style: optionStyle),
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: themeProvider.currentGradientBg),
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

    final Color navBarColor;

    if(themeProvider.currentGradientBg == whiteGradientBg)
    {
      navBarColor = Colors.white;
    }
    else
    {
      navBarColor = Color(0xFF1E1E2E);
    }

    return Container(
      decoration: BoxDecoration(
        gradient: themeProvider.currentGradientBg,
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
          unselectedItemColor: themeProvider.currentTextColor,
        
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
            color: themeProvider.currentTextColor
          ),
          
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME', backgroundColor: navBarColor),
            BottomNavigationBarItem(icon: Icon(Icons.people_outline_rounded), label: 'FRIENDS', backgroundColor: navBarColor),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'PLANS', backgroundColor: navBarColor),
            BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: 'MEMORIES', backgroundColor: navBarColor),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'PROFILE', backgroundColor: navBarColor),
          ],
        
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
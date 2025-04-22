import 'package:flutter/material.dart';

import 'package:bondly/providers/theme_provider.dart';
import 'package:bondly/widgets/friends_card.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(          
          child: Column(            
            children: [
              header(),

              TabBar(                
                labelColor: themeProvider.currentThemeColor,
                unselectedLabelColor: themeProvider.currentTextColor,
                indicatorColor: themeProvider.currentThemeColor,
                tabs: [
                  Tab(text: "All",),
                  Tab(text: "People"),
                  Tab(text: "Groups"),
                ],
              ),

              Expanded( 
                child: TabBarView(
                  children: [
                    // Tab 1: Scrollable List
                    ListView.builder(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 60),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: FriendsCard(
                            themeProvider: themeProvider,
                            index: index,
                          ),
                        );
                      },
                    ),

                    // Tab 2
                    const Center(child: Icon(Icons.person)),

                    // Tab 3
                    const Center(child: Icon(Icons.group)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Stack(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
              iconSize: 25,
            ),
          ],
        ),
      ],
    );
  }
}



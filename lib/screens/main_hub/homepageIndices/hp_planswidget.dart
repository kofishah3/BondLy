import 'package:flutter/material.dart';

import 'package:bondly/providers/theme_provider.dart';
import 'package:bondly/widgets/custom_dropdown.dart';

const List<String> tempPeopleList = ['All', 'Person1', 'Person2', 'Person3', 'Person4',];
const List<String> tempFilterList = ['None', 'Movies', 'Games', 'Hangout', 'Travel',];

class PlansWidget extends StatelessWidget {
  const PlansWidget({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  Tab(
                    text: "Activities",
                  ),
                  Tab(text: "Calendar"),
                ],
                
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //first tab, for activities
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        CustomDropDownFilter(
                          themeProvider: themeProvider,
                          chosenIcon: Icons.people_outline_rounded,
                          items: tempPeopleList,
                          dropDownColor: themeProvider.currentTextColor
                              .withOpacity(0.3),
                          labelFontColor: themeProvider.currentTextColor
                        ),

                        SizedBox(height: 10,),
                        CustomDropDownFilter(
                          themeProvider: themeProvider,
                          chosenIcon: Icons.filter_alt_outlined,
                          items: tempFilterList,
                          dropDownColor: themeProvider.currentTextColor
                              .withOpacity(0.3),
                          labelFontColor: themeProvider.currentTextColor
                        )
                      ],
                    ),

                    //second tab for calendar
                    Icon(Icons.abc),
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
          "Plans",
          style: TextStyle(
            color: themeProvider.currentTextColor,
            shadows: [defaultTextShadow],
            fontSize: 26,
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

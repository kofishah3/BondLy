import 'package:flutter/material.dart';

import 'package:bondly/providers/theme_provider.dart';

// tentative for replacement because it only allows one selection

class CustomSortFilter extends StatefulWidget {
  const CustomSortFilter({
    super.key,
    required this.themeProvider,
    required this.chosenIcon,
    required this.items,
    required this.dropDownColor,
    required this.labelFontColor,
  });

  final ThemeProvider themeProvider;
  final IconData chosenIcon;
  final List<dynamic> items;
  final Color dropDownColor;
  final Color labelFontColor;

  @override
  State<CustomSortFilter> createState() => _CustomSortFilterState();
}

class _CustomSortFilterState extends State<CustomSortFilter> {
  dynamic dropDownValue;

  @override
  void initState()
  {
    super.initState();
    dropDownValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {    
    return Container(  
      height: 37,                       
      decoration: BoxDecoration(
        color: widget.dropDownColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: defaultGrey
        )
      ),
  
      child: DropdownButton(        
        padding: EdgeInsets.all(10),        
        value: dropDownValue,              
        elevation: 10,
        underline: SizedBox(),
        dropdownColor: widget.dropDownColor,

        onChanged: (dynamic value) {
          setState(() {
            dropDownValue = value!;
          });
        },
        items:
            widget.items.map<DropdownMenuItem<String>>((dynamic value) {
          return DropdownMenuItem(value: value, child: Center(child: Text(value, style: TextStyle(color: widget.labelFontColor, fontSize: 12),)));
        }).toList(),

        isDense: true,
        menuMaxHeight: 250,
      )
    );
  }
}

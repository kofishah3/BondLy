import 'package:flutter/material.dart';

import 'package:bondly/providers/theme_provider.dart';

class CustomDropDownFilter extends StatefulWidget {
  const CustomDropDownFilter({
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
  State<CustomDropDownFilter> createState() => _CustomDropDownFilterState();
}

class _CustomDropDownFilterState extends State<CustomDropDownFilter> {
  dynamic dropDownValue;

  @override
  void initState()
  {
    super.initState();
    dropDownValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {    
    return Column(      
      children: [
        Container(  
          height: 45,                 
          decoration: BoxDecoration(
            color: widget.dropDownColor,
            borderRadius: BorderRadius.circular(10)
          ),

          child: DropdownButton(        
            padding: EdgeInsets.all(10),        
            value: dropDownValue,
            icon: Icon(
              widget.chosenIcon,
              size: 30,
              color: widget.labelFontColor.withOpacity(0.7),
            ),
            elevation: 10,
            onChanged: (dynamic value) {
              setState(() {
                dropDownValue = value!;
              });
            },
            items:
                widget.items.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            isExpanded: true,
          )
        )
      ],
    );
  }
}

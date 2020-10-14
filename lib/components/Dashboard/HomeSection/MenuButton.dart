import 'package:flutter/material.dart';

class MenuButtonHome extends StatelessWidget {
  final VoidCallback action;
  final Icon icon;
  final Text title;

  MenuButtonHome({this.action, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Column(
        children: [
          Padding(
            child: icon,
            padding: EdgeInsets.all(5),
          ),
          title
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

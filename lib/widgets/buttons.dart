import 'package:flutter/material.dart';

//Elevated Button with preset style, max width
Widget elevatedButton(String text, Function() fun, Color color) {
  return SizedBox(
    width: double.maxFinite,
    child: ElevatedButton(
      onPressed: fun,
      child: Text(text),
      style: ElevatedButton.styleFrom(primary: color),
    ),
  );
}

//Elevated Button with icon and preset style, max width
Widget elevatedButtonIcon(
    String text, Function() fun, Color color, IconData icon) {
  return SizedBox(
    width: double.maxFinite,
    child: ElevatedButton.icon(
      onPressed: fun,
      label: Text(text),
      style: ElevatedButton.styleFrom(primary: color),
      icon: Icon(icon),
    ),
  );
}

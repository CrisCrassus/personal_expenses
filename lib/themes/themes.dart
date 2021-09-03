import 'package:flutter/material.dart';

ThemeData themes(String theme) {
  final String choice = theme;

  switch (choice) {
    case "frost":
      return ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey[100],
          accentColor: Colors.blue[200],
          fontFamily: 'Raleway',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.dark().textTheme.copyWith(
                      headline6: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                  ))));
    case "sunburst":
      return ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.red[100],
          accentColor: Colors.amber[400],
          fontFamily: 'Raleway',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.dark().textTheme.copyWith(
                      headline6: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                  ))));
    default:
      throw FormatException('Theme not found. Try again!');
  }
}

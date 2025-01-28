import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.grey[400]!,
          secondary: Colors.grey[500]!,
          background: Colors.grey[900]!,
          surface: Colors.black87,
          onSurface: Colors.grey[300]!,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87,
          titleTextStyle: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.grey[300],
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.black87,
          margin: const EdgeInsets.only(bottom: 4),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey[300],
          ),
          titleMedium: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[300],
          ),
          titleSmall: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[400],
          ),
          bodyMedium: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.w500,
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.grey[850],
          textStyle: TextStyle(color: Colors.grey[300]),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: MaterialStateProperty.all(Colors.grey[850]),
          textStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.grey[300]),
          ),
          hintStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.grey[600]),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey[800],
        ),
      );
}

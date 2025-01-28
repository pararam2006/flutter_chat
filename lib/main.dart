import 'package:flutter/material.dart';
import 'registrationScreen.dart';
import 'authScreen.dart';
import 'chatScreen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        //Главный экран
        '/': (context) => RegistrationScreen(),
        'auth': (context) => AuthScreen(),
        'chat': (context) => ChatScreen(),
      },
    )
  );
}

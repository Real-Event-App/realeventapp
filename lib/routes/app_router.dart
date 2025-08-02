import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page.dart'; // importa a tua página de login

class AppRouter {
  static const String loginPage = '/login';

  static final routes = <String, WidgetBuilder>{
    loginPage: (context) => LoginPage(), // agora aponta para a página de login correta
    // '/home': (context) => HomePage(),
  };
}
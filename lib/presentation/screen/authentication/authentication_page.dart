import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/screen/authentication/register_page.dart';

import '../../../models/arguments.dart';
import '../../widgets/customBackground.dart';

import 'package:hexcolor/hexcolor.dart';

import '../splash_screen.dart';
import 'login_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  UserArguments? userDetails;
  int _selectedIndex = 0;
  double _curlyWaveHeight = 1.0;
  Color _bottomColor = HexColor("#fca272");

  List<String> title = [
    "",
    'Login',
    'Register',
    'Enter new password',
  ];

  _selectedPage(int index, UserArguments details) {
    setState(() {
      userDetails = details;
      _selectedIndex = index;
    });
  }

  _selectedWidget(index) {
    switch (index) {
      case 0:
        return SplashScreen(
          updateWidget: (index, details) => _selectedPage(index, details),
        );
      case 1:
        return LoginPage(
          updateWidget: (index, details) => _selectedPage(index, details),
          userDetails: userDetails ?? UserArguments(),
          title: title[_selectedIndex],
        );
      case 2:
        return RegisterPage(
          updateWidget: (index, details) => _selectedPage(index, details),
          userDetails: userDetails ?? UserArguments(),
          title: title[_selectedIndex],
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: _selectedWidget(_selectedIndex),
    );
  }
}

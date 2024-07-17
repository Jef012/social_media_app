import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/arguments.dart';

class SplashScreen extends StatefulWidget {
  final Function updateWidget;
  const SplashScreen({super.key, required this.updateWidget});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkUser = false;
  bool isLoading = false;
  checkUserData() async {
    final user = Provider.of<User?>(context);
    if (user != null) {
      checkUser = true;
    } else {
      checkUser = false;
    }
  }

  void navigate() {
    checkUserData();
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        isLoading = true;
      });
      if (checkUser) {
        Navigator.of(context).pushReplacementNamed('/customBottonNaviBar');
      } else {
        widget.updateWidget(1, UserArguments(newUser: true));
      }
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Social Media App",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

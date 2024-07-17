import 'package:flutter/material.dart';

import '../screen/authentication/authentication_page.dart';
import '../screen/home/homePage.dart';
import '../screen/profile/Profile.dart';

import '../screen/uploadPost/uploadPost.dart';
import '../widgets/customNavigationBar.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthenticationPage());
      case '/customBottonNaviBar':
        return MaterialPageRoute(builder: (_) => CustomBottonNaviBar());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/profilePage':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/uploadPostPage':
        return MaterialPageRoute(builder: (_) => UploadPostPage());
      default:
        return null;
    }
  }
}

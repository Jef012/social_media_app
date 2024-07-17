import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screen/home/homePage.dart';
import '../screen/profile/Profile.dart';

import '../screen/uploadPost/uploadPost.dart';

class CustomBottonNaviBar extends StatefulWidget {
  const CustomBottonNaviBar({Key? key}) : super(key: key);

  @override
  State<CustomBottonNaviBar> createState() => _CustomBottonNaviBarState();
}

class _CustomBottonNaviBarState extends State<CustomBottonNaviBar> {
  PersistentTabController? _controller;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      onPopInvoked: (didPop) {
        exit(0);
      },
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: navBarItems(height: height, width: width),
        confineInSafeArea: true,
        backgroundColor: Colors.black,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }
}

final List<Widget> _screens = [
  const HomePage(),
  const UploadPostPage(),
  const ProfilePage()
];

List<PersistentBottomNavBarItem> navBarItems({height, width}) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home, color: Colors.white, size: height * 0.04),
      inactiveIcon: Icon(Icons.home, color: Colors.white, size: height * 0.035),
    ),
    PersistentBottomNavBarItem(
        icon: Container(
          margin: EdgeInsets.only(top: height * 0.009, bottom: height * 0.009),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  color: Colors.white, width: 2, style: BorderStyle.solid)),
          child: Padding(
            padding: EdgeInsets.all(height * 0.002),
            child: Icon(
              Icons.add,
              size: height * 0.022,
              color: Colors.white,
            ),
          ),
        ),
        inactiveIcon: Container(
          margin: EdgeInsets.only(top: height * 0.009, bottom: height * 0.009),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  color: Colors.white, width: 2, style: BorderStyle.solid)),
          child: Padding(
            padding: EdgeInsets.all(height * 0.002),
            child: Icon(
              Icons.add,
              size: height * 0.022,
              color: Colors.white,
            ),
          ),
        )),
    PersistentBottomNavBarItem(
      icon: Container(
          height: height * 0.019,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white)),
          child: CachedNetworkImage(
            imageUrl:
                "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
            imageBuilder: (context, imageProvider) => Center(
              child: Container(
                height: height * 0.045,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.colorBurn,
                    ),
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
      inactiveIcon: CachedNetworkImage(
        imageUrl:
            "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
        imageBuilder: (context, imageProvider) => Center(
          child: Container(
            height: height * 0.045,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.colorBurn,
                ),
              ),
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  ];
}

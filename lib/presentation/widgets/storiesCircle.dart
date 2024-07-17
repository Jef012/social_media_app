import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoriesCircle extends StatefulWidget {
  final bool isUserStoryCircle;
  const StoriesCircle({super.key, required this.isUserStoryCircle});

  @override
  State<StoriesCircle> createState() => _StoriesCircleState();
}

class _StoriesCircleState extends State<StoriesCircle> {
  List<Color> circleGradient = [
    Color(0xFFC913B9),
    Color(0xFFF9373F),
    Color(0xFFFECD00),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  decoration: const BoxDecoration(
                      color: Colors.white38, shape: BoxShape.circle),
                  width: width * 0.17,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  width: width * 0.199,
                  height: height * 0.199,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: !widget.isUserStoryCircle
                      ? ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [
                                Color(0xFFFECD00),
                                Color(0xFFC913B9),
                                Color(0xFFF9373F),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
                widget.isUserStoryCircle
                    ? Positioned(
                        child: Container(
                          child: Center(
                              child: Icon(
                            Icons.add,
                            size: height * 0.025,
                          )),
                          decoration: const BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                        ),
                        bottom: height * 0.01,
                        right: height * 0.011,
                      )
                    : Container(),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.18,
            child: Text(
              !widget.isUserStoryCircle ? "_jefrinjohnson04" : "Your story",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: height * 0.015),
            ),
          ),
          SizedBox(height: height * 0.01)
        ]);
  }
}

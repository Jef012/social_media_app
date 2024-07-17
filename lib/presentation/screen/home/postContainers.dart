// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class PostContainer extends StatefulWidget {
//   final double height;
//   final double width;
//   const PostContainer({super.key, required this.height, required this.width});
//
//   @override
//   State<PostContainer> createState() => _PostContainerState();
// }
//
// class _PostContainerState extends State<PostContainer> {
//   @override
//   Widget build(BuildContext context) {
//     int _current = 0;
//     final CarouselController _controller = CarouselController();
//     return Column(
//       children: [
//         SizedBox(height: widget.height * 0.01),
//         Container(
//           decoration: BoxDecoration(color: Colors.black),
//           width: widget.width,
//           height: widget.height * 0.065,
//           child: Row(children: [
//             SizedBox(width: widget.width * 0.03),
//             SizedBox(
//               width: widget.width * 0.082,
//               child: CachedNetworkImage(
//                 imageUrl:
//                     "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
//                 imageBuilder: (context, imageProvider) => Center(
//                   child: Container(
//                     height: widget.height * 0.045,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // placeholder: (context, url) => const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             SizedBox(width: widget.width * 0.03),
//             Text(
//               "Harry045",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: widget.height * 0.015),
//             ),
//             Spacer(),
//             IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.more_vert_sharp,
//                   color: Colors.white,
//                 ))
//           ]),
//         ),
//         CarouselSlider(
//           items: [
//             Container(
//               color: Colors.blueGrey,
//               height: 150,
//             ),
//             Container(
//               color: Colors.redAccent,
//               height: 150,
//             ),
//             Container(
//               color: Colors.cyan,
//               height: 150,
//             ),
//           ],
//           carouselController: _controller,
//           options: CarouselOptions(
//               autoPlay: false,
//               initialPage: 0,
//               aspectRatio: 1.0,
//               viewportFraction: widget.width,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               }),
//         ),
//         SizedBox(
//           width: widget.width,
//           height: widget.height * 0.065,
//           child: Row(
//             children: [
//               SizedBox(width: widget.width * 0.03),
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.favorite_border,
//                     color: Colors.white,
//                   )),
//               Image.asset(
//                 "assets/image/commentIcon.png",
//                 color: Colors.white,
//                 height: widget.height * 0.027,
//               ),
//               SizedBox(width: widget.width * 0.03),
//               Image.asset(
//                 "assets/image/shareIcon.png",
//                 color: Colors.white,
//                 height: widget.height * 0.03,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: imgList.asMap().entries.map((entry) {
//                   return GestureDetector(
//                     onTap: () => _controller.animateToPage(entry.key),
//                     child: Container(
//                       width: 12.0,
//                       height: 12.0,
//                       margin:
//                           EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: (Theme.of(context).brightness ==
//                                       Brightness.dark
//                                   ? Colors.white
//                                   : Colors.black)
//                               .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: widget.height * 0.01),
//       ],
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatefulWidget {
  final double height;
  final double width;
  const PostContainer({super.key, required this.height, required this.width});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/192320/pexels-photo-192320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1598073/pexels-photo-1598073.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/192320/pexels-photo-192320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: widget.height * 0.01),
        Container(
          decoration: BoxDecoration(color: Colors.black),
          width: widget.width,
          height: widget.height * 0.065,
          child: Row(children: [
            SizedBox(width: widget.width * 0.03),
            SizedBox(
              width: widget.width * 0.082,
              child: CachedNetworkImage(
                imageUrl:
                    "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
                imageBuilder: (context, imageProvider) => Center(
                  child: Container(
                    height: widget.height * 0.045,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: widget.width * 0.03),
            Text(
              "Harry045",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.height * 0.015),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_sharp,
                  color: Colors.white,
                ))
          ]),
        ),
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                height: height * 0.45,
                viewportFraction: 0.99,
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return ProductContainer(
                  projectImage: imgList[index],
                  height: height,
                  width: width,
                );
              },
            ),
            Positioned(
              top: height * 0.01,
              right: width * 0.01,
              child: Container(
                height: height * 0.03,
                width: width * 0.085,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  "${_current + 1}/${imgList.length}",
                  style:
                      TextStyle(fontSize: height * 0.015, color: Colors.white),
                )),
              ),
            ),
          ],
        ),
        SizedBox(
          width: widget.width,
          height: widget.height * 0.065,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: widget.width * 0.015),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  Image.asset(
                    "assets/image/commentIcon.png",
                    color: Colors.white,
                    height: widget.height * 0.027,
                  ),
                  SizedBox(width: widget.width * 0.03),
                  Image.asset(
                    "assets/image/shareIcon.png",
                    color: Colors.white,
                    height: widget.height * 0.03,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.where((entry) {
                  int currentIndex = _current;

                  if (imgList.length <= 4) {
                    return true; // Show all dots if there are 4 or fewer
                  } else if (currentIndex <= 2) {
                    // Show the first four dots when current index is 0, 1, or 2
                    return entry.key < 4;
                  } else if (currentIndex >= imgList.length - 3) {
                    // Show the last four dots when current index is near the end
                    return entry.key >= imgList.length - 4;
                  } else {
                    // Show the current dot, one before, and two after for other indices
                    return entry.key >= currentIndex - 1 &&
                        entry.key <= currentIndex + 2;
                  }
                }).map((entry) {
                  double opacity;

                  int currentIndex = _current;

                  if (imgList.length <= 4) {
                    // All dots are visible, set default opacity
                    opacity = 0.4;
                  } else {
                    // Calculate the relative position of the dot to the current dot for opacity
                    if (currentIndex <= 2) {
                      // If current index is 0, 1, or 2, handle the opacity for the first four dots
                      opacity = _calculateOpacity(entry.key);
                    } else if (currentIndex >= imgList.length - 3) {
                      // If current index is near the end, handle the opacity for the last four dots
                      opacity =
                          _calculateOpacity(entry.key - (imgList.length - 4));
                    } else {
                      // Otherwise, handle the opacity for the current, one before, and two after
                      opacity =
                          _calculateOpacity(entry.key - (currentIndex - 1));
                    }
                  }

                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.019,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal:
                              MediaQuery.of(context).size.width * 0.005),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white38)
                            .withOpacity(_current == entry.key ? 0.9 : opacity),
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: imgList.asMap().entries.map((entry) {
              //     return GestureDetector(
              //       onTap: () => _controller.animateToPage(entry.key),
              //       child: Container(
              //         width: MediaQuery.of(context).size.width * 0.019,
              //         height: 12.0,
              //         margin: EdgeInsets.symmetric(
              //             vertical: 8.0,
              //             horizontal:
              //                 MediaQuery.of(context).size.width * 0.005),
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: (Theme.of(context).brightness ==
              //                         Brightness.dark
              //                     ? Colors.white
              //                     : Colors.white38)
              //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              //       ),
              //     );
              //   }).toList(),
              // ),
              SizedBox(width: widget.width * 0.005),
              Padding(
                padding: EdgeInsets.only(right: widget.width * 0.03),
                child: Image.asset(
                  "assets/image/saveIcon.png",
                  color: Colors.white,
                  height: widget.height * 0.027,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: widget.height * 0.01),
      ],
    );
  }

  double _calculateOpacity(int relativeIndex) {
    switch (relativeIndex) {
      case 0:
        return 0.5;
      case 1:
        return 0.4;
      case 2:
        return 0.3;
      case 3:
        return 0.2;
      default:
        return 0.4;
    }
  }
}

class ProductContainer extends StatelessWidget {
  final String projectImage;
  final double height;
  final double width;

  const ProductContainer(
      {super.key,
      required this.projectImage,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12.withOpacity(0.1), width: 2),
        image: DecorationImage(
          image: NetworkImage(projectImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

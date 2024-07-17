import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controller/repository/postRepository.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  final PostRepository _postService = PostRepository();
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Feed',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: TextFormField(
                controller: _postController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyle(
                      color: Colors.white), // Set hint text color to white
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: HexColor("#363636"), width: 2),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: HexColor("#363636"), width: 2),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _postService.addPost(_postController.text.trim());
              _postController.clear();
            },
            child: Text('Post'),
          ),
        ],
      ),
    );
  }
}

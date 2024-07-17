import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../controller/repository/postRepository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PostRepository _postService = PostRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _auth.currentUser!.email.toString(),
              style: TextStyle(fontSize: height * 0.0275),
            ),
            SizedBox(width: width * 0.01),
          ],
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _postService.getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Filter posts by the current user's ID
          final posts = snapshot.data!.docs
              .where((post) => post['userId'] == _auth.currentUser!.uid)
              .toList();

          // Check if there are no posts after filtering
          if (posts.isEmpty) {
            return Center(
              child: Text(
                "Add your first post!!",
                style: TextStyle(color: Colors.white, fontSize: height * 0.02),
              ),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              int likes = 0;
              if (post.data() != null) {
                dynamic postData = post.data();
                if (postData is Map<String, dynamic>) {
                  likes = postData.containsKey('likes') ? postData['likes'] : 0;
                }
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: Colors.white54,
                    ),
                  ),
                  title: Text(
                    post['content'],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['timestamp'].toDate().toString(),
                        style: TextStyle(color: Colors.white54),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up, color: Colors.white54),
                            onPressed: () async {},
                          ),
                          Text(
                            '$likes',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                      Text(
                        "Comments",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: _postService.getComments(post.id),
                        builder: (context, commentSnapshot) {
                          if (!commentSnapshot.hasData ||
                              commentSnapshot.data!.docs.isEmpty) {
                            return Container(
                              child: Text(
                                "No comments",
                                style: TextStyle(color: Colors.white70),
                              ),
                            );
                          }
                          final comments = commentSnapshot.data!.docs;
                          return Column(
                            children: comments.map((comment) {
                              return ListTile(
                                contentPadding: EdgeInsets.all(5),
                                title: Text(
                                  comment['content'],
                                  style: TextStyle(color: Colors.white70),
                                ),
                                subtitle: Text(
                                  comment['timestamp'].toDate().toString(),
                                  style: TextStyle(color: Colors.white54),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget CustomButton({title, onPressed, height, width}) {
    return Expanded(
      child: SizedBox(
        height: height * 0.055,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(
                Colors.white24.withOpacity(0.15),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

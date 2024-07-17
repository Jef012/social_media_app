import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../controller/repository/postRepository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PostRepository _postService = PostRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("Social Media App"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _postService.getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final posts = snapshot.data!.docs.toList();

          if (posts.isEmpty) {
            return Center(
              child: Text(
                "No post data",
                style: TextStyle(color: Colors.white),
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
                            onPressed: () async {
                              await _postService.likePost(post.id);
                            },
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

  void _showCommentDialog(String postId) {
    final TextEditingController _commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Comment"),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(labelText: 'Comment'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await _postService.addComment(
                    postId, _commentController.text.trim());
                Navigator.of(context).pop();
              },
              child: Text("Post"),
            ),
          ],
        );
      },
    );
  }
}

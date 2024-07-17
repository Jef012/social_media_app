import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addPost(String content) async {
    try {
      await _firestore.collection('posts').add({
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': _auth.currentUser!.uid,
        'likes': 0,
        'likedBy': [],
      });
    } catch (e) {
      print("e.toString() ::: ${e.toString()}");
    }
  }

  Stream<QuerySnapshot> getPosts() {
    return _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> likePost(String postId) async {
    final String userId = _auth.currentUser!.uid;
    final DocumentReference postRef =
        _firestore.collection('posts').doc(postId);
    final DocumentSnapshot postSnapshot = await postRef.get();

    if (postSnapshot.exists) {
      List<dynamic> likedBy = [];
      if (postSnapshot.data() != null) {
        dynamic postData = postSnapshot.data();
        if (postData is Map<String, dynamic>) {
          likedBy = postData.containsKey('likedBy') ? postData['likedBy'] : [];
        }
      }

      if (!likedBy.contains(userId)) {
        await postRef.update({
          'likes': FieldValue.increment(1),
          'likedBy': FieldValue.arrayUnion([userId]),
        });
      } else {
        print("User has already liked this post");
      }
    }
  }

  Future<void> addComment(String postId, String content) async {
    await _firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .add({
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getComments(String postId) {
    return _firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}

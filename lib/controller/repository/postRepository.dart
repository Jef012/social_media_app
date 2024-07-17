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
    final DocumentReference postRef =
        _firestore.collection('posts').doc(postId);
    await postRef.update({
      'likes': FieldValue.increment(1),
    });
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

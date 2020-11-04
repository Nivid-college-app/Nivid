import 'dart:io';

import 'package:Nivid/models/news_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/global/variables.dart';
import 'package:Nivid/providers/app_user.dart';
import 'package:Nivid/global/default_dialog_box.dart';
import 'package:Nivid/screens/bottom_tabs_screen.dart';

class Database {
  static Future<void> getUserData() async {
    final _doc = await FirebaseFirestore.instance
        .collection('appUsers')
        .doc(firebaseuser.uid)
        .get();
    userData = AppUser.fromMap(_doc.data());
  }

  static Future<void> updateUserData(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('appUsers')
        .doc(firebaseuser.uid)
        .update(data);
    getUserData();
  }

  static Future<String> getCollegePicture(String id) async {
    final doc =
        await FirebaseFirestore.instance.collection('appUsers').doc(id).get();
    return doc.data()['pil'];
  }

  static Future<void> uploadPost(BuildContext context, HomePost post) async {
    try {
      DefaultDialogBox.loadingDialog(context, title: 'Please wait...');
      final _instance = FirebaseFirestore.instance.collection('posts').doc();
      if (!post.isVideo && !post.isText) {
        List<String> _links = [];
        for (int i = 0; i < post.imagelinks.length; i++) {
          final _ref = await FirebaseStorage.instance
              .ref()
              .child('posts/${_instance.id}/image${i + 1}.png')
              .putFile(File(post.imagelinks[i]))
              .onComplete;
          _links.add(await _ref.ref.getDownloadURL());
        }
        post.imagelinks = _links;
      } else if (post.isVideo) {
        final _ref = await FirebaseStorage.instance
            .ref()
            .child('posts/${_instance.id}/video.mp4')
            .putFile(File(post.videoLink))
            .onComplete;
        post.videoLink = await _ref.ref.getDownloadURL();
      }
      final Map<String, dynamic> data = post.toJson();
      await _instance.set(data
        ..['tp'] = FieldValue.serverTimestamp()
        ..['id'] = _instance.id);
      Navigator.of(context).pushNamedAndRemoveUntil(
          BottomTabsScreen.routeName, (route) => false);
    } on FirebaseException catch (err) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: err.message);
    } on PlatformException catch (err) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: err.message);
    } catch (_) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'something went wrong!\nPlease try again.');
    }
  }

  static Future<void> likePost(HomePost post) async {
    try {
      if (post.userIdsLiked.contains(firebaseuser.uid))
        post.userIdsLiked.removeWhere((element) => element == firebaseuser.uid);
      else {
        post.userIdsLiked.add(firebaseuser.uid);
        if (post.userIdsDisliked.contains(firebaseuser.uid))
          post.userIdsDisliked
              .removeWhere((element) => element == firebaseuser.uid);
      }
      await FirebaseFirestore.instance.collection('posts').doc(post.id).update(
          {'uidLks': post.userIdsLiked, 'uidDlks': post.userIdsDisliked});
    } on FirebaseException catch (err) {
      Fluttertoast.showToast(msg: err.message);
    } on PlatformException catch (err) {
      Fluttertoast.showToast(msg: err.message);
    } catch (_) {
      Fluttertoast.showToast(msg: 'something went wrong!\nPlease try again.');
    }
  }

  static Future<void> disLikePost(HomePost post) async {
    try {
      if (post.userIdsDisliked.contains(firebaseuser.uid))
        post.userIdsDisliked
            .removeWhere((element) => element == firebaseuser.uid);
      else {
        post.userIdsDisliked.add(firebaseuser.uid);
        if (post.userIdsLiked.contains(firebaseuser.uid))
          post.userIdsLiked
              .removeWhere((element) => element == firebaseuser.uid);
      }
      await FirebaseFirestore.instance.collection('posts').doc(post.id).update(
          {'uidLks': post.userIdsLiked, 'uidDlks': post.userIdsDisliked});
    } on FirebaseException catch (err) {
      Fluttertoast.showToast(msg: err.message);
    } on PlatformException catch (err) {
      Fluttertoast.showToast(msg: err.message);
    } catch (_) {
      Fluttertoast.showToast(msg: 'something went wrong!\nPlease try again.');
    }
  }

  static Future<void> uploadNews(BuildContext context, NewsFeed feed) async {
    try {
      DefaultDialogBox.loadingDialog(context, title: 'Please wait...');
      final _path = feed.isVideo ? 'video.mp4' : 'image.png';
      final _instance =
          FirebaseFirestore.instance.collection('newsfeeds').doc();
      final _ref = await FirebaseStorage.instance
          .ref()
          .child('newsfeeds/${_instance.id}/$_path')
          .putFile(File(feed.downloadLink))
          .onComplete;
      feed.downloadLink = await _ref.ref.getDownloadURL();
      final Map<String, dynamic> data = feed.toJson();
      await _instance.set(data
        ..['tp'] = FieldValue.serverTimestamp()
        ..['id'] = _instance.id);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomTabsScreen(index: 1)),
          (route) => false);
    } on FirebaseException catch (err) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: err.message);
    } on PlatformException catch (err) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: err.message);
    } catch (_) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'something went wrong!\nPlease try again.');
    }
  }
}

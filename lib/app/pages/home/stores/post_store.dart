import 'package:flutter/material.dart';
import 'package:flutter_valuenotifier/app/data/models/post_model.dart';
import 'package:flutter_valuenotifier/app/data/services/post_service.dart';
import 'package:flutter_valuenotifier/app/pages/home/states/post_state.dart';

class PostStore extends ValueNotifier<PostState> {
  final PostService service;

  PostStore(this.service) : super(PostInitial());

  Future getPosts() async {
    value = PostLoading();
    try {
      final posts = await service.getPosts();
      value = PostLoaded(posts);
    } catch (e) {
      value = PostError(e.toString());
    }
  }
}

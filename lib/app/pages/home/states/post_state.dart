import 'package:flutter_valuenotifier/app/data/models/post_model.dart';

abstract class PostState {}

class PostInitial implements PostState {}

class PostLoading implements PostState {}

class PostLoaded implements PostState {
  final List<PostModel> posts;

  PostLoaded(this.posts);
}

class PostError implements PostState {
  final String message;

  PostError(this.message);
}

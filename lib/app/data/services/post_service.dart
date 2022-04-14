import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostService {
  final Dio dio;

  PostService({required this.dio});

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );
    final list = response.data as List;
    final posts = list.map((e) => PostModel.fromJson(json: e)).toList();
    return posts;
  }
}

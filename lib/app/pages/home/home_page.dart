import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valuenotifier/app/data/services/post_service.dart';
import 'package:flutter_valuenotifier/app/pages/home/states/post_state.dart';
import 'package:flutter_valuenotifier/app/pages/home/stores/post_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final store = PostStore(PostService(dio: Dio()));

  @override
  void initState() {
    store.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, __) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(state.posts[index].title),
              ),
            );
          } else if (state is PostError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

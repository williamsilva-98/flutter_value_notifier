class PostModel {
  final String title;
  final String body;

  PostModel({required this.title, required this.body});

  factory PostModel.fromJson({required Map<String, dynamic> json}) {
    return PostModel(
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() => 'PostModel(title: $title, body: $body)';
}

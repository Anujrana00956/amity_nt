import 'dart:convert';

PostsResponse postsResponseFromJson(String str) =>
    PostsResponse.fromJson(json.decode(str));

class PostsResponse {
  PostsResponse({
    required this.status,
    required this.message,
    required this.posts,
  });
  final bool status;
  final String message;
  final List<Posts> posts;

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
        status: json['status'],
        message: json['message'],
        posts: List<Posts>.from(
            json['data']['posts'].map((x) => Posts.fromJson(x))),
      );
}

class Posts {
  Posts({
    required this.id,
    required this.title,
    required this.description,
  });
  final int id;
  final String title;
  final String description;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );
}

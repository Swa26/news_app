import 'dart:convert';
import 'package:equatable/equatable.dart';

class MyModelForAPI extends Equatable {
  final String? id;
  final String? sourceName;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const MyModelForAPI({
    this.id,
    this.sourceName,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props => [
    id,
    sourceName,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];

  // Convert MyModelForAPI object to a Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.toIso8601String(),
      'content': content,
    };
  }

  //MyModelForAPI object from a Map
  factory MyModelForAPI.fromMap(Map<String, dynamic> map) {
    return MyModelForAPI(
      id: map['id'] as String?,
      sourceName: map['sourceName'] as String?,
      author: map['author'] as String?,
      title: map['title'] as String,
      description: map['description'] as String?,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] != null
          ? DateTime.parse(map['publishedAt'] as String)
          : null,
      content: map['content'] as String?,
    );
  }

  // Convert MyModelForAPI object to a JSON string
  String toJson() => json.encode(toMap());

  // Create a MyModelForAPI object from a JSON string
  factory MyModelForAPI.fromJson(String source) =>
      MyModelForAPI.fromMap(json.decode(source) as Map<String, dynamic>);
}

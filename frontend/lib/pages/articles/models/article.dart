// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
    final String? id;
    final String? author;
    final String? title;
    final String? description;
    final String? url;
    final String? urlToImage;
    final DateTime? publishedAt;

    Article({
        this.id,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
    });

    Article copyWith({
        String? id,
        String? author,
        String? title,
        String? description,
        String? url,
        String? urlToImage,
        DateTime? publishedAt,
    }) => 
        Article(
            id: id ?? this.id,
            author: author ?? this.author,
            title: title ?? this.title,
            description: description ?? this.description,
            url: url ?? this.url,
            urlToImage: urlToImage ?? this.urlToImage,
            publishedAt: publishedAt ?? this.publishedAt,
        );

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
    };
}

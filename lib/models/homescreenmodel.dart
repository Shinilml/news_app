// // To parse this JSON data, do
// //
// //     final homescreenmodel = homescreenmodelFromJson(jsonString);

// import 'dart:convert';

// Homescreenmodel homescreenmodelFromJson(String str) =>
//     Homescreenmodel.fromJson(json.decode(str));

// String homescreenmodelToJson(Homescreenmodel data) =>
//     json.encode(data.toJson());

// class Homescreenmodel {
//   String? status;
//   int? totalResults;
//   List<Article>? articles;

//   Homescreenmodel({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });

//   factory Homescreenmodel.fromJson(Map<String, dynamic> json) =>
//       Homescreenmodel(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: json["articles"] == null
//             ? []
//             : List<Article>.from(
//                 json["articles"]!.map((x) => Article.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": articles == null
//             ? []
//             : List<dynamic>.from(articles!.map((x) => x.toJson())),
//       };
// }

// class Article {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   DateTime? publishedAt;
//   String? content;

//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: json["source"] == null ? null : Source.fromJson(json["source"]),
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: json["publishedAt"] == null
//             ? null
//             : DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );

//   Map<String, dynamic> toJson() => {
//         "source": source?.toJson(),
//         "author": author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt?.toIso8601String(),
//         "content": content,
//       };
// }

// class Source {
//   dynamic id;
//   String? name;

//   Source({
//     this.id,
//     this.name,
//   });

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }
// To parse this JSON data, do
//
//     final newsScreenModel = newsScreenModelFromJson(jsonString);

import 'dart:convert';

NewsScreenModel newsScreenModelFromJson(String str) =>
    NewsScreenModel.fromJson(json.decode(str));

class NewsScreenModel {
  String? status;
  int? totalResults;
  List<News>? articles;

  NewsScreenModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsScreenModel.fromJson(Map<String, dynamic> json) =>
      NewsScreenModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<News>.from(json["articles"]!.map((x) => News.fromJson(x))),
      );
}

class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}

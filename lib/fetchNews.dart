import 'package:flutter/cupertino.dart';

class Note2 {
  String id;
  String name;
  String titlen;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  Note2(this.id, this.name, this.titlen, this.description, this.url, this.urlToImage, this.publishedAt);

  Note2.fromJson(Map<String, dynamic> json) {
    id = json['source']['id'];
    name = json['source']['name'];
    titlen = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}
import 'dart:convert';

BookmarkReqModel bookmarkReqModelFromJson(String str) =>
    BookmarkReqModel.fromJson(json.decode(str));

String bookmarkReqModelToJson(BookmarkReqModel data) =>
    json.encode(data.toJson());

class BookmarkReqModel {
  BookmarkReqModel({required this.job});

  final String job;

  factory BookmarkReqModel.fromJson(Map<String, dynamic> json) =>
      BookmarkReqModel(job: json["job"]);

  Map<String, dynamic> toJson() => {"job": job};
}

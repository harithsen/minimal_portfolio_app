import 'dart:convert';

Shots ShotsFromJson(String str) => Shots.fromJson(json.decode(str));

String ShotsToJson(Shots data) => json.encode(data.toJson());

class Shots {
  Shots({
    required this.animated,
    required this.description,
    required this.height,
    required this.htmlUrl,
    required this.id,
    required this.images,
    required this.lowProfile,
    required this.tags,
    required this.title,
    required this.width,
    required this.publishedAt,
    required this.updatedAt,
    required this.attachments,
    required this.projects,
    required this.video,
  });

  bool animated;
  String description;
  int height;
  String htmlUrl;
  int id;
  Images images;
  bool lowProfile;
  List<String> tags;
  String title;
  int width;
  DateTime publishedAt;
  DateTime updatedAt;
  List<dynamic> attachments;
  List<dynamic> projects;
  dynamic video;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        animated: json["animated"],
        description: json["description"],
        height: json["height"],
        htmlUrl: json["html_url"],
        id: json["id"],
        images: Images.fromJson(json["images"]),
        lowProfile: json["low_profile"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        title: json["title"],
        width: json["width"],
        publishedAt: DateTime.parse(json["published_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        projects: List<dynamic>.from(json["projects"].map((x) => x)),
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "animated": animated,
        "description": description,
        "height": height,
        "html_url": htmlUrl,
        "id": id,
        "images": images.toJson(),
        "low_profile": lowProfile,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "title": title,
        "width": width,
        "published_at": publishedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "projects": List<dynamic>.from(projects.map((x) => x)),
        "video": video,
      };
}

class Images {
  Images({
    required this.hidpi,
    required this.normal,
    required this.oneX,
    required this.twoX,
    required this.fourX,
    required this.teaser,
  });

  String hidpi;
  String normal;
  String oneX;
  String twoX;
  String fourX;
  String teaser;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        hidpi: json["hidpi"],
        normal: json["normal"],
        oneX: json["one_x"],
        twoX: json["two_x"],
        fourX: json["four_x"],
        teaser: json["teaser"],
      );

  Map<String, dynamic> toJson() => {
        "hidpi": hidpi,
        "normal": normal,
        "one_x": oneX,
        "two_x": twoX,
        "four_x": fourX,
        "teaser": teaser,
      };
}

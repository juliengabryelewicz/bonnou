class RssModel {
  int? id;
  String? title;
  String? link;

  RssModel({
    this.id,
    this.title,
    this.link,
  });

  RssModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    return data;
  }
}
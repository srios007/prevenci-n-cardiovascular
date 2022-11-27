class HealthInfo {
  HealthInfo({
    this.id,
    this.created,
    this.title,
    this.label,
    this.imageUrl,
  });

  HealthInfo.fromJson(Map<String, dynamic> json, {bool isGet = false}) {
    id = json['id'];
    if (isGet) {
      created = json['created'].toDate();
    } else {
      created = json['created'];
    }
    title = json['title'];
    label = json['label'];
    imageUrl = json['imageUrl'];
  }

  String? id;
  DateTime? created;
  String? title;
  String? label;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['title'] = title;
    data['label'] = label;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

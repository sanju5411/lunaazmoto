class ShopDocuments {
  int? id;
  String? userId;
  String? name;
  String? file;
  String? createdAt;
  String? updatedAt;

  ShopDocuments(
      {this.id,
        this.userId,
        this.name,
        this.file,
        this.createdAt,
        this.updatedAt});

  ShopDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['file'] = file;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
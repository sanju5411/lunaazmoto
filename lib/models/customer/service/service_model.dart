class ServiceModel {
  ServiceModel({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

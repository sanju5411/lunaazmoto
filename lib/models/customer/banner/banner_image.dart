class BannerImage {
  BannerImage({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class BannerImage {
  BannerImage({
    required this.image,
  });

  String image;

  factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

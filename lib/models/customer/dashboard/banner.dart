class DashboardBanner {
  DashboardBanner({
    this.image,
  });

  String? image;

  factory DashboardBanner.fromJson(Map<String, dynamic> json) => DashboardBanner(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}
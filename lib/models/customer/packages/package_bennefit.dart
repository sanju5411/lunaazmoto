class PackageBenefit {
  PackageBenefit({
    this.name,
    this.limit,
  });

  String? name;
  int? limit;

  factory PackageBenefit.fromJson(Map<String, dynamic> json) => PackageBenefit(
    name: json["name"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "limit": limit,
  };
}
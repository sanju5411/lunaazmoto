class ActiveAvailableBenefit {
  ActiveAvailableBenefit({
    this.name,
    this.time,
  });

  String? name;
  int? time;

  factory ActiveAvailableBenefit.fromJson(Map<String, dynamic> json) => ActiveAvailableBenefit(
    name: json["name"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "time": time,
  };
}
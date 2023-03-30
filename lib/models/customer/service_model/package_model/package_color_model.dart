
class PackageColor {
  PackageColor({
    this.one,
    this.two,
    this.three,
  });

  String? one;
  String? two;
  String? three;

  factory PackageColor.fromJson(Map<String, dynamic> json) => PackageColor(
    one: json["one"],
    two: json["two"],
    three: json["three"],
  );

  Map<String, dynamic> toJson() => {
    "one": one,
    "two": two,
    "three": three,
  };
}
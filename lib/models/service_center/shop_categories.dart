class ShopCategories {
  int? categoryId;
  String? categoryName;
  String? categoryDetail;
  String? categoryStatus;

  ShopCategories(
      {this.categoryId,
        this.categoryName,
        this.categoryDetail,
        this.categoryStatus});

  ShopCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDetail = json['category_detail'];
    categoryStatus = json['category_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_detail'] = categoryDetail;
    data['category_status'] = categoryStatus;
    return data;
  }
}
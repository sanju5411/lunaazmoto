class BookingModel {
  String? status;
  int? statusCode;
  String? message;

  BookingModel({this.status, this.statusCode, this.message});

  BookingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    return data;
  }
}
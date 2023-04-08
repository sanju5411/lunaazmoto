class Notifications {
  int? notificationId;
  String? notificationTitle;
  String? notficationDescription;
  Null? notificationReadBy;
  String? notificationStatus;
  String? notificationCreatedAt;

  Notifications(
      {this.notificationId,
        this.notificationTitle,
        this.notficationDescription,
        this.notificationReadBy,
        this.notificationStatus,
        this.notificationCreatedAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notficationDescription = json['notfication_description'];
    notificationReadBy = json['notification_read_by'];
    notificationStatus = json['notification_status'];
    notificationCreatedAt = json['notification_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notfication_description'] = this.notficationDescription;
    data['notification_read_by'] = this.notificationReadBy;
    data['notification_status'] = this.notificationStatus;
    data['notification_created_at'] = this.notificationCreatedAt;
    return data;
  }
}
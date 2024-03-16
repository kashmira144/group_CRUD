class GroupTypeDataResponse {
  String? code;
  String? message;

  GroupTypeDataResponse({this.code, this.message});

  GroupTypeDataResponse.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}

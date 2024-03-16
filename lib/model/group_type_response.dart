class GroupTypeListingResponse {
  Data? data;
  String? code;
  String? message;

  GroupTypeListingResponse({this.data, this.code, this.message});

  GroupTypeListingResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  List<Rows>? rows;
  int? sync;
  int? totalRows;
  int? page;
  Null? data;

  Data({this.rows, this.sync, this.totalRows, this.page, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Rows'] != null) {
      rows = <Rows>[];
      json['Rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
    sync = json['Sync'];
    totalRows = json['TotalRows'];
    page = json['Page'];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['Rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    data['Sync'] = this.sync;
    data['TotalRows'] = this.totalRows;
    data['Page'] = this.page;
    data['Data'] = this.data;
    return data;
  }
}

class Rows {
  int? id;
  String? name;
  String? description;
  bool? showDivisionReport;
  bool? isActive;

  Rows(
      {this.id,
        this.name,
        this.description,
        this.showDivisionReport,
        this.isActive});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    showDivisionReport = json['ShowDivisionReport'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['ShowDivisionReport'] = this.showDivisionReport;
    data['IsActive'] = this.isActive;
    return data;
  }
}

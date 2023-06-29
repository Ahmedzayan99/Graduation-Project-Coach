class AddPlan {
  bool? success;
  Data? data;

  AddPlan({this.success, this.data});

  AddPlan.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? day;
  List<String>? exercises;
  List<String>? muscles;

  Data({this.id, this.userId, this.day, this.exercises, this.muscles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    day = json['day'];
    exercises = json['exercises'].cast<String>();
    muscles = json['muscles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['day'] = this.day;
    data['exercises'] = this.exercises;
    data['muscles'] = this.muscles;
    return data;
  }
}
// ignore_for_file: prefer_collection_literals

class AddPlanModel {
  bool? success;
  Data? data;

  AddPlanModel({this.success, this.data});

  AddPlanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
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
  List<Exercises>? exercises;
  List<Muscles>? muscles;

  Data({this.id, this.userId, this.day, this.exercises, this.muscles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    day = json['day'];
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercises.fromJson(v));
      });
    }
    if (json['muscles'] != null) {
      muscles = <Muscles>[];
      json['muscles'].forEach((v) {
        muscles!.add(Muscles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['day'] = day;
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    if (muscles != null) {
      data['muscles'] = muscles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  int? id;
  String? name;
  String? description;
  String? image;
  int? groups;
  int? groupCount;
  int? muscleId;
  String? createdAt;
  String? updatedAt;

  Exercises(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.groups,
        this.groupCount,
        this.muscleId,
        this.createdAt,
        this.updatedAt});

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    groups = json['groups'];
    groupCount = json['group_count'];
    muscleId = json['muscle_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['groups'] = groups;
    data['group_count'] = groupCount;
    data['muscle_id'] = muscleId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Muscles {
  int? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Muscles(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  Muscles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
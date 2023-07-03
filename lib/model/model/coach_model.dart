// ignore_for_file: prefer_collection_literals

class CoachModel {
  bool? status;
  Coach? coach;

  CoachModel({this.status, this.coach});

  CoachModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    coach = json['coach'] != null ? Coach.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (coach != null) {
      data['coach'] = coach!.toJson();
    }
    return data;
  }
}

class Coach {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? image;
  int? salary;
  String? joinedAt;
  Rate? rate;
  Coach(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.image,
        this.salary,
        this.joinedAt,
      this.rate});

  Coach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    salary = json['salary'];
    joinedAt = json['joined_at'];
    rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['image'] = image;
    data['salary'] = salary;
    data['joined_at'] = joinedAt;
    if (rate != null) {
      data['rate'] = rate!.toJson();
    }
    return data;
  }
}
class Rate {
  int? id;
  int? userId;
  int? coashId;
  String? stars;
  String? updatedAt;
  String? createdAt;
  Rate(
      {this.id,
        this.userId,
        this.coashId,
        this.stars,
        this.createdAt,
        this.updatedAt,
        });

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    coashId = json['Coash_id'];
    stars = json['stars'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['Coash_id'] = coashId;
    data['stars'] = stars;
    data['updated_at'] = createdAt;
    data['created_at'] = updatedAt;
    return data;
  }
}
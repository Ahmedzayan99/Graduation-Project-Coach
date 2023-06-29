class CoachModel {
  bool? status;
  Coach? coach;

  CoachModel({this.status, this.coach});

  CoachModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
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

  Coach(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.image,
        this.salary,
        this.joinedAt});

  Coach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    salary = json['salary'];
    joinedAt = json['joined_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['image'] = this.image;
    data['salary'] = this.salary;
    data['joined_at'] = this.joinedAt;
    return data;
  }
}
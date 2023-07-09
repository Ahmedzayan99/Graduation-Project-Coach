class LoginModel {
  bool? success;
  String? message;
  Coash? coash;

  LoginModel({this.success, this.message, this.coash});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    coash = json['coash'] != null ? new Coash.fromJson(json['coash']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.coash != null) {
      data['coash'] = this.coash!.toJson();
    }
    return data;
  }
}

class Coash {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? image;
  int? salary;
  String? joinedAt;
  String? apiToken;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Coash(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.image,
        this.salary,
        this.joinedAt,
        this.apiToken,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Coash.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    salary = json['salary'];
    joinedAt = json['joined_at'];
    apiToken = json['api_token'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['api_token'] = this.apiToken;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
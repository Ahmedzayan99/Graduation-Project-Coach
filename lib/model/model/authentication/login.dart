class LoginModel {
  bool? success;
  String? message;
  Data? data;

  LoginModel({this.success, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? height;
  int? weight;
  int? age;
  int? fatPercentage;
  String? accountStatus;
  int? planId;
  String? emailVerifiedAt;
  String? apiToken;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.height,
        this.weight,
        this.age,
        this.fatPercentage,
        this.accountStatus,
        this.planId,
        this.emailVerifiedAt,
        this.apiToken,
        this.createdAt,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    fatPercentage = json['fat_percentage'];
    accountStatus = json['account_status'];
    planId = json['plan_id'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    createdAt= json['created_at'];
  }

}

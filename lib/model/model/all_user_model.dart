// ignore_for_file: prefer_collection_literals

class AllUserModel {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? imageUrl;
  int? height;
  int? weight;
  int? age;
  int? fatPercentage;
  String? coashName;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? membership;
  List<Rate>? rate;

  AllUserModel({this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.imageUrl,
    this.height,
    this.weight,
    this.age,
    this.fatPercentage,
    this.coashName,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.membership,
    this.rate});

  AllUserModel.fromJson(Map<String, dynamic> json,) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    imageUrl = json['image_url'];
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    fatPercentage = json['fat_percentage'];
    coashName = json['coash_name'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    membership = json['membership'];
    if (json['rate'] != null) {
      rate = <Rate>[];
      json['rate'].forEach((v) {
        rate!.add(Rate.fromJson(v));
      });
    }
  }
  Map<String,dynamic> toMap(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['image_url'] = imageUrl;
    data['height'] = height;
    data['weight'] = weight;
    data['age'] = age;
    data['fat_percentage'] = fatPercentage;
    data['coash_name'] = coashName;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    data['membership'] = membership;
    if (rate != null) {
      data['rate'] = rate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Rate {
  int? id;
  String? training;
  String? feeding;
  int? userId;
  int? coashId;
  String? regularity;
  String? response;
  String? total;
  String? createdAt;
  String? updatedAt;

  Rate(
      {this.id,
        this.training,
        this.feeding,
        this.userId,
        this.coashId,
        this.regularity,
        this.response,
        this.total,
        this.createdAt,
        this.updatedAt});

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    training = json['training'];
    feeding = json['feeding'];
    userId = json['user_id'];
    coashId = json['Coash_id'];
    regularity = json['Regularity'];
    response = json['Response'];
    total = json['Total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['training'] = training;
    data['feeding'] = feeding;
    data['user_id'] = userId;
    data['Coash_id'] = coashId;
    data['Regularity'] = regularity;
    data['Response'] = response;
    data['Total'] = total;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

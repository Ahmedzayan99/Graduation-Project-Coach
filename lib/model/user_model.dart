class UserModel {
   String? name;
   String? email;
   String? uId;
   String? phone;
   String? image;
   String? age;
   String? weight;
   String? height;
   String? fatPercentage;
   String? gender;
  UserModel({
      this.name,
     this.email,
     this.uId,
    this.phone,
    this.image,
    this.age,
    this.weight,
    this.height,
    this.fatPercentage,
    this.gender,

  });
  UserModel.fromJson(Map<String,dynamic> json){
    name =json['name'];
    email =json['email'];
    uId =json['uId'];
    phone =json['phone'];
    image =json['image'];
    age =json['age'];
    weight =json['weight'];
    height =json['height'];
    fatPercentage =json['fatPercentage'];
    gender =json['gender'];
  }
   Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'uId':uId,
      'phone':phone,
      'image':image,
      'age':age,
      'weight':weight,
      'height':height,
      'fatPercentage':fatPercentage,
      'gender':gender,
    };
   }
}

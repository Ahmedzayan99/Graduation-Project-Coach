// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison, prefer_if_null_operators, avoid_types_as_parameter_names

import 'dart:convert';
import 'dart:io';

import 'package:blackgymcoach/model/model/coach_model.dart';
import 'package:blackgymcoach/model/model/muscles/all_user.dart';
import 'package:blackgymcoach/model/model/muscles/only_muscle.dart';
import 'package:blackgymcoach/model/model/user_model.dart';
import 'package:blackgymcoach/modules/home/home.dart';
import 'package:blackgymcoach/modules/settings/settings.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/network/constants.dart';
import 'package:blackgymcoach/shared/network/local/cache_helper.dart';
import 'package:blackgymcoach/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GymCubit extends Cubit<GymStates> {
  GymCubit() : super(GymInitialState());

 get index => null;

  static GymCubit get(context) => BlocProvider.of(context);

  //<<<<<<<<<<<<<<<<<Start the cubit of BottomNavigationBar >>>>>>>>>>>>>>>>>>>>>>
  int current = 0;
  List<Widget> screen = [
    HomeScreen(),
    SettingsScreen(),
  ];
  void changeIndex(int index) {
    if (index == 1) {
      getCoashData();
 //     getUserData();
    }
    current = index;
    emit(GymChangeBottomNavBarState());
  }

  //<<<<<<<<<<<<<<<<<Start the cubit of page Setting >>>>>>>>>>>>>>>>>>>>>>

  void changeselected() {

  }

  bool myProfile =false;
  void changeBottomProfile() {
    myProfile = !myProfile;
    emit(GymChangeProfileState());
  }

  bool language = false;

  void changeBottomLanguage() {
    language = !language;
    emit(GymChangeLanguageState());
  }

  bool Rating = false;

  void RatingBottomLanguage() {
    Rating = !Rating;
    emit(GymChangeLanguageState());
  }

  bool addplanWidget = false;

  void AddPlanWidget() {
    addplanWidget = !addplanWidget;
    emit( GymAddPlanWedgitState());
  }

  bool ourBranch = false;
  void changeBottomBranch() {
    ourBranch = !ourBranch;
    emit(GymChangeBranchState());
  }

  bool selectLanguage = true;

  void changeBottomSelectLanguage() {
    selectLanguage = !selectLanguage;
    emit(GymInitialState());
  }

  ////////////////////////////////////////////////////////////////////////////////////////

  //<getData>
  double heightInitial = 120;

  void updateHeight({
    required double height,
  }) {
    heightInitial = height;
    print(heightInitial);
    emit(UpdateHeightState());
  }

  double weightInitial = 60;

  void updateWeight({
    required double weight,
  }) {
    weightInitial = weight;
    print(weightInitial);
    emit(UpdateWeightState());
  }

  double ageInitial = 21;

  void updateAge({
    required double age,
  }) {
    ageInitial = age;
    print(ageInitial);
    emit(UpdateAgeState());
  }

  double fatPercentageInitial = 5;

  void updateFatPercentaget({
    required double fatPercentage,
  }) {
    fatPercentageInitial = fatPercentage;
    print(fatPercentageInitial);
    emit(UpdateFatPercentageState());
  }


  File? profileImage;
 // var picker = ImagePicker();
/*
  void getProfileImage() async {
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickerSuccessState());
    } else {
      print('no image selected');
      emit(ProfileImagePickerErrorState());
    }
  }
  */
  /*

  Future<void> uploadProfileImage() async {
    emit(UploadProfileImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        updateProfileImage(
            image: value
        );
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }


   */
  /*
  void updateProfileImage({
    String? image,
  }) {
    UserModel model = UserModel(
      image: image,
      name: userModel?.name,
      email: userModel?.email,
      phone: userModel?.phone,
      height: userModel?.height,
      age: userModel?.age,
      uId: userModel?.uId,
      fatPercentage: userModel?.fatPercentage,
      weight: userModel?.weight,
      gender: userModel?.gender,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      profileImage = null;
      getUserData();
    }).catchError((error) {
      emit(UserUpdateErrorState());
    });
  }

  void updateUserBady({
    String? height,
    String? age,
    String? fatPercentage,
    String? weight,
  }) async {
    UserModel model = UserModel(
      name: userModel?.name,
      email: userModel?.email,
      phone: userModel?.phone,
      uId: userModel?.uId,
      image: userModel?.image,
      gender: userModel?.gender,
      height: '${ageInitial.round()}',
      age: '${ageInitial.round()}',
      fatPercentage: '${fatPercentageInitial.round()}',
      weight: '${weightInitial.round()}',

    );
    emit(UpdateUserBadyLoadingState());

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
      print("yessssss");
    }).catchError((error) {
      emit(UserUpdateErrorState());
    });
  }

  void updateName({
    required String name,
  }) async {
    UserModel model = UserModel(
      name: name,
      email: userModel?.email,
      phone: userModel?.phone,
      height: userModel?.height,
      image: userModel?.image,
      age: userModel?.age,
      uId: userModel?.uId,
      fatPercentage: userModel?.fatPercentage,
      weight: userModel?.weight,
      gender: userModel?.gender,
    );
    emit(UpdateNameLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
      print("yessssss");
    }).catchError((error) {
      emit(UserUpdateErrorState());
    });
  }

  UserModel? userModel;

  Future<void> getUserData() async {
    emit(GetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(CacheHelper.getDataIntoShPre(key: "uId"))
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print("Bishooooooo $userModel");
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
      print(error);
    });
  }


//

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    CacheHelper.removeUserData(key: 'uId');
  }

 */


  List<String> dropDownButton = [
    'ar',
    'en',
  ];
  String lang = 'en';

  void changeLanguage({required String languageCode}) {
    if (languageCode.isNotEmpty) {
      lang = languageCode;
    } else {
      lang = lang;
    }
    CacheHelper.saveData(key: 'Lang', value: lang).then((value) {
      emit(ChangeAppModeState());
    });
  }
/*
  void confirmPasswordReset() {
    FirebaseAuth
        .instance
        .confirmPasswordReset(
        code: '1112',
        newPassword: '11111111')
        .then((value) {
      print('sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    })
        .catchError((error) {
      print(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      print(error.toString());
    });
  }
 */

  //<<<<<<<<<<<<<<<<<Start the cubit of BottomSheet >>>>>>>>>>>>>>>>>>>>>>

  bool isBottomSheet = false;
  IconData iconShow = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheet = isShow;
    iconShow = icon;
    emit(ChangeBottomSheetState());
  }

   UserModel? userModel;
  Future<void> getUserData({
  required int id ,
}) async {
    emit(GetUserLoadingState());
    await DioHelper.getData(url:user.oneUser(id:id))
        .then((value) {
      userModel = UserModel.fromJson(value.data!);
      emit(GetUserSuccessState());
    })
        .catchError((error) {
      emit(GetUserErrorState(error: error.toString()),);
      print(error.toString());
    });
  }


  AllUser? allUser;
  Future<void> getAllUserData() async {
    emit(GetAllUserLoadingState());
    await DioHelper.getData(url: alluser)
       .then((value) {
       allUser = AllUser.fromJson(value.data);
      emit(GetAllUserSuccessState());
    })
        .catchError((error) {
      emit(GetAllUserErrorState(error.toString()));
    });
  }

  CoachModel? coashModel;
  Future<void> getCoashData(
  // required int id
  ) async {
    emit(GetCoachLoadingState());
    await DioHelper.getData(url: user.oneUser(id: CacheHelper.getDataIntoShPre(key:'token')))
        .then((value) {
      coashModel = CoachModel.fromJson(value.data);
      emit(GetCoachSuccessState());
    }).catchError((error){
      emit(GetCoachErrorState(error: error));
    });
  }
/*;
    await DioHelper.getData(url: user)
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(GetUserSuccessState());
    })*//*

        .catchError((error) {
      emit(GetUserErrorState(error: error.toString()),);
      print(error.toString());
    });
  }


*/

  List<String> dropDownButtonselectedDay = [
    'saturday',
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
  ];
  String Day = 'sunday';
  Future<void> selectedDay({required String dayCode}) async {
    if (dayCode.isNotEmpty) {
      lang = dayCode;
    } else {
      lang = lang;
    }
    emit(ChangeAppModeState());

  }

  OnlyMucsleModel? onlyMucsleModel;
  Future<void> getOnlyMuscles(
      //  required int? id,
      ) async {
    emit(GetOnlyMusclesLoading());
    await  DioHelper.getData(url:alllexercises)
        .then((value) {
      onlyMucsleModel = OnlyMucsleModel.fromJson(value.data);
      // final items =onlyMucsleModel!.data![index] as dynamic;
      //   final filteritem =items!.where((items) => items['id']=='4').toList();
      //   print('ffffiiiilllll${filteritem}');
      emit(GetOnlyMusclesSuccess());
    })
        .catchError((error) {
      emit(GetOnlyMusclesError(error: error.toString()));
    });

   /* RegisterModel? registerModel;
    void createUser({
      required String name,
      required String email,
      required String password,
      required String phoneNumber,
    }){
      emit(CreateUserLoadingState());
      DioHelper.postData(url:register , data: {
        "name":name,
        "email":email,
        "password":password.toString(),
        "phone_number":phoneNumber.toString(),
        "height":heightInitial.toString(),
        "weight":weightInitial.toString(),
        "age":ageInitial.toString(),
        "fat_percentage":fatPercentageInitial.toString(),
      }).then((value) {
        print("111111111111");
        print("111111111111");
        registerModel = RegisterModel.fromJson(value.data);
        print("2222222222222");
        emit(CreateUserSuccessState(successMessage: registerModel!.message));
        userLogin(email:email,password: password );
      }).catchError((error){
        print('CreateUserErrorState$error');
        emit(CreateUserErrorState(error.toString()));
      });
    }*/


  }


  Future<void> addPlan(
     {
  required int userId,
  required String day,
  required List<String> exercises,
  required List<String> muscles,
}
      ) async {
    emit(addPlanLoading());
   await DioHelper.postData(url:addplan, data:
       {
         "user_id":userId,
         "day":'$day',
         "exercises":exercises,
         "muscles":muscles,
       }
       ).then((value) {
     emit(addPlanSuccess());

   }).catchError((error){
     emit(addPlanError(error: error));
   });
  }


/*

  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void createDatabase() {
    print('Start **********************************');
    openDatabase(
      'GymApp.db',
      version: 1,
      onCreate: (database, version) {
        print('DataBase Created ------------------------------------');
        database.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
        )
            .then((value) {
          print('Table Created ====================================');
        }).catchError((error) {
          print('error when ${error.toString()}');
        });
      },
      onOpen: (database) {
        getFromDatabase(database);
        print('DataBase Opened ________________________________________');
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async
    {
      await txn
          .rawInsert(
          'INSERT INTO task (title, date, time, status) VALUES("$title", "$date", "$time", "new")'
      )
          .then((value) {
        print(' insert successfully');
        emit(InsertDatabaseState());
        getFromDatabase(database);
      })
          .catchError((error) {
        print('when error${error.toString()}');
      });
    });
  }

  getFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(GetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM task').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        }

        else if (element['status'] == 'done') {
          doneTasks.add(element);
        }

        else {
          archiveTasks.add(element);
        }
      });
      emit(GetDatabaseState());
    });
  }

  void updateToDatabase({
    required String status,
    required int id,
  }) {
    database.rawUpdate(
        'UPDATE task SET status = ? WHERE id = ?',
        [status, id])
        .then((value) {
      getFromDatabase(database);
      emit(UpdateDatabaseState());
    });
  }

  void deleteFromDatabase({
    required id,
  }) {
    database
        .rawDelete('DELETE FROM task WHERE id = ?', [id])
        .then((value) {
      getFromDatabase(database);
      emit(DeleteDatabaseState());
    });
  }

   */
}
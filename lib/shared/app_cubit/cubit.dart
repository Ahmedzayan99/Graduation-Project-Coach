// ignore_for_file: avoid_print

import 'dart:io';
import 'package:blackgymcoach/model/model/coach_model.dart';
import 'package:blackgymcoach/model/model/muscles/all_user.dart';
import 'package:blackgymcoach/model/model/muscles/only_muscle.dart';
import 'package:blackgymcoach/model/model/all_user_model.dart';
import 'package:blackgymcoach/model/model/user_model.dart';
import 'package:blackgymcoach/modules/home/home.dart';
import 'package:blackgymcoach/modules/settings/settings.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/network/constants.dart';
import 'package:blackgymcoach/shared/network/local/cache_helper.dart';
import 'package:blackgymcoach/shared/network/remote/dio_helper.dart';
import 'package:blackgymcoach/shared/styles/iconly_broken.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
class GymCubit extends Cubit<GymStates> {
  GymCubit() : super(GymInitialState());

 get index => null;
  static GymCubit get(context) => BlocProvider.of(context);
  //<<<<<<<<<<<<<<<<<Start the cubit of BottomNavigationBar >>>>>>>>>>>>>>>>>>>>>>
  int current = 0;
  List<Widget> screen = [
    const HomeScreen(),
    const SettingsScreen(),
  ];
  void changeIndex(int index) {
    if (index == 1) {
      getCoachData();
 //     getUserData();
    }
    current = index;
    emit(GymChangeBottomNavBarState());
  }

  //<<<<<<<<<<<<<<<<<Start the cubit of page Setting >>>>>>>>>>>>>>>>>>>>>>

  bool myProfile =false;
  void changeBottomProfile() {
    myProfile = !myProfile;
    emit(GymChangeProfileState());
  }

  bool rating = false;
  void ratingBottomLanguage() {
    rating = !rating;
    emit(GymChangeBottomRateState());
  }
  bool addPlanBool = false;
  void addPlanWidget() {
    addPlanBool = !addPlanBool;
    emit( ChangeBottomAddPlanState());
  }

  bool ourBranch = false;
  void changeBottomBranch() {
    ourBranch = !ourBranch;
    emit(ChangeBottomBranchState());
  }
  ////////////////////////////////////////////////////////////////////////////////////////

  IconData iconPasswordLogin = IconlyBroken.hide;
  bool isPasswordLogin = true;

  void changePasswordLoginVisible() {
    isPasswordLogin = !isPasswordLogin;
    iconPasswordLogin =
    isPasswordLogin ? IconlyBroken.hide : Icons.remove_red_eye_rounded;
    emit(GymChangeVisiblePasswordEditState());
  }
  IconData iconPasswordConfirmLogin = IconlyBroken.hide;
  bool isPasswordConfirmLogin = true;

  void changePasswordConfirmVisible() {
    isPasswordConfirmLogin = !isPasswordConfirmLogin;
    iconPasswordConfirmLogin =
    isPasswordConfirmLogin ? IconlyBroken.hide : Icons.remove_red_eye_rounded;
    emit(GymChangeVisiblePasswordConfirmEditState());
  }

  bool isPasswordRegister = true;
  IconData iconPasswordRegister = IconlyBroken.hide;


  File? profileImage;
  var picker = ImagePicker();
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


  Future<void> uploadProfileImage() async {
    emit(UploadProfileImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('ahmed/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateProfileImage(image: value);
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void updateProfileImage({
    String? image,
  }) {
    DioHelper.postData(url:updateProfile , data: {
      "coach_id":coachModel!.coach!.id,
      "name":coachModel!.coach!.name,
      "password":'123456789',
      "phone_number":coachModel!.coach!.phoneNumber,
      "image":image,
      "salary":coachModel!.coach!.salary,
      "joined_at":coachModel!.coach!.joinedAt

    }).then((value) {
      profileImage = null;
      getCoachData();
    }).catchError((error) {
      emit(UserUpdateErrorState());
    });
  }

  void updateProfilePassword({
    String? password,
  }) {
    emit(UpdateUserPasswordLoadingState());
    DioHelper.postData(url:updateProfile , data: {
      "coach_id":coachModel!.coach!.id,
      "name":coachModel!.coach!.name,
      "password":password,
      "phone_number":coachModel!.coach!.phoneNumber,
      "image":coachModel!.coach!.image,
      "salary":coachModel!.coach!.salary,
      "joined_at":coachModel!.coach!.joinedAt


    }).then((value) {
      getCoachData();
    }).catchError((error) {
      emit(UpdateUserPasswordErrorState());
    });
  }
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
    await DioHelper.getData(url:User.oneUser(id:id))
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
  List<AllUserModel>? usersOfCoach;
  Future<void> getAllUserData(
    {
  required String coach,
}
      ) async {
    emit(GetAllUserLoadingState());
    await DioHelper.getData(url: allUserUrl)
       .then((value) {
      allUser= AllUser.fromJson(value.data);
      usersOfCoach=[];
      for(int i=0; i<allUser!.users!.data!.length;i++){
        if(allUser!.users!.data![i].coashName==coach){
          var userWithCoach =allUser!.users!.data![i];
          if(userWithCoach.rate != null) {
            usersOfCoach!.add(AllUserModel.fromJson(userWithCoach.toJson()));
            print(userWithCoach.toJson());
            print(usersOfCoach!.toList());
          }
        }
      }
      emit(GetAllUserSuccessState());
    })
        .catchError((error) {
          print('Error of Get All User $error}');
      emit(GetAllUserErrorState(error.toString()));
    });
  }
  CoachModel? coachModel;
  Future<void> getCoachData(
  ) async {
    emit(GetCoachLoadingState());
//
    await DioHelper.getData(url:'$coach${CacheHelper.getDataIntoShPre(key:'token')}')
        .then((value) {
      coachModel = CoachModel.fromJson(value.data);
      emit(GetCoachSuccessState());
    }).catchError((error){
      emit(GetCoachErrorState(error: error));
    });
  }

  Future<void> updateRate(
     {
  required String total,
  required String training,
       required String feeding,
       required String userId,
       required String regularity,
       required String response,
    }
      ) async {
    emit(UpdatedRateLoadingState());
    await DioHelper.postData(url: updatedRate, data: {
    "training":training,
    "feeding":feeding,
    "user_id":userId,
    "Coash_id":'${CacheHelper.getDataIntoShPre(key:'token')}',
    "Regularity":regularity,
    "Response":response,
    "Total":total,
    }).then((value) {
      emit(UpdatedRateSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(UpdatedRateErrorState());
    });
  }
  OnlyMucsleModel? onlyMucsleModel;
  Future<void> getOnlyMuscles(
      //  required int? id,
      ) async {
    emit(GetOnlyMusclesLoading());
    await  DioHelper.getData(url:allExercises)
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
  }


  Future<void> addPlan(
     {
  required int userId,
  required String day,
  required List<String> exercises,
  required List<String> muscles,
}
      ) async {
    emit(AddPlanLoading());
   await DioHelper.postData(url:addPlanUrl, data:
       {
         "user_id":userId,
         "day":day,
         "exercises":exercises,
         "muscles":muscles,
       }
       ).then((value) {
     emit(AddPlanSuccess());

   }).catchError((error){
     emit(AddPlanError(error: error));
   });
  }

  Future<void> logOut() async {
    CacheHelper.removeUserData(key:'token');
  }
}

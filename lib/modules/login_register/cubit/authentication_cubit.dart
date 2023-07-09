

// ignore_for_file: avoid_print

import 'package:blackgymcoach/model/model/authentication/login.dart';
import 'package:blackgymcoach/shared/network/constants.dart';
import 'package:blackgymcoach/shared/network/local/cache_helper.dart';
import 'package:blackgymcoach/shared/network/remote/dio_helper.dart';
import 'package:blackgymcoach/shared/styles/iconly_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_states.dart';

  class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  //<<<<<<<<<<<<<<<<<Start the cubit of show Password  >>>>>>>>>>>>>>>>>>>>>>

  IconData iconPasswordLogin = IconlyBroken.hide;
  bool isPasswordLogin = true;

  void changePasswordLoginVisible() {
    isPasswordLogin = !isPasswordLogin;
    iconPasswordLogin =
        isPasswordLogin ? IconlyBroken.hide : Icons.remove_red_eye_rounded;
    emit(GymChangeVisiblePasswordLoginState());
  }

  bool isPasswordRegister = true;
  IconData iconPasswordRegister = IconlyBroken.hide;

  void changePasswordRegisterVisible() {
    isPasswordRegister = !isPasswordRegister;
    iconPasswordRegister =
        isPasswordRegister ? IconlyBroken.hide : Icons.remove_red_eye_rounded;
    emit(GymChangeVisiblePasswordRegisterState());
  }

  LoginModel? loginModel;
  String? messageLoginSuccess;
  Future<void> userLogin({
    required String? email,
    required String? password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: "token", value: loginModel?.coash?.id);
      messageLoginSuccess=loginModel!.message;
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print('error in Login${error.toString()}');
    });
  }
  }
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../modules/login_register//homeSignup.dart';
import '../network/local/cache_helper.dart';

String? uId = '';
const register = '/api/auth/register';
const login = '/api/auth/login';
const muscles = '/api/muscles/all';
const  OonlyMuscles = '/api/muscle/exercises/';
const  coach = '/api/customcoach/29';
const updateProfil = '/api/updateprofilcoash';
const  alllexercises = '/api/exercises/all';
//const  user = '/api/getprofil/61';
const  alluser = '/api/allusers';
const addplan='/api/store';
const updatedRate='/api/updaterate';
class user{
  static String  oneUser({
    int? id,
  })=>'/api/getprofil/$id';
}
class api{
  static String  plan({
    int? id,
    String? day
  }) => '/api/plan-by-day/$id/$day';
}

//final GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();

// Function For Navigate To Other Screens And Cant Return
void signOut(context)
{
  CacheHelper.removeUserData(
      key: 'token').
  then((value)
  {
    if (value!)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeSignUpScreen()),
      );
    }
  });
}
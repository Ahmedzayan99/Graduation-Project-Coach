// ignore_for_file: unnecessary_null_comparison

import 'package:blackgymcoach/model/model/all_user_model.dart';
import 'package:blackgymcoach/modules/user/profile_user.dart';
import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/components.dart';
import 'package:blackgymcoach/shared/styles/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
        listener: (context, state) {
          if (State is GetAllUserLoadingState) {
            return showProgressIndicator(context);
          }
          if (State is GetAllUserErrorState) {
            return showErrorMassage(context);
          }
        },
    builder: (context, state) {


              if (GymCubit.get(context).allUser == null) {
            return defaultProgressIndicator();
          }
          else {
            return Scaffold(
              appBar: AppBar(
                  title:Row(
                    children: [
                      const Text('Trainees with you',),
                      Icon(Icons.person,color: ColorsManager.primary,)
                    ],
                  ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   /* TextFormField(

                      obscureText: false,
                      *//*   validator: (value) {
                  return validator!(value);
                },*//*
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color:  Color.fromRGBO(197, 195, 193, 1),
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(color:  Color.fromRGBO(197, 195, 193, 1)),
                        prefixIcon: Icon(IconlyBroken.search,color:  Color.fromRGBO(197, 195, 193, 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromRGBO(69, 69, 69, 1), width: 1.5),
                            borderRadius:  BorderRadius.all(Radius.circular(25.0))),

                        /// Focused Border
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color:  Color.fromRGBO(69, 69, 69, 1), width: 1.5),
                            borderRadius:  BorderRadius.all(Radius.circular(25.0))),

                        /// Error Border
                        errorBorder:  OutlineInputBorder(
                            borderSide:
                            BorderSide(  color: Color.fromRGBO(69, 69, 69, 1), width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(25.0))),

                        /// Focused Error Border
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromRGBO(69, 69, 69, 1), width: 1.5),
                            borderRadius:  BorderRadius.all(Radius.circular(25.0))),
                        fillColor:  Color.fromRGBO(69, 69, 69, 1),
                        //   suffixIcon: Icon(IconlyBroken.message),
                      ),
                    ),*/
                    const SizedBox(height: 20.0),
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return buildSearchItem(GymCubit.get(context).usersOfCoach!,context,index);
                        },
                        separatorBuilder: (context, index) {
                          return   const SizedBox(height: 20.0);
                        },
                        itemCount: GymCubit.get(context).usersOfCoach!.length),
                  ],
                ),
              ),
            );
          }
        }
    );
  }
}
Widget buildSearchItem(List<AllUserModel> model ,context,index) =>
    InkWell(
      onTap:()
          {
             GymCubit.get(context).getUserData(id:model[index].id as int);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ProfileUserScreen(),));
},
         child: Row(
    children: [
      CircleAvatar(
        radius: 25.0,
        backgroundImage: NetworkImage(
          '${model[index] !=null ?
              model[index].imageUrl:'ssss'
          }',
        ),
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${model !=null ?
            model[index].name:'null'}',
          style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize:20.0,
              ),
            ),
      /*      SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Age24 ,Weight 80Kg',
                    style: TextStyle(
                        color: Colors.white24
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height:10.0 ,
            ),
*/
          ],
        ),
      ),

    ],
  ),
);
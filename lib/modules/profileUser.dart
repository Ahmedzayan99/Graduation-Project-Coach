import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/global/app_localization/app_localization.dart';
import 'package:blackgymcoach/shared/styles/colors_manager.dart';
import 'package:blackgymcoach/shared/styles/iconly_broken.dart';
import 'package:blackgymcoach/shared/widgets/custom_text_form_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserScreen extends StatelessWidget {
   ProfileUserScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
      listener: (context, state) {},
    builder: (context, state) {
       var userModel = GymCubit.get(context).userModel;
      return Scaffold(
          appBar: AppBar(
            /*  title: IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewLayout()));
            }, icon: Icon(IconlyBroken.back)),*/
          ),
          body:SingleChildScrollView(
            child: Padding(
               padding: const EdgeInsetsDirectional.only(top:0,start:5,end:5,bottom: 15.0),
              child: Column(
                children: [
                  SizedBox(
                height: 210.0,
                    child: Stack(
                      alignment: AlignmentDirectional
                          .bottomCenter,
                      children: [
                         Align(
                          alignment:
                          AlignmentDirectional
                              .topStart,
                          child: SizedBox(
                              height: 160.0,
                              width: double.infinity,
                              //   width: double.infinity,
                              child: Container(
                                decoration: const BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/gym.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 55.0,
                          backgroundColor:
                          ColorsManager.primary,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${userModel?.data!.imageUrl}'),
                            radius: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    '${userModel?.data!.name}',
                    style: const TextStyle(
                      color: Color.fromRGBO(
                          251, 251, 251, 1),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height:50.0,
                    child: Expanded(
                      child:Row(
                        /*     mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,*/
                        children: [
                        /*  Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${'phoneNumber'.tr(context)}",
                                  maxLines: 1,
                                  style:  TextStyle(
                                    color: ColorsManager.primary,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              const SizedBox(
                                  height: 10.0,
                                ),
                                Align(
                                  alignment:AlignmentDirectional.center,
                                  child: Text(
                                    '${userModel?.data!.phoneNumber}',
                                    style: const TextStyle(

                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
*/
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Fat",
                                  maxLines: 1,
                                  style:  TextStyle(
                                      color: ColorsManager.primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                /*  const SizedBox(
                                  width: 20.0,
                                ),*/
                                Align(
                                  alignment:AlignmentDirectional.center,
                                  child: Text(
                                    '${userModel?.data!.fatPercentage}',
                                    style: const TextStyle(
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${'height'.tr(context)}",
                                  maxLines: 1,
                                  style:  TextStyle(
                                      color: ColorsManager.primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                /*  const SizedBox(
                                  width: 20.0,
                                ),*/
                                Align(
                                  alignment:AlignmentDirectional.center,
                                  child: Text(
                                    '${userModel?.data!.height}',
                                    style: const TextStyle(

                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${'weight'.tr(context)}",
                                  maxLines: 1,
                                  style:  TextStyle(
                                      color: ColorsManager.primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                /*  const SizedBox(
                                  width: 20.0,
                                ),*/
                                Align(
                                  alignment:AlignmentDirectional.center,
                                  child: Text(
                                    '${userModel?.data!.weight}',
                                    style: const TextStyle(
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${'age'.tr(context)}",
                                  maxLines: 1,
                                  style:  TextStyle(
                                      color: ColorsManager.primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                /*  const SizedBox(
                                  width: 20.0,
                                ),*/
                                Align(
                                  alignment:AlignmentDirectional.center,
                                  child: Text(
                                    '${userModel?.data!.age}',
                                    style: const TextStyle(
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${'gender'.tr(context)}",
                                  maxLines: 1,
                                  style:  TextStyle(
                                      color: ColorsManager.primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                /*  const SizedBox(
                                  width: 20.0,
                                ),*/
                                Align(
                                  alignment:AlignmentDirectional.center,
                                  child: Text(
                                    '${userModel?.data!.gender}',
                                    style: const TextStyle(
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                 /*       Row(
                            children: [
                              Text(
                                "${'gender'.tr(context)}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(
                                      251, 251, 251, 1),
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:AlignmentDirectional.centerEnd,
                                  child: Text(
                                    '${"userModel?.data!.gender"}',
                                    style: const TextStyle(
                                      decoration: TextDecoration
                                          .underline,
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${'age'.tr(context)}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(
                                      251, 251, 251, 1),
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:AlignmentDirectional.centerEnd,
                                  child: Text(
                                    '${"userModel?.data!.age"}',
                                    style: const TextStyle(
                                      decoration: TextDecoration
                                          .underline,
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${'weight'.tr(context)}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(
                                      251, 251, 251, 1),
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:AlignmentDirectional.centerEnd,
                                  child: Text(
                                    '${"userModel?.data!.weight"}',
                                    style: const TextStyle(
                                      decoration: TextDecoration
                                          .underline,
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${'height'.tr(context)}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(
                                      251, 251, 251, 1),
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:AlignmentDirectional.centerEnd,
                                  child: Text(
                                    '${"userModel?.data!.height"}',
                                    style: const TextStyle(
                                      decoration: TextDecoration
                                          .underline,
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${'fatPercentageheight'.tr(context)}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(
                                      251, 251, 251, 1),
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:AlignmentDirectional.centerEnd,
                                  child: Text(
                                    '${'userModel?.data!.fatPercentage'}',
                                    style: const TextStyle(
                                      decoration: TextDecoration
                                          .underline,
                                      inherit: true,
                                      color: Color.fromRGBO(
                                          251, 251, 251, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),*/
                        ],),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding:EdgeInsetsDirectional.only(start:5.0,end: 5.0,),
                    child: Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MaterialButton(onPressed: () {},
                            height: 40.0,
                            color: ColorsManager.primary,
                              child: Text('Add a Plan',   style: TextStyle(
                                  color: ColorsManager.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                              ),
                              ),
                        ),
                          ),
                          SizedBox(width:12.0 ,),
                          Expanded(
                            child: MaterialButton(onPressed: () {
                              if(GymCubit.get(context).Rating==false){
                                GymCubit.get(context).RatingBottomLanguage();
                              }
                              else if (_formKey.currentState!.validate())
                              {
                                GymCubit.get(context).RatingBottomLanguage();
                              };
                            },
                                height: 40.0,
                                color: ColorsManager.primary,
                              child: Text(' Add a Rating',
                                style: TextStyle(
                                  color: ColorsManager.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                              ),
                              ),
                          ),
                          ),
                    ],
                    ),
                  ),
                  /*    Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              height: 45,
                                              minWidth: 70.0,
                                              shape: const StadiumBorder(),
                                              color: ColorsManager.primary,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditProfileScreen(),
                                                    ));
                                              },
                                              child:  Text(
                                                  "${'editMyProfile'.tr(context)}",
                                                  style: const TextStyle(
                                                    inherit: false,
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  )),
                                            ),
                                          ],
                                        ),*/
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GymCubit.get(context).Rating?Rating(context):const SizedBox(
                    height: 20.0,
                  ),

                    ],
              ),
            ),
          )


        );
    }
    );
  }
Widget Rating (context) =>Form(
  key:_formKey ,
  child:   Container(

    child: Column(

      children: [

        Row(

          /*mainAxisAlignment: MainAxisAlignment.start,

                            crossAxisAlignment: CrossAxisAlignment.start,*/

          children: [

            Expanded(

              child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      "Regularity",

                      style: const TextStyle(

                        color: Color.fromRGBO(

                            251, 251, 251, 1),

                        fontSize: 16.0,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ]),

            ),

            Expanded(

              flex: 2,

              child: Column(

                  children: [

                    CustomTextFormFiled(

                      validator: (p0) {

                        if (p0!.isEmpty) {

                          return "${'thisFieldRequired'.tr(context)}";

                        }

                        return null;

                      },

                      textInputType: TextInputType.visiblePassword,

                      hintText: 'Enter from 1 to 10',

                    ),

                  ]),

            ),





          ],

        ),

        SizedBox(height: 15.0,),

        Row(

          /*mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,*/

          children: [

            Expanded(

              child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      "Feeding",

                      style: const TextStyle(

                        color: Color.fromRGBO(

                            251, 251, 251, 1),

                        fontSize: 16.0,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ]),

            ),

            Expanded(

              flex: 2,

              child: Column(

                  children: [

                    CustomTextFormFiled(

                      validator: (p0) {

                        if (p0!.isEmpty) {

                          return "${'thisFieldRequired'.tr(context)}";

                        }

                        return null;

                      },

                      textInputType: TextInputType.visiblePassword,

                      hintText: 'Enter from 1 to 10',

                    ),

                  ]),

            ),





          ],

        ),

        SizedBox(height: 15.0,),

        Row(

          /*mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,*/

          children: [

            Expanded(

              child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      "Training",

                      style: const TextStyle(

                        color: Color.fromRGBO(

                            251, 251, 251, 1),

                        fontSize: 16.0,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ]),

            ),

            Expanded(

              flex: 2,

              child: Column(

                  children: [

                    CustomTextFormFiled(

                      validator: (p0) {

                        if (p0!.isEmpty) {

                          return "${'thisFieldRequired'.tr(context)}";

                        }

                        return null;

                      },

                      textInputType: TextInputType.visiblePassword,

                      hintText: 'Enter from 1 to 10',

                    ),

                  ]),

            ),





          ],

        ),

        SizedBox(height: 15.0,),

        Row(

          /*mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,*/

          children: [

            Expanded(

              child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      "Response",

                      style: const TextStyle(

                        color: Color.fromRGBO(

                            251, 251, 251, 1),

                        fontSize: 16.0,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ]),

            ),

            Expanded(

              flex: 2,

              child: Column(

                  children: [

                    CustomTextFormFiled(

                      validator: (p0) {

                        if (p0!.isEmpty) {

                          return "${'thisFieldRequired'.tr(context)}";

                        }

                        return null;

                      },

                      textInputType: TextInputType.visiblePassword,

                      hintText: 'Enter from 1 to 10',

                    ),

                  ]),

            ),





          ],

        ),

        SizedBox(height: 15.0,),

        Row(

          /*mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,*/

          children: [

            Expanded(

              child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      "Total",

                      style: const TextStyle(

                        color: Color.fromRGBO(

                            251, 251, 251, 1),

                        fontSize: 16.0,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ]),

            ),

            Expanded(

              flex: 2,

              child: Column(

                  children: [

                    CustomTextFormFiled(

                      validator: (p0) {

                        if (p0!.isEmpty) {

                          return "${'thisFieldRequired'.tr(context)}";

                        }

                        return null;

                      },

                      textInputType: TextInputType.visiblePassword,

                      hintText: 'Enter from 1 to 10',

                    ),

                  ]),

            ),





          ],

        ),









      ],

    ),

  ),
);

}

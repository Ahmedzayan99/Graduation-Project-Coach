// ignore_for_file: avoid_print


import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/components.dart';
import 'package:blackgymcoach/shared/global/app_localization/app_localization.dart';
import 'package:blackgymcoach/shared/network/local/cache_helper.dart';
import 'package:blackgymcoach/shared/styles/colors_manager.dart';
import 'package:blackgymcoach/shared/styles/iconly_broken.dart';
import 'package:blackgymcoach/shared/widgets/custom_text_form_filed.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUserScreen extends StatefulWidget {
   const ProfileUserScreen({super.key});

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController total=TextEditingController();
  TextEditingController training=TextEditingController();
  TextEditingController feeding=TextEditingController();
  TextEditingController regularity=TextEditingController();
  TextEditingController response=TextEditingController();
  List<int> selectedIndexes=[];
  List<String> idExer=[];
  List<String> dropDownButton = [
    'saturday',
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
  ];
  String day = 'sunday';

  get state => null;
  Future<void> selectedDay({required String dayCode}) async {
    if (dayCode.isNotEmpty) {
      day = dayCode;
    } else {
      day = day;
    }
  }
 /*  void showProgressIndicator(OnlyMucsleModel modelExercises, context)
   {
     AlertDialog alertDialog =   AlertDialog(
       backgroundColor: ColorsManager.grey,
       actions: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.only(left: 8.0,right: 8.0),
             child: Row(
               children: [
                 Container(
                   height: 36.0,
    //       clipBehavior: Clip.antiAliasWithSaveLayer,
                   decoration: BoxDecoration(
                     color:  ColorsManager.primary,
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 9.0),
                     child: DropdownButton(
                       style: TextStyle(color: Colors.white),
       // style: TextStyle(color: Colors.pink),
                     iconEnabledColor: Colors.white,
                     value:day,
                     dropdownColor: Colors.blue,
                     borderRadius: BorderRadius.all(Radius.circular(20),),
                       items:dropDownButton.map((String items)
                       {
                         return  DropdownMenuItem(
                           child: Text(items.toUpperCase()),
                           value: items,
                         );
                       }) .toList() ,
                       onChanged: (value) {
                         setState(() {
                           selectedDay(dayCode: value!);
                           print(value);
                             Navigator.pop(context);
                             showProgressIndicator(modelExercises, context);

                          // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context)=> ProfileUserScreen()), (route) => false);
                   //        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileUserScreen()));
                      //     showProgressIndicator(modelExercises, context);
                         });
                       },
                     ),
                   ),
                 ),
                 SizedBox(width: 60.0,),
                 Expanded(
                   child: MaterialButton(
                       padding: EdgeInsets.all(0),
                       onPressed: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileUserScreen(),));


                       },
                       color: ColorsManager.primary,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('ADD',style: TextStyle(
                               color: Colors.white,

                           )),
                           Icon(Icons.add,color: Colors.white,),
                         ],
                       )),
                 )
               ],
             ),
           ),
         ),

       ],
       icon: Row(
         children: [
           Text('Add a plan ',
             style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                 color: Colors.red),),
           Icon(IconlyBroken.exercise_1,color: Colors.black),
         ],
       ),
       actionsAlignment: MainAxisAlignment.start,
       buttonPadding: EdgeInsets.all(0),
       scrollable: true,
       //elevation: 70.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
       content:Container(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             ListView.separated(
               shrinkWrap: true,
               physics: BouncingScrollPhysics(),
               scrollDirection: Axis.vertical,
               itemBuilder:(context, index){

                 return ListTile(
                 title: Row(
                   children: [
                     Container(
                       width: 90.0,
                       height: 90.0,
                       decoration: BoxDecoration(
                         *//* border: Border.all(
                             color: const Color.fromRGBO(
                                 248, 202, 89, 0.6470588235294118),
                             width: 1.5,
                             style: BorderStyle.solid),*//*
                         borderRadius: BorderRadius.circular(20.0),
                         image: DecorationImage(
                           image: NetworkImage('${modelExercises.data![index].image}'),
                           fit: BoxFit.fill,),

                       ),
                     ),
                     const SizedBox(width: 10.0,),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(top: 5.0),
                         child: Text('${modelExercises.data![index].name}',
                           maxLines: 2,
                           //overflow: TextOverflow.fade,
                           style: const TextStyle(
                             color: Color.fromRGBO(251, 251, 251, 1),
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                           ),),
                       ),
                     ),
                   ],
                 ),
                 tileColor: selectedIndexes.contains(index)?Colors.blue:Colors.transparent,
                 shape:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(20))),

                 onTap: () {
                   setState(() {
                     if(selectedIndexes.contains(index)){
                       selectedIndexes.remove(index);
                       idExer.remove('${modelExercises.data![index].id}');
                     }
                     else{
                       selectedIndexes.add(index);
                       idExer.add('${modelExercises.data![index].id}');
                     }
                     Navigator.pop(context);
                     showProgressIndicator(modelExercises, context);
                     print(selectedIndexes);
                     print(idExer);
                   });
                 },
               );},
               separatorBuilder: (context, index) => Column(children: [
                 SizedBox(height: 5.0,),
                 Container(
                   width: double.infinity,
                   height: 0.2,
                   color: Colors.grey[300],
                 ),
                 SizedBox(height: 5.0,),

               ],),
               itemCount: modelExercises.data!.length,
             )

           ],
         ),
       ),
     );
     showDialog(
         barrierColor: Colors.white.withOpacity(0),
         barrierDismissible: true,
         context: context, builder: (context)

     {
       return alertDialog;
     });
   }
*/
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
        listener: (context, state) {
          if (State is GetUserLoadingState) {
            return showProgressIndicator(context);
          }
          if (State is GetUserErrorState) {
            return showErrorMassage(context);
          }
          if(state is UpdatedRateSuccessState){
            Fluttertoast.showToast(
              timeInSecForIosWeb:2 ,
              msg: "Done ADD Rate",
              backgroundColor: Colors.green,
              textColor: Colors.black,
            );
            GymCubit.get(context).ratingBottomLanguage();

          }
          if(state is UpdatedRateErrorState){
            Fluttertoast.showToast(
              timeInSecForIosWeb:2 ,
              msg: "Error ADD Rate",
              backgroundColor: Colors.red,
              textColor: Colors.black,
            );
          }
        },
        builder: (context, state) {
          var userModel = GymCubit.get(context).userModel;
          var onlyMucsleModel = GymCubit.get(context).onlyMucsleModel;
          if (GymCubit.get(context).userModel == null) {
            return defaultProgressIndicator();
          }
          else {
            return  Scaffold(
                appBar: AppBar(),
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
                                    child: const Image(
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
                                      '${userModel?.users!.imageUrl}'),
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

                          '${userModel?.users!.name}',
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
                        SizedBox(
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

                                          '${userModel?.users!.fatPercentage}',
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
                                          '${userModel?.users!.height}',
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
                                          '${userModel?.users!.weight}',
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
                                          '${userModel?.users!.age}',
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
                                          '${userModel?.users!.gender}',
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
                          padding:const EdgeInsetsDirectional.only(start:5.0,end: 5.0,),
                          child: Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GymCubit.get(context).addPlanBool?const SizedBox(): Expanded(
                                  child: MaterialButton(onPressed: () {
                                    GymCubit.get(context).getOnlyMuscles().then((value) {
                                      //     showProgressIndicator(onlyMucsleModel! ,context);
                                      GymCubit.get(context).addPlanWidget();
                                    });

                                  },
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
                                const SizedBox(width:12.0 ,),
                                GymCubit.get(context).rating?const SizedBox():Expanded(
                                  child: MaterialButton(onPressed: () {
                                    if(GymCubit.get(context).rating==false){
                                      GymCubit.get(context).ratingBottomLanguage();
                                    }
                                    else if (_formKey.currentState!.validate())
                                    {
                                      GymCubit.get(context).ratingBottomLanguage();
                                    }
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
                        GymCubit.get(context).addPlanBool?Container(
                          decoration: BoxDecoration(
                            //color: Colors.grey,
                            border: Border.all(color:ColorsManager.primary,),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            //  backgroundBlendMode: BlendMode.color,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text('Add a plan ',
                                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                                          color: Colors.red),),
                                    Icon(IconlyBroken.exercise_1,color: Colors.red),
                                  ],
                                ),
                                const SizedBox(height: 10.0,),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:(context, index){
                                    return ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            width: 90.0,
                                            height: 90.0,
                                            decoration: BoxDecoration(
                                              /* border: Border.all(
                               color: const Color.fromRGBO(
                                   248, 202, 89, 0.6470588235294118),
                               width: 1.5,
                               style: BorderStyle.solid),*/
                                              borderRadius: BorderRadius.circular(20.0),
                                              image: DecorationImage(
                                                image: NetworkImage('${onlyMucsleModel.data![index].image}'),
                                                fit: BoxFit.fill,),

                                            ),
                                          ),
                                          const SizedBox(width: 10.0,),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: Text(onlyMucsleModel.data![index].name!.toUpperCase(),
                                                maxLines: 2,
                                                //overflow: TextOverflow.fade,
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(251, 251, 251, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),),
                                            ),
                                          ),
                                        ],
                                      ),
                                      tileColor: selectedIndexes.contains(index)?ColorsManager.primary:Colors.grey,
                                      shape:const OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(20))),

                                      onTap: () {
                                        setState(() {
                                          if(selectedIndexes.contains(index)){
                                            selectedIndexes.remove(index);
                                            idExer.remove('${onlyMucsleModel.data![index].id}');
                                          }
                                          else{
                                            selectedIndexes.add(index);
                                            idExer.add('${onlyMucsleModel.data![index].id}');
                                          }
                                          //     Navigator.pop(context);
                                          //    showProgressIndicator(onlyMucsleModel!, context);
                                          print(selectedIndexes);
                                          print(idExer);
                                        });
                                      },
                                    );},
                                  separatorBuilder: (context, index) => Column(children: [
                                    const SizedBox(height: 5.0,),
                                    Container(
                                      width: double.infinity,
                                      height: 0.2,
                                      color: Colors.grey[300],
                                    ),
                                    const SizedBox(height: 5.0,),

                                  ],),
                                  itemCount: onlyMucsleModel!.data!.length,
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 36.0,
                                            //       clipBehavior: Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              color:  ColorsManager.primary,
                                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 9.0),
                                              child: DropdownButton(
                                                style: const TextStyle(color: Colors.white),
                                                // style: TextStyle(color: Colors.pink),
                                                iconEnabledColor: Colors.white,
                                                value:day,
                                                dropdownColor: Colors.grey[900],
                                                borderRadius: const BorderRadius.all(Radius.circular(20),),
                                                items:dropDownButton.map((String items)
                                                {
                                                  return  DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items.toUpperCase(),),
                                                  );
                                                }) .toList() ,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedDay(dayCode: value!);
                                                    print(value);
                                                    // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context)=> ProfileUserScreen()), (route) => false);
                                                    //        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileUserScreen()));
                                                    //     showProgressIndicator(modelExercises, context);
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 60.0,),
                                          Expanded(
                                            child: MaterialButton(
                                                padding: const EdgeInsets.all(0),
                                                onPressed: () {
                                                  GymCubit.get(context).addPlan(
                                                    userId: int.parse('${userModel!.users!.id}'),
                                                    day: day,
                                                    exercises: idExer,
                                                    muscles: ['5'],
                                                  ).then((value) {
                                                    GymCubit.get(context).addPlanWidget();
                                                  });
                                                },
                                                color: ColorsManager.primary,
                                                child: const Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text('ADD',style: TextStyle(
                                                      color: Colors.white,

                                                    )),
                                                    Icon(Icons.add,color: Colors.white,),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                ),
                              ],
                            ),
                          ),
                        ):const SizedBox(height: 20.0,),
                        if( GymCubit.get(context).addPlanBool)
                          if( GymCubit.get(context).rating)
                            const SizedBox(
                              height: 30.0,),
                        GymCubit.get(context).rating?rating(context):const SizedBox(
                          height: 20.0,
                        ),

                      ],
                    ),
                  ),
                )
            );
          }


        }
    );
  }

Widget rating (context) =>Form(
  key:_formKey ,
  child:   Container(
    decoration: const BoxDecoration(
        color: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(10.0))
   
    ),
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            children: [
              Text('Add a Rating ',
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                    color: Colors.red),),
              Icon(Icons.bar_chart,color: Colors.red),
            ],
          ),
          const SizedBox(height: 15.0,),
          Row(
            /*mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,*/
            children: [
              const Expanded(
                child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Regularity",
                        style: TextStyle(
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
                        controller: regularity,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "${'thisFieldRequired'.tr(context)}";
                          }
                          else if (p0.length>2) {
                            return "Enter from 1 to 10";
                          }
                          else if(RegExp(r"^[a-zA-Z]").hasMatch(p0))
                          {
                            return  "Enter from 1 to 10";
                          }
                          else if(RegExp(r"^[0-9]+[1-9]").hasMatch(p0))
                          {
                            return  "Enter from 1 to 10";
                          }
                          return null;

                        },
                        textInputType: TextInputType.number,
                        hintText: 'Enter from 1 to 10',

                      ),

                    ]),

              ),
            ],
          ),
          const SizedBox(height: 15.0,),
          Row(
            /*mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,*/
            children: [
              const Expanded(
                child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Feeding",
                        style: TextStyle(
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
                        controller: feeding,

                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "${'thisFieldRequired'.tr(context)}";
                          }
                          else if (p0.length>2) {
                            return "Enter from 1 to 10";
                          }
                          else if(RegExp(r"^[a-zA-Z]").hasMatch(p0))
                          {
                            return  "Enter from 1 to 10";
                          }
                          else if(RegExp(r"^[0-9]+[1-9]").hasMatch(p0))
                          {
                            return  "Enter from 1 to 10";
                          }
                          return null;
                        },
                        textInputType: TextInputType.number,
                        hintText: 'Enter from 1 to 10',
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 15.0,),
          Row(
            /*mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAignment.start,*/
            children: [
              const Expanded(
                child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Training",
                        style: TextStyle(

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
                        controller:training,

                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "${'thisFieldRequired'.tr(context)}";
                          }
                          else if (p0.length>2) {
                          return "Enter from 1 to 10";
                          }
                              else if(RegExp(r"^[a-zA-Z]").hasMatch(p0))
                            {
                            return  "Enter from 1 to 10";
                            }
                            else if(RegExp(r"^[0-9]+[1-9]").hasMatch(p0))
                            {
                            return  "Enter from 1 to 10";
                            }
                            return null;

                        },

                        textInputType: TextInputType.number,

                        hintText: 'Enter from 1 to 10',

                      ),

                    ]),

              ),





            ],

          ),
          const SizedBox(height: 15.0,),
          Row(

            /*mainAxisAlignment: MainAxisAlignment.start,

                          crossAxisAlignment: CrossAxisAlignment.start,*/

            children: [

              const Expanded(

                child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Text(

                        "Response",

                        style: TextStyle(

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
                        controller: response,

                        validator: (p0) {
                            if (p0!.isEmpty) {
                              return "${'thisFieldRequired'.tr(context)}";
                              }
                              else if (p0.length>2) {
                              return "Enter from 1 to 10";
                              }
                              else if(RegExp(r"^[a-zA-Z]").hasMatch(p0))
                              {
                              return  "Enter from 1 to 10";
                              }
                              else if(RegExp(r"^[0-9]+[1-9]").hasMatch(p0))
                              {
                              return  "Enter from 1 to 10";
                              }
                              return null;
                        },

                        textInputType: TextInputType.number,

                        hintText: 'Enter from 1 to 10',

                      ),

                    ]),

              ),





            ],

          ),
          const SizedBox(height: 15.0,),
          Row(

            /*mainAxisAlignment: MainAxisAlignment.start,

                          crossAxisAlignment: CrossAxisAlignment.start,*/

            children: [

              const Expanded(

                child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Text(

                        "Personality",

                        style: TextStyle(

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
                        controller:total,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "${'thisFieldRequired'.tr(context)}";
                          }
                                else if (p0.length>2) {
                                return "Enter from 1 to 10";
                                }
                                else if(RegExp(r"^[a-zA-Z]").hasMatch(p0))
                                {
                                return  "Enter from 1 to 10";
                                }
                                else if(RegExp(r"^[0-9]+[1-9]").hasMatch(p0))
                                {
                                return  "Enter from 1 to 10";
                                }
                                return null;

                        },
                        textInputType: TextInputType.number,

                        hintText: 'Enter from 1 to 10',

                      ),

                    ]),

              ),
            ],
          ),
          ConditionalBuilder(
           condition: state is UpdatedRateLoadingState ,
            builder: (context) =>  defaultProgressIndicator(),
            fallback: (context) =>Row(
              children: [ Expanded(
  child: MaterialButton(
  padding: const EdgeInsets.all(0),
    onPressed: () {
      if(GymCubit.get(context).rating==false){
        GymCubit.get(context).ratingBottomLanguage();
      }
      else if (_formKey.currentState!.validate())
      {
        GymCubit.get(context).updateRate(
          total: total.text,
          training: training.text,
          feeding: feeding.text,
          userId:GymCubit.get(context).userModel!.users!.id!.toString(),
          coachId: CacheHelper.getDataIntoShPre(key: 'token'),
          regularity: regularity.text,
          response: response.text,);
      }
    },
    color: ColorsManager.primary,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('ADD',style: TextStyle(
          color: Colors.white,
        )),
        Icon(Icons.add,color: Colors.white,),
      ],
    )),
  ),
           ], ),
          ),
        ],
      ),
    ),
  ),
);
}

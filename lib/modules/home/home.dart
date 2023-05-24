import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/components.dart';
import 'package:blackgymcoach/shared/global/app_localization/app_localization.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/home_images_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit,GymStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
       return ConditionalBuilder(
          condition:imgList.isNotEmpty,
          builder:(context) {
                return Scaffold(
                  appBar: AppBar(),
                    body: Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${'welcome'.tr(context)}",
                          style: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey),),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Image(image: AssetImage('assets/images/abdominal muscles.png'),height: 350.0,fit: BoxFit.cover),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text( "${'neverGiveUp'.tr(context)}",
                              style: const TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                            child: Text(
                              "${'loseWeightBuildMuscle'.tr(context)}",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                              maxLines: 5,
                            )),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 30),
                              ),
                              onPressed: () {
                                GymCubit.get(context).changeIndex(1);
                              },
                              child:  Text(
                                  "${'letsStart'.tr(context)}",
                                style: TextStyle(
                                    color: Colors.yellow, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                );
              },
          fallback: (context) => defaultProgressIndicator(),
        );
      },
    );

  }
}
 /*SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:  const EdgeInsets.only(right:17.0,left: 17.0 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.only(start:13.0,),
                    height: 40.0,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text("Let's start the plan",
                              style: TextStyle(
                                color:Color.fromRGBO(251, 251, 251, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,

                              )),
                        ),

                        Expanded (
                          flex: 1,
                          child: Container(
                            height: 29.0,
                            width: 20.0,
                            decoration:const BoxDecoration(
                              image:DecorationImage(
                                image:AssetImage(
                                    'assets/images/Vector.png' ),),),
                            child: Column(mainAxisAlignment:MainAxisAlignment.end,
                              children: const [
                                Image(image: AssetImage('assets/images/okay.png')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13.0,),
                  Container(
                    height: 47.0,
                    decoration:BoxDecoration(borderRadius:BorderRadius.circular(70.0),color:const Color.fromRGBO(69, 69, 69, 1),),
                    child: Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:const [
                          Icon(Icons.search,
                            color: Color.fromRGBO(158, 158, 158, 1),
                          ),
                          Text('Search anything',
                              style: TextStyle(
                                color: Color.fromRGBO(158, 158, 158, 1),
                                fontSize: 17.0,
                                fontWeight:FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19.0,),

                 /*class WorkoutCard extends StatelessWidget {
  final Color color;
  final WorkoutData workout;
  final Function() onTap;

  WorkoutCard({
    required this.color,
    required this.workout,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 10,
          right: 12,
        ),
        height: 160,
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      workout.title,
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${workout.exercices} muscles",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${workout.minutes} minutes",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage(workout.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

                 Padding(
                    padding: const EdgeInsets.symmetric( horizontal:9.0),
                    child:Row(
                      children: const [
                        Text("Recommended Training",
                            style: TextStyle(
                              color:Color.fromRGBO(251, 251, 251, 1),
                              fontWeight: FontWeight.bold,
                              fontSize:18.0,


                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,),
                  Column(
                    children: [
                      GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        mainAxisExtent: 370,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 14.0,
                      ),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children:List.generate(homeTrainingDummy.length,(index){
                          var homeDummyItem =  homeTrainingDummy[index];
                          return HomeTrainingItemWidget(selectTraining: homeDummyItem,);
                        }),)
                    ],
                  ),*/
                  const SizedBox(
                    height:24.0,),
                ],
              ),
            ),
          ) , */
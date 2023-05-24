// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:blackgymcoach/modules/gym.dart';
import 'package:blackgymcoach/modules/login_register/cubit/authentication_cubit.dart';
import 'package:blackgymcoach/modules/login_register/cubit/authentication_states.dart';
import 'package:blackgymcoach/shared/components.dart';
import 'package:blackgymcoach/shared/global/app_localization/app_localization.dart';
import 'package:blackgymcoach/shared/styles/colors_manager.dart';
import 'package:blackgymcoach/shared/styles/iconly_broken.dart';
import 'package:blackgymcoach/shared/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignupUserScreen extends StatelessWidget{
  SignupUserScreen({Key? key,}) : super(key: key);
  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var passController = TextEditingController();
  final TextEditingController phoneNumberController=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
        listener: (context, state) {
          if (state is PhoneLoadingState) {
            showProgressIndicator(context);
          }
          if (state is PhoneNumberSubmitted) {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) =>SignupUserScreen(),
              //OTPScreen(phoneNumber: phoneNumberController.text.trim(),)
            ), (route) => false);
          }
          if (state is PhoneErrorState) {

            Navigator.pop(context);
            String errorMsg = (state).error!;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorMsg),
                  backgroundColor: Colors.black,
                  duration: const Duration(seconds: 10),)
            );
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/abdominal muscles.png'),
                  fit: BoxFit.fill,opacity: 150.0),),
            child: Scaffold(
              appBar:AppBar(),
              body:Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${'name'.tr(context)}",
                          style: TextStyle(
                            inherit: false,
                            color: ColorsManager.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),),
                        CustomTextFormFiled(
                          isPassword: false,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "${'thisFieldRequired'.tr(context)}";
                            }
                            return null;
                          },
                          controller:nameController ,
                          textInputType: TextInputType.name,
                         icon:const Icon(IconlyBroken.profile,) ,
                          hintText:"${'name'.tr(context)}",
                        ),
                        const SizedBox(height: 30.0,),
                        Text("${'userName'.tr(context)}",
                          style: TextStyle(
                            inherit: false,
                            color: ColorsManager.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),),
                        CustomTextFormFiled(
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "${'thisFieldRequired'.tr(context)}";
                            }
                            else if(RegExp(r"^[a-zA-Z0-9]+[.@#$%&'*+-/=?^`{|}~]").hasMatch(p0))
                            {
                              return  "${'userNameMust'.tr(context)}";
                            }
                            else if(RegExp(r"^[@.#$%&'*+-/=?^`{|}~]").hasMatch(p0))
                            {
                              return  "${'userNameMust'.tr(context)}";
                            }
                            return null;
                          },
                          controller:userNameController ,
                          textInputType: TextInputType.emailAddress,
                          icon:const Icon(IconlyBroken.message,) ,
                          hintText:"${'userName'.tr(context)}",
                        ),
                        const SizedBox(height: 30.0,),
                        Text("${'phoneNumber'.tr(context)}",
                          style: TextStyle(
                            inherit: false,
                            color: ColorsManager.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child:CustomTextFormFiled(
                                isPassword: false,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "${'thisFieldRequired'.tr(context)}";
                                  }
                                  else if(value.length < 11)
                                  {
                                    return  "${'shortPhoneNumber'.tr(context)}";
                                  }
                                  else if(value.length >11)
                                  {
                                    return  "${'longPhoneNumber'.tr(context)}";
                                  }
                                  return null;
                                },
                                controller:phoneNumberController,
                                textInputType: TextInputType.phone,
                                icon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    '${generateCountryFlag()}+02',
                                    style:TextStyle(
                                      color: ColorsManager.primary,
                                      fontSize: 18,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ),
                                hintText:"${'phoneNumber'.tr(context)}",
                              ),),
                          ],),
                        const SizedBox(height: 30.0,),
                        Text("${'password'.tr(context)}",
                          style: TextStyle(
                            inherit: false,
                            color: ColorsManager.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),),
                        CustomTextFormFiled(
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "${'thisFieldRequired'.tr(context)}";
                            }
                            else if (p0.trim().length < 8) {
                              return 'Password must be at least 8 characters in length';
                            }
                            return null;
                          },
                          controller: passController,
                          textInputType: TextInputType.visiblePassword,
                          icon: const Icon(IconlyBroken.lock),
                          isPassword:AuthCubit.get(context).isPasswordRegister,
                          hintText:"${'password'.tr(context)}",
                          suffixOnPressed: (){
                            AuthCubit.get(context).changePasswordRegisterVisible();
                          },
                          suffixIcon: AuthCubit.get(context).iconPasswordRegister,
                        ),
                        const SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  cubit.changeGender(gender:true
                                  );

                                },
                                child: Container(
                                  height: 60.0,
                                  alignment: AlignmentDirectional.center ,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0,),
                                    color:cubit.genderInitial? ColorsManager.primary : ColorsManager.grey,),
                                  child: Text("${'male'.tr(context)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Colors.white),),
                                ),
                              ),

                            ),
                            const SizedBox(width: 5.0,),
                            Expanded(
                              child: GestureDetector(
                                onTap:(){
                                  cubit.changeGender(gender: false);
                                } ,
                                child: Container(
                                  height: 60.0,
                                  alignment: AlignmentDirectional.center ,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0,),
                                    color:cubit.genderInitial? ColorsManager.grey :ColorsManager.primary ,
                                  ),
                                  child: Text("${'female'.tr(context)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0,),
                        ConditionalBuilder(
                          condition:state is!RegisterLoadingState,
                          fallback: (context) => defaultProgressIndicator(),
                          builder:(context) =>
                              MaterialButton(
                                height: 54,
                                minWidth: double.infinity,
                                shape: const StadiumBorder(),
                                color: ColorsManager.primary,
                                onPressed: () {
                                  if(_formKey.currentState!.validate())
                                  {
                                  //  Navigator.pop(context);
                                  //  AuthCubit.get(context).submitPhoneNumber(
                                  //         phoneNumberController.text.trim());
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) =>
                                        NewLayout()), (route) => false);
                                  }
                                },
                                child:   Text("${'next'.tr(context)}",
                                    style:const TextStyle(
                                      inherit: false,
                                      color:Colors.black,
                                      fontSize:20.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

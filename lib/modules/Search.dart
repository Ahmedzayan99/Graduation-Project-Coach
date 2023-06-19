import 'package:blackgymcoach/modules/gym.dart';
import 'package:blackgymcoach/modules/profileUser.dart';
import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/styles/colors_manager.dart';
import 'package:blackgymcoach/shared/styles/iconly_broken.dart';
import 'package:blackgymcoach/shared/widgets/custom_defaultSlider.dart';
import 'package:blackgymcoach/shared/widgets/custom_text_form_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
        listener: (context, state) {},
    builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
        /*  title: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewLayout()));
          }, icon: Icon(IconlyBroken.back)),*/

        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(

                obscureText: false,
             /*   validator: (value) {
                  return validator!(value);
                },*/
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
              ),
              SizedBox(height: 20.0),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                     return buildSearchItem(context);
                  },
                  separatorBuilder: (context, index) {
                     return   SizedBox(height: 20.0);
                  },
                  itemCount: 1),
            ],
          ),
        ),
      );
        }
    );

  }
}
Widget buildSearchItem(/*Map model*/context) =>  InkWell( onTap:  () {
  GymCubit.get(context).getUserData().then((value){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileUserScreen(),));
  });
},
  child: Row(
    children: [
      CircleAvatar(
        radius: 25.0,
        backgroundImage: NetworkImage(
            'https://s3-alpha-sig.figma.com/img/7b6b/e8ea/bc44a35686a99e0b929ebc1de2eff7e9?Expires=1687737600&Signature=Mzkig0d7EKXiOXGf1TXAwz9bLEf6OWFHaQElSFZJfSa958FK4AvJnVL1Flg0FS1dEgMYbxUgV42Qh6dCPKWDeiyBbxDvrhOkMBhmRLrcOQgzYxXmI8W8lAS4JaIupJt~XF5nmOz44zIRT3YfMMGmIWDaLF2LDmUsKbBS~xEY0heP7~5uELL8PapsO~pcomTNcHJF5ismD15DJwwg9ZywK01cqfh5LdsCUCAFZ3RlOcfuC4wAeQllrIIy4lC2LXY6FQyZ3qDZ21vBfkuJtThIhDaum~3BffRJOZlDAXwZguyB9YWEC8i43z8nhYOwgbqWEKp0NHOT4zeiIezNsZ5ZwQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zizo',
              style: TextStyle(
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
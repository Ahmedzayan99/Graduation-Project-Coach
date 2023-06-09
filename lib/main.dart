import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blackgymcoach/modules/gym.dart';
import 'package:blackgymcoach/modules/login_register/cubit/authentication_cubit.dart';
import 'package:blackgymcoach/modules/login_register/login/login.dart';
import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/bloc_observer.dart';
import 'package:blackgymcoach/shared/global/app_localization/app_localization.dart';
import 'package:blackgymcoach/shared/network/local/cache_helper.dart';
import 'package:blackgymcoach/shared/network/remote/dio_helper.dart';
import 'package:blackgymcoach/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/styles/colors_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  var token = CacheHelper.getDataIntoShPre(key:'token');
  late Widget widget;
  if (token != null) {
    print(token);
      widget = AnimatedSplashScreen(
        splashIconSize: 300,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: ColorsManager.black,
        nextScreen:  NewLayout(),
        splash: 'assets/images/Logo.png',
      );
      } else {
    widget = AnimatedSplashScreen(
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: ColorsManager.black,
      splash: 'assets/images/Logo.png',
      nextScreen:  LoginScreen(),
    );
  }


  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
final Widget? startWidget;
const MyApp({Key? key,
required this.startWidget,
}) : super(key: key);
@override
Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create:(context) => GymCubit()..changeLanguage(languageCode: "en")),
      BlocProvider(create:(context) => AuthCubit()),
     //..createDatabase()),

    ],
    child: BlocConsumer<GymCubit,GymStates>(
      listener: (context, state) {},
      builder:(context, state) {
        return MaterialApp(
          locale: GymCubit.get(context).lang =="en" ? const Locale("en"):const Locale("en"),
          supportedLocales: const [
            Locale("en"),
            Locale("ar"),
          ],
          localizationsDelegates: const [
            AppLocalization.delegate,
           /// GlobalMaterialLocalizations.delegate,
          ///  GlobalWidgetsLocalizations.delegate,
          ///  GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (currentLang, supportLang) {

            for (Locale locale in supportLang) {
              if (currentLang != null && locale.languageCode == currentLang.languageCode) {
                return currentLang;
              }
            }
            return supportLang.first;
          },

          debugShowCheckedModeBanner: false,
          home: startWidget,
          //startWidget ,
          theme: getAppThemeData(),
        );
      },
    ),
  );
}
}

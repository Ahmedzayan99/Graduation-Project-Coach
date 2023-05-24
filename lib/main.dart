import 'package:blackgymcoach/modules/changeLanuage.dart';
import 'package:blackgymcoach/modules/login_register/cubit/authentication_cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/cubit.dart';
import 'package:blackgymcoach/shared/app_cubit/states.dart';
import 'package:blackgymcoach/shared/bloc_observer.dart';
import 'package:blackgymcoach/shared/global/app_localization/app_localization.dart';
import 'package:blackgymcoach/shared/network/constants.dart';
import 'package:blackgymcoach/shared/network/local/cache_helper.dart';
import 'package:blackgymcoach/shared/network/remote/dio_helper.dart';
import 'package:blackgymcoach/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // bool? onBoarding = CacheHelper.getDataIntoShPre(key: 'Onboarding');
  // uId = CacheHelper.getDataIntoShPre(key: 'uId');
  var lang = CacheHelper.getDataIntoShPre(key: 'Lang');

  if (lang != null) {
    lang = lang;
  } else {
    lang = 'en';
  }
  late Widget widget;
  if (uId != null) {
    widget = const ChangeLanguageScreen();
  } else {
    widget =  const ChangeLanguageScreen();

  }

  //FirebaseAuth.instance.authStateChanges().listen((user) {
  //if (user == null) {
  //    initialRoute = loginScreen;
  //   } else {
  //   initialRoute = newLayout;
  //  }
  //});



  runApp(MyApp(
    //appRouter: AppRouter()
    startWidget: widget,
    lang: lang,
  ));
}

class MyApp extends StatelessWidget {
//  final AppRouter appRouter;
final Widget? startWidget;
final String lang;
const MyApp({Key? key,
required this.startWidget,
required this.lang
}) : super(key: key);
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create:(context) => GymCubit()..changeLanguage(languageCode: lang)),
      BlocProvider(create:(context) => AuthCubit()),
     //..createDatabase()),

    ],
    child: BlocConsumer<GymCubit,GymStates>(
      listener: (context, state) {},
      builder:(context, state) {
        return MaterialApp(
          locale: GymCubit.get(context).lang =="en" ? const Locale("en"):const Locale("ar"),
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

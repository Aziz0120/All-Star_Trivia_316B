import 'package:all_star_trivia_316_b/core/trivia_btm.dart';
import 'package:all_star_trivia_316_b/core/trivia_onb.dart';
import 'package:all_star_trivia_316_b/goals/achiv/logic/achiv_hive_model.dart';
import 'package:all_star_trivia_316_b/goals/logic/goals_hive_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AchivHiveModelAdapter());
  Hive.registerAdapter(GoalsHiveModelAdapter());

  ////////////////
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstCheck = prefs.getBool('asdafhtrtjyjtyj') ?? true;
  Widget homePage = firstCheck
      ? const TriviaOnbScreen()
      : const TriviaDownBar(
          indexScr: 0,
        );

  if (firstCheck) {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final InAppReview inAppReview = InAppReview.instance;

      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      }
    } catch (e) {
      throw Exception(e);
    }
    await prefs.setBool('asdafhtrtjyjtyj', false);
  }

  runApp(MyApp(homeScreen: homePage));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.homeScreen});
  final Widget homeScreen;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'All-Star-Trivia',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'SFProDisplay',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          cupertinoOverrideTheme: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              pickerTextStyle: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 23,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        home: homeScreen,
      ),
    );
  }
}

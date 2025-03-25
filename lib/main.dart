import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

import 'constants/sizes.dart';

void main() async {
  //app실행전에 Widget이 engine과 연결된것을보장시킨다.
  WidgetsFlutterBinding.ensureInitialized();

  //지원할 회전방향
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ko"),
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFFE9435A),
        brightness: Brightness.light,
        textTheme: Typography.blackMountainView,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          surfaceTintColor: Colors.grey.shade50,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        //클릭시 효과 제거
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Color(0xFFE9435A),
        brightness: Brightness.dark,
        textTheme: Typography.whiteMountainView,
        bottomAppBarTheme: BottomAppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.white,
        ),
      ),
      home: MainNavigationScreen(),
    );
  }
}

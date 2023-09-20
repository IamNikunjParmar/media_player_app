

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_media_player_apps/Controllers/audio_controller.dart';
import 'package:untitled_media_player_apps/Controllers/my_tab_controller.dart';
import 'package:untitled_media_player_apps/Controllers/theme_controller.dart';
import 'package:untitled_media_player_apps/Controllers/video_controller.dart';
import 'package:untitled_media_player_apps/utils/route_utils.dart';
import 'package:untitled_media_player_apps/views/screens/audio_page.dart';
import 'package:untitled_media_player_apps/views/screens/home_page.dart';
import 'package:untitled_media_player_apps/views/screens/setting_page.dart';

void main(){
runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>MyTabController(),
    ),
    ChangeNotifierProvider(create: (context)=>ThemeController(),),

    ChangeNotifierProvider(create: (context)=>AudioController(),),

    ChangeNotifierProvider(create: (context)=>VideoController(),),

  ],
    child: MyApp(),
  ),
);


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.home:(context)=> const HomePage(),
        MyRoutes.settingPage:(context)=> const SettingPage(),
        MyRoutes.AudioPage:(context)=> const AudioPage(),
      },
      themeMode:  Provider.of<ThemeController>(context).isDark? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
       brightness: Brightness.dark,
      ),
    );
  }
}

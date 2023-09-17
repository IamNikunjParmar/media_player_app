


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_media_player_apps/Controllers/my_tab_controller.dart';
import 'package:untitled_media_player_apps/views/screens/home_page.dart';

void main(){
runApp(

    ChangeNotifierProvider(create: (context)=>MyTabController(),
      child: MyApp(),
    )
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
      home: const HomePage(),
    );
  }
}

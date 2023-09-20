

import 'package:flutter/material.dart';
import 'package:untitled_media_player_apps/views/screens/audio_page.dart';
import 'package:untitled_media_player_apps/views/screens/for_you.dart';
import 'package:untitled_media_player_apps/views/screens/home_page.dart';
import 'package:untitled_media_player_apps/views/screens/video_page.dart';

class MyTabController extends ChangeNotifier{

  static TabController? tabController;


  PageController pageController = PageController();


  pagecontroller({required int index}){

    pageController.animateToPage(
        index,
        duration: Duration(
      microseconds: 600,
        ),
        curve: Curves.easeInOut
    );
    notifyListeners();
  }

  List tabs = ["Home","Audio","video"];

  List<Widget>tabPages = [HomePages(),AudioPage(),VideoPage()];

  get tabIndex{

    tabController?.index ?? 0 ;
  }




}
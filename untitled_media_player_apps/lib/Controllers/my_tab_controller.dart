

import 'package:flutter/material.dart';

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

  List tabs = ["Chats","Status","Calls","Profile"];

  get tabIndex{

    tabController?.index ?? 0 ;
  }




}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_media_player_apps/utils/route_utils.dart';

import '../../Controllers/my_tab_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {


  @override
  void initState() {
    MyTabController.tabController = TabController(
        length: 4,vsync:this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTabController>(
      builder: (context,pro,_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:  Color(0xffA5D7E8),
            title: Text("Media Player",
              style: TextStyle(
                  color: Colors.white),
            ),
            actions: [
              IconButton(onPressed: () {

                Navigator.of(context).pushNamed(MyRoutes.settingPage);

              }, icon: Icon(
                  Icons.settings),
                iconSize: 34,
                color: Color(0xff0B2447),
              ),
            ],
            flexibleSpace: Stack(
              children: [
                Container(
                  height: 140,
                  width: 420,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                   color: Color(0xff0B2447),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(480,200),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(
                          3,3
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            toolbarHeight: 140,
            bottom: TabBar(
              controller: MyTabController.tabController,
              onTap: (index) {
                pro.pagecontroller(index: index);
              },
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                splashFactory: NoSplash.splashFactory,
                indicatorPadding: EdgeInsets.all(3),
                indicator: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff0B2447),
                  width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              tabs:
              pro.tabs
                .map((e) => Tab(
                child: Text(
                  e,
                style: TextStyle(
                  color:pro.tabIndex == 0 ? Colors.grey : Color(0xff0B2447),
                  fontSize: 16,

                ),
                ),
              )
              ).toList()
            ),
           ),
          body: PageView(
            controller: pro.pageController,
            children: List.generate(
                4, (index) =>
                        Container(
              child: Text(
                "1234"[index ],
              ),
                          alignment: Alignment.center,
            ),
            ),
          ),

        );
      }
    );
  }
}

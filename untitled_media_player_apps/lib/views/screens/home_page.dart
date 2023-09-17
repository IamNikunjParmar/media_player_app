

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        length: 8,vsync:this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTabController>(
      builder: (context,pro,_) {
        return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: MyTabController.tabController,
              onTap: (index) {
                pro.pagecontroller(index: index);
              },

                isScrollable: true,
                indicatorPadding: EdgeInsets.all(3),
                indicator: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
              tabs:
              pro.tabs
                .map((e) => Tab(
                child: Text(
                  e,
                style: TextStyle(
                  color:pro.tabIndex == 0 ? Colors.grey : Colors.indigo,
                ),
                ),
              )
              ).toList()
            ),
           ),

          body: PageView(
            controller: pro.pageController,
            children: List.generate(
                8,
                    (index) =>
                        Container(
              color: Colors.primaries[index],
            )),
          ),

        );
      }
    );
  }
}

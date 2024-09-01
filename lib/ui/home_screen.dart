import 'package:flutter/material.dart';
import 'package:task_kalpas/ui/news%20feed/favorite_news.dart';

import 'news feed/newsfeed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          toolbarHeight: 10,
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            indicator: BoxDecoration(
                color: Color(0xffEEF3FD),
                borderRadius: BorderRadius.circular(12)),
            tabs: [
              Tab(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.list),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "News",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Color(0xffFA6464),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("favorite",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [NewfeedScreen(), FavoriteNewsScreen()],
        ),
      ),
    );
  }
}

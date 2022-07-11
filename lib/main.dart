// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import './pages/article_page.dart';
import './pages/home_page.dart';
import './pages/profile_page.dart';
import './pages/test_page.dart';
import 'routes.dart'

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = [HomePage(), ArticlePage(), TestPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              selectedItemColor: Colors.pink,
              unselectedItemColor: Colors.grey,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories_outlined),
                  label: 'Articles',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_turned_in_outlined),
                  label: 'Tests',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]),
        )
    
           home: HomePage(),

      //Routes
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
       MyRoutes.loginRoute:(context)=>LoginPage(),
      MyRoutes.articleRoute:(context)=>ArticlePage(),
         MyRoutes.profileRoute:(context)=>ProfilePage(), 
          MyRoutes.testRoute:(context)=>TestPage(),
        
      },);
  }
}

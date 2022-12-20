import 'package:flutter/material.dart';
import 'package:flutter_drawer_example/map/test_map.dart';
import 'package:flutter_drawer_example/nutrition_app/nutrition.dart';
import 'package:flutter_drawer_example/chat_with_ai.dart';
import 'package:flutter_drawer_example/privacy_policy.dart';
import 'package:flutter_drawer_example/shop/shop.dart';
import 'package:flutter_drawer_example/todo_app/todo_app.dart';
import 'package:flutter_drawer_example/live_workout/workout_app.dart';
import 'my_drawer_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.todoApp;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.todoApp) {
      container = TodoApp();
    } else if (currentPage == DrawerSections.chat) {
      container = ChatFeature();
    } else if (currentPage == DrawerSections.nutrition) {
      container = NutritionApp();
    } else if (currentPage == DrawerSections.shop) {
      container = Shop();
    } else if (currentPage == DrawerSections.treadmill) {
      container = FitnessWorkoutApp();
    } else if (currentPage == DrawerSections.map) {
      container = Map();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("HealthMate 🏥"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Todo List", Icons.list_alt_rounded,
              currentPage == DrawerSections.todoApp ? true : false),
          menuItem(2, "Chat With AI", Icons.chat,
              currentPage == DrawerSections.chat ? true : false),
          menuItem(3, "Nutrition", Icons.food_bank,
              currentPage == DrawerSections.nutrition ? true : false),
          Divider(),
          menuItem(4, "Shop 👑", Icons.shop,
              currentPage == DrawerSections.shop ? true : false),
          menuItem(5, "Live Workout 👑", Icons.people_alt_outlined,
              currentPage == DrawerSections.treadmill ? true : false),
          Divider(),
          menuItem(6, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(7, "Map Feature", Icons.map_outlined,
              currentPage == DrawerSections.map ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.todoApp;
            } else if (id == 2) {
              currentPage = DrawerSections.chat;
            } else if (id == 3) {
              currentPage = DrawerSections.nutrition;
            } else if (id == 4) {
              currentPage = DrawerSections.shop;
            } else if (id == 5) {
              currentPage = DrawerSections.treadmill;
            } else if (id == 6) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 7) {
              currentPage = DrawerSections.map;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  todoApp,
  chat,
  nutrition,
  shop,
  treadmill,
  privacy_policy,
  map,
}

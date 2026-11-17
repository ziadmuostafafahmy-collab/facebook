import 'package:flutter/material.dart';
import 'buildPosts.dart';
import 'screen_colors.dart';
import 'buildStories.dart';
import 'placeholder_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Widget buildWhatsOnYourMind() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/cr7.jpg"),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What's in Your Mind?",
                hintStyle: TextStyle(color: ScreenColors.grayColor, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.photo_library, color: Colors.green),
        ],
      ),
    );
  }

  int currentIndex = 0;
  final List<PostModel> posts = [
    PostModel(
      userName: 'Route',
      userImage: 'assets/images/routePost.jpg',
      time: '8h',
      postImage: 'assets/images/route.jpg',
    ),
    PostModel(
      userName: 'Cristiano',
      userImage: 'assets/images/cr7.jpg',
      time: '10h',
      postImage: 'assets/images/goat.jpg',
    ),
    PostModel(
      userName: 'Abdo Elbalf',
      userImage: 'assets/images/model1.jpg',
      time: '1d',
      postImage: 'assets/images/Cr7Post.jpg',
    ),
  ];

  final List<String> titles = const [
    'Home',
    'Video',
    'Marketplace',
    'Profile',
    'Notifications',
    'Menu',
  ];

  Widget buildBody() {
    if (currentIndex == 0) {
      return ListView(
        children: [
          buildWhatsOnYourMind(),
          Divider(height: 1),
          Stories(),
          Divider(height: 1),
          for (final post in posts) PostItem(post: post),
        ],
      );
    }
    return PlaceholderPage(title: titles[currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ScreenColors.whitColor,
        elevation: 0,
        title: Text(
          "Facebook",
          style: TextStyle(
            color: ScreenColors.lightBlueColor,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle, color : ScreenColors.blackColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: ScreenColors.blackColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/mess.jpg", width: 28, height: 28),
          ),
        ],
      ),
      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor:ScreenColors.whitColor,
        selectedItemColor: ScreenColors.lightBlueColor,
        unselectedItemColor:ScreenColors.grayColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Marketplace'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(
            icon: CircleAvatar(radius: 14,
              backgroundImage: AssetImage("assets/images/cr7.jpg"),
            ),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
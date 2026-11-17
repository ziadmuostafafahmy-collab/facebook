import 'package:facebook/screen_colors.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  static  String profileImage = 'assets/images/Ronaldo.jpg';

  static  List<String> storyImages = [
    'assets/images/goat.jpg',
    'assets/images/Ronaldo.jpg',
    'assets/images/cr7.jpg',
    'assets/images/image3.jpg',
    'assets/images/ron.jpg',
    'assets/images/goat.jpg',
  ];

  static  List<String> avatarImages = [
    'assets/images/ron.jpg',
    'assets/images/model1.jpg',
    'assets/images/goat.jpg',
    'assets/images/model3.jpg',
    'assets/images/Ronaldo.jpg',
    'assets/images/ron.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.all(10),
        itemCount: storyImages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return createStoryCard();
          return storyCard(storyImages[index - 1],
              avatarImages[index - 1]);
        },
      ),
    );
  }

  Widget createStoryCard() {
    return Container(
      width: 105,
      margin:  EdgeInsets.only(right: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ScreenColors.grayColor),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              profileImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -18,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor:ScreenColors.whitColor,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: ScreenColors.lightBlueColor,
                      child:  Icon(Icons.add,
                          color: ScreenColors.whitColor, size: 20),
                    ),
                  ),
                ),
                 Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Create a Story',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),),
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget storyCard(String image, String avatar) {
    return Container(
      width: 105,
      margin:  EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding:  EdgeInsets.all(8),
          child: Container(
            padding:  EdgeInsets.all(2),
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: ScreenColors.lightBlueColor
            ),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(avatar),
            ),
          ),
        ),
      ),
    );
  }
}
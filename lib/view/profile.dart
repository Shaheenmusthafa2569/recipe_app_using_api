import 'package:flutter/material.dart';
import 'package:recipe_app_using_api/theme/appcolors.dart';

class Myprofilepage extends StatelessWidget {
  const Myprofilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: AppColors.accentGold,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 340,
              height: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ],
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name : Gordan", style: TextStyle(fontSize: 25)),
                  Text("Recipes made : 22", style: TextStyle(fontSize: 25)),
                  Text("Recipes cooked : 12", style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            start: 90,
            top: 30,
            child: CircleAvatar(
              maxRadius: 100,
              backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/9/96/Gordon_Ramsay_%28cropped%29.jpg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

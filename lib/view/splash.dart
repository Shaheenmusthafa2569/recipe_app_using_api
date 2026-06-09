import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app_using_api/theme/appcolors.dart';
import 'package:recipe_app_using_api/view/home.dart';

class Mysplashscreen extends StatefulWidget {
  const Mysplashscreen({super.key});

  @override
  State<Mysplashscreen> createState() => _MysplashscreenState();
}

class _MysplashscreenState extends State<Mysplashscreen> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isVisible = true;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Myhome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentGold,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              "Recipe Oasis",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
                fontSize: 30,
              ),
            ),

            // Lottie.asset("assets/foodie-recolored.lottie", height: 200),
            SizedBox(height: 15),
            AnimatedOpacity(
              opacity: isVisible ? 1 : 0,
              duration: Duration(seconds: 2),
              child: Text(
                "Your kitchen companion.",
                style: GoogleFonts.inter(
                 letterSpacing: 2
                  ,fontSize: 20,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

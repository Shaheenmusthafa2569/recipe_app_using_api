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

          /// TOP HEADER
          Container(
            height: 360,
            decoration: const BoxDecoration(
              color: AppColors.accentGold,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),

          /// PROFILE CONTENT
          SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 70),

                /// PROFILE IMAGE
                CircleAvatar(
                  radius: 70,
                  backgroundColor: AppColors.surface,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: const NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/9/96/Gordon_Ramsay_%28cropped%29.jpg",
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// NAME
                const Text(
                  "Gordon Ramsay",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Master Chef",
                  style: TextStyle(
                    color: AppColors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                /// MAIN CARD
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(25),

                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(30),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 3,
                        offset: const Offset(0, 10),
                        color: Colors.black.withOpacity(0.12),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_outline),
                          SizedBox(width: 8),

                          Text(
                            "Profile Overview",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),

                      const SizedBox(height: 25),

                      /// STATS
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,

                        children: [

                          _buildStatCard(
                            icon: Icons.restaurant_menu,
                            title: "Recipes",
                            value: "22",
                          ),

                          _buildStatCard(
                            icon: Icons.local_fire_department,
                            title: "Cooked",
                            value: "12",
                          ),

                          _buildStatCard(
                            icon: Icons.favorite,
                            title: "Likes",
                            value: "89",
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.accentGold,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                          ),

                          onPressed: () {},

                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// STAT CARD
  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: 85,
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),

      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: AppColors.accentGold,
            size: 30,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
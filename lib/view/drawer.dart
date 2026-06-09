import 'package:flutter/material.dart';
import 'package:recipe_app_using_api/theme/appcolors.dart';
import 'package:recipe_app_using_api/view/profile.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback onRecipesTap;

  const MyDrawer({super.key, required this.onRecipesTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,

      child: Column(
        children: [
          /// TOP HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30),

            decoration: const BoxDecoration(
              color: AppColors.accentGold,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: Column(
              children: [
                /// PROFILE IMAGE
                const CircleAvatar(
                  radius: 45,

                  backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/9/96/Gordon_Ramsay_%28cropped%29.jpg",
                  ),
                ),

                const SizedBox(height: 15),

                /// NAME
                const Text(
                  "Gordon Ramsay",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                Text(
                  "Master Chef",
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// DRAWER ITEMS
          _drawerTile(icon: Icons.home, title: "Home", onTap: () {}),

          _drawerTile(
            icon: Icons.person,
            title: "Profile",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Myprofilepage()),
              );
            },
          ),

          _drawerTile(icon: Icons.favorite, title: "Favorites", onTap: () {}),

          _drawerTile(
            icon: Icons.restaurant_menu,
            title: "Recipes",
            onTap: onRecipesTap,
          ),

          _drawerTile(icon: Icons.settings, title: "Settings", onTap: () {}),

          const Spacer(),

          /// LOGOUT
          Padding(
            padding: const EdgeInsets.all(20),

            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              tileColor: Colors.red.shade50,

              leading: const Icon(Icons.logout, color: Colors.red),

              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  /// DRAWER TILE
  Widget _drawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),

      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        leading: Icon(icon, color: AppColors.accentGold),

        title: Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

        onTap: onTap,
      ),
    );
  }
}

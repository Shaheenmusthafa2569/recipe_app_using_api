import 'package:flutter/material.dart';
import 'package:recipe_app_using_api/model/model.dart';
import 'package:recipe_app_using_api/theme/appcolors.dart';

class MyRecipeDetails extends StatelessWidget {
  final RecipeModel recipe;

  const MyRecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // IMAGE APPBAR
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            pinned: true,

            backgroundColor: Colors.black,

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,

                children: [
                  Image.network(recipe.image, fit: BoxFit.cover),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,

                        colors: [
                          Colors.black.withOpacity(.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              title: Text(
                recipe.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // DETAILS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // INFO ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      infoCard(Icons.timer, "${recipe.prepTimeMinutes} mins"),

                      infoCard(Icons.restaurant, recipe.difficulty),

                      infoCard(Icons.star, recipe.rating.toString()),
                    ],
                  ),

                  SizedBox(height: 25),

                  // CUISINE
                  Text(
                    "Cuisine",

                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  Text(recipe.cuisine, style: TextStyle(fontSize: 16)),

                  SizedBox(height: 25),

                  // INGREDIENTS
                  Text(
                    "Ingredients",

                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 15),

                  ...recipe.ingredients.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),

                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.orange,
                            size: 20,
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              ingredient,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // INSTRUCTIONS
                  Text(
                    "Instructions",

                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 15),

                  ...recipe.instructions.asMap().entries.map((entry) {
                    int index = entry.key;
                    String instruction = entry.value;

                    return Container(
                      margin: EdgeInsets.only(bottom: 15),

                      padding: EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          CircleAvatar(
                            radius: 14,

                            backgroundColor: Colors.orange,

                            child: Text(
                              "${index + 1}",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              instruction,

                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),

      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          Icon(icon, color: Colors.orange),

          SizedBox(height: 5),

          Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

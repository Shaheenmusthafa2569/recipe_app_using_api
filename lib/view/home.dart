import 'package:flutter/material.dart';
import 'package:recipe_app_using_api/model/model.dart';
import 'package:recipe_app_using_api/service/service.dart';
import 'package:recipe_app_using_api/theme/appcolors.dart';
import 'package:recipe_app_using_api/view/details.dart';
import 'package:recipe_app_using_api/view/profile.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  List<RecipeModel> recipes = [];
  final ApiService api = ApiService();
  bool isLoading = true;

  Future<void> fetchRecipe() async {
    recipes = await api.getRecipe();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textDark,

      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.accentGold),
            )
          : SafeArea(
              child: Column(
                children: [
                  // HEADER
                  Padding(
                    padding: const EdgeInsets.all(20),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Icon(Icons.menu, color: Colors.white),

                        Text(
                          "Recipe Oasis",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Myprofilepage(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,

                            child: Icon(
                              Icons.person,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // WHITE SECTION
                  Expanded(
                    child: Container(
                      width: double.infinity,

                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),

                      child: ListView(
                        children: [
                          // SEARCH
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),

                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search recipes...",

                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.orange,
                                ),

                                suffixIcon: Icon(
                                  Icons.tune,
                                  color: Colors.orange,
                                ),

                                border: InputBorder.none,

                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          Text(
                            "Popular Recipes",

                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          // RECIPES
                          SizedBox(
                            height: 300,

                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,

                              itemCount: 4,

                              itemBuilder: (context, index) {
                                final recipe = recipes[index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyRecipeDetails(recipe: recipe),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 320,

                                    margin: EdgeInsets.only(right: 8),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(.15),
                                          blurRadius: 15,
                                          offset: Offset(0, 8),
                                        ),
                                      ],

                                      image: DecorationImage(
                                        image: NetworkImage(recipe.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    child: Stack(
                                      children: [
                                        // DARK GRADIENT
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),

                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,

                                              colors: [
                                                Colors.black.withOpacity(.75),
                                                Colors.black.withOpacity(.2),
                                                Colors.transparent,
                                              ],
                                            ),
                                          ),
                                        ),

                                        // RATING BADGE
                                        Positioned(
                                          top: 15,
                                          right: 15,

                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),

                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),

                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),

                                                SizedBox(width: 5),

                                                Text(
                                                  recipe.rating.toString(),

                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // TEXT CONTENT
                                        Positioned(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,

                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,

                                            children: [
                                              Text(
                                                recipe.name,

                                                maxLines: 2,

                                                overflow: TextOverflow.ellipsis,

                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              SizedBox(height: 8),

                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.timer,
                                                    color: Colors.white70,
                                                    size: 18,
                                                  ),

                                                  SizedBox(width: 5),

                                                  Text(
                                                    "${recipe.prepTimeMinutes} mins",

                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                    ),
                                                  ),

                                                  SizedBox(width: 15),

                                                  Icon(
                                                    Icons.restaurant,
                                                    color: Colors.white70,
                                                    size: 18,
                                                  ),

                                                  SizedBox(width: 5),

                                                  Text(
                                                    recipe.difficulty,

                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Recipes",

                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: recipes.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyRecipeDetails(
                                        recipe: recipes[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 15),

                                  padding: EdgeInsets.all(10),

                                  decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.circular(20),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.05),
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),

                                          image: DecorationImage(
                                            fit: BoxFit.cover,

                                            image: NetworkImage(
                                              recipes[index].image,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 5,
                                              ),

                                              decoration: BoxDecoration(
                                                color: AppColors.accentGold
                                                    .withOpacity(0.22),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius: 2,
                                                    color: AppColors.accentGold,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),

                                              child: Text(
                                                recipes[index].difficulty,

                                                style: TextStyle(
                                                  color: AppColors.accentGold,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              recipes[index].name,

                                              maxLines: 2,

                                              overflow: TextOverflow.ellipsis,

                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            SizedBox(height: 10),

                                            Text(
                                              recipes[index].cuisine,

                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Column(
                                        children: [
                                          Text(
                                            "${recipes[index].prepTimeMinutes} mins",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

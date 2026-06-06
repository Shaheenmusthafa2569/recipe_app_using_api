class RecipeModel {
  int? id;
  String name;
  List ingredients;
  List instructions;
  double prepTimeMinutes;
  double cookTimeMinutes;
  String difficulty;
  int servings;
  String cuisine;
  String image;
  List mealType;
  double rating;

  RecipeModel({
    this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.difficulty,
    required this.servings,
    required this.image,
    required this.cuisine,
    required this.mealType,
    required this.rating,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['name'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      prepTimeMinutes: (json['prepTimeMinutes']).toDouble(),
      cookTimeMinutes: (json['cookTimeMinutes']).toDouble(),
      difficulty: json['difficulty'],
      servings: json['servings'],
      image: json['image'],
      cuisine: json['cuisine'],
      mealType: json['mealType'],
      rating: (json['rating']).toDouble(),
    );
  }
}

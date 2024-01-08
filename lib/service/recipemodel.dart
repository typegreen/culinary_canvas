class recipeModel{
  final String ID;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String image;
  final String URL;
  final List ingredients;
  recipeModel(this.ID,this.name, this.category, this.area,this.instructions,
      this.image,this.URL,this.ingredients);

  recipeModel.fromJson(Map<String, dynamic> json)
  : ID = json['meals'][0]['idMeal'],
    name = json['meals'][0]['strMeal'],
  category = json['meals'][0]['strCategory'],
  area = json['meals'][0]['strArea'],
  instructions = json['meals'][0]['strInstructions'],
  image = json['meals'][0]['strMealThumb'],
  URL = json['meals'][0]['strSource'],
  ingredients = List.generate(20, (index) => Ingredients(json['meals'][0]['strIngredient${index+1}'], json['meals'][0]['strMeasure${index+1}']));
}


class Ingredients{
  final String name;
  final String measure;
  Ingredients(this.name,this.measure);

}
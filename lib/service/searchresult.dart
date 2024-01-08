import 'package:http/http.dart';


class SResult{
  String data = '';

  Future<String> getRecipe() async{
    Uri url = Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php');
    Response response = await get(url);

    data = response.body;
    if(response.statusCode == 200){
      return data;
    } else{
      return 'Failed to return data';
    }

  }
  
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:culinary_canvas/service/searchresult.dart';
import 'package:culinary_canvas/screen/result_screen.dart';

class Search extends StatefulWidget{
  Search({super.key});

  @override
  State<Search> createState() => _SearchScreen();
}

class _SearchScreen extends State<Search>{
  String recipe= '';
  SResult search = new SResult();
  
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(38.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/homeback2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints:  const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                           child: const Text(
                            "Welcome to Culinary Canvas\n",
                            textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontSize: 25.0,
                                 fontFamily: 'Study-Alone'
                             ),
                          ),
                        ),
                        Text(
                          "Find inspiration for your next culinary adventure with our curated recipes.\n"
                              "Discover mouthwatering dishes that cater to various tastes and dietary preferences.\n",
                          textAlign: TextAlign.center,
                          /*style: TextStyle(
                              fontFamily: 'Montserrat'
                          ),*/
                        ),
                        TextButton(
                         onPressed: () async{
                           recipe = await search.getRecipe();
                            print(recipe);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Results(recipe);
                          }));
                            },
                          child: const Text(
                            'Click for a random recipe',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Study-Alone'
                            ),
                          )
                        ),
                      ],
                    ),
                  ],
          ),
        ),
      )
    );
  }
}
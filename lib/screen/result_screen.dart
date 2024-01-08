import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:culinary_canvas/service/searchresult.dart';
import 'package:culinary_canvas/screen/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Results extends StatefulWidget{
  Results(this.data, {super.key});
  String data;

  @override
  State<Results> createState()=> _ResultsScreen();
}

class _ResultsScreen extends State<Results>{
  var recipe = '';
  int index = 0;
  SResult result = new SResult();
  String ID = '', name = '', category = '', area = '', instructions = '', simage = '', URL = '', iname = '', measure = '';

  @override
  void initState(){
    super.initState();
    recipe = widget.data;
    updateRecipe();
  }

  void updateRecipe(){
    ID = jsonDecode(recipe)['meals'][0]['idMeal'];
    name = jsonDecode(recipe)['meals'][0]['strMeal'];
    category = jsonDecode(recipe)['meals'][0]['strCategory'];
    area = jsonDecode(recipe)['meals'][0]['strArea'];
    instructions = jsonDecode(recipe)['meals'][0]['strInstructions'];
    simage = jsonDecode(recipe)['meals'][0]['strMealThumb'];
    URL = jsonDecode(recipe)['meals'][0]['strSource'];
    iname = jsonDecode(recipe)['meals'][0]['strIngredient${index+1}'];
    measure = jsonDecode(recipe)['meals'][0]['strMeasure${index+1}'];
    final List ingredients = List.generate(20, (index) => (iname, measure));
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:
          Text(name),
      ),
      body: Container(
        decoration: BoxDecoration(),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment:  Alignment(0.8,1.15),
                  children: <Widget>[
                    Image.network(simage,fit: BoxFit.fitWidth),
                    FloatingActionButton(
                      onPressed: () async{
                        await launchUrlString(URL);
                      },
                      child: const Icon(Icons.add_link),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name),
                      Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                              instructions,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ],

      ),
          ),
      ),
      ),
    );
  }
}
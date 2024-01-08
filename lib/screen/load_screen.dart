import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:culinary_canvas/screen/search_screen.dart';

class Loading extends StatefulWidget{
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7),(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Search();
      }));
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/homeback2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          child: SpinKitPouringHourGlassRefined(
          size: 60.0,
          color: Colors.black,
        ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

}
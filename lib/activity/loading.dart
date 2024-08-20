

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project2/worker/worker.dart';



class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  String temp="";
  String hum="";
  String air_speed="";
  String des="";
  String main="";
  String icon="";
  String city="kanpur";

  void startApp(String city)async
  {
    worker ob=worker(location: city);
   await ob.getData();
   temp=ob.temp;
   hum=ob.humidity;
   air_speed=ob.air_speed;
   des=ob.description;
   main=ob.main;
   icon=ob.Icon;

   Future.delayed(Duration(seconds: 2),(){
     Navigator.pushReplacementNamed(context,'/home',arguments: {
       "temp_value":temp,
       "hum_value":hum,
       "air_speed_value":air_speed,
       "des_value":des,
       "main_value":main,
       "icon_value":icon,
       "city_value":city,

   });

   });

   }





  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset:false;
String search="";
      // search=ModalRoute.of(context)?.settings.arguments as String ;

    // if(search.isNotEmpty ?? false)
    //   {
    //     city=search;
    //   }
    if(ModalRoute.of(context)?.settings.arguments != null)
      {
        city=ModalRoute.of(context)?.settings.arguments as String;
      }

    startApp(city);


    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            SizedBox(height: 65,),
            Image.asset("images/img.png",height: 200,width: 230 ,),
            SizedBox(height: 50,),
            Text("Weather App",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.white),),
        
            SizedBox(height: 50,),
           SpinKitCubeGrid(
            color: Colors.white,
            size: 30.0,
          ),
            SizedBox(height: 250,),
            Text("Made by Ayush Garg",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white)),
            
        ],
            ),
        
        ),
      ),

  backgroundColor: Colors.blue[300],

      );

  }
}

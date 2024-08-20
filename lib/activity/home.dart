
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';


import'dart:convert';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 TextEditingController searchController=new TextEditingController();


  @override
  void initState() {

    super.initState();

    print("THIS is INIT state");
  }
  @override
  void setState(VoidCallback fn) {

    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    var citi=["Kanpur","Delhi","Chennai","Kolkata","Mumbai","Bangalore"];
    final random_ =new Random();
    var cit=citi[random_.nextInt(citi.length)];
    Map info=ModalRoute.of(context)?.settings.arguments as Map;

   String temp=(info['temp_value'].toString()).substring(0,4);
    String air=(info['air_speed_value'].toString()).substring(0,4);
   String icon=info['icon_value'];
   String city=info['city_value'];
   String hum=info['hum_value'];

   String des=info['des_value'];
   String main=info['main_value'];



    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor:Colors.blue[200] ,
        ),
      ),
        body: SingleChildScrollView(
          child: SafeArea(
            child:
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                      [
                        Colors.blueAccent,
                        Colors.blue,
                        Colors.lightBlueAccent,
                        Colors.lightBlue,
                      ]
          
                  )
                ),
                child: Column(
                  children: [
                    Container(
          
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical:20 ),
                      decoration: BoxDecoration(
                        color: Colors.black12,
          
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: ()
                            {
                              if((searchController.text).replaceAll(" ", "")=="")
                                {
                                  print("Blank search");
                                }
                              else
                                {
                              Navigator.pushReplacementNamed(context, "/loading",arguments:
                                searchController.text
          
                            );}
                            },
                              child: Container(child: Icon(Icons.search),margin:EdgeInsets.fromLTRB(4, 0, 7, 0) ,),
          
                          ),
                          Expanded(
                            child:TextField(
                              controller: searchController,
                              decoration:InputDecoration(
                                fillColor: Colors.white30,
                                border: InputBorder.none,
                                hintText: "Search $cit",
          
                              ) ,
          
                              
                            ),
                          )
          
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child:
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.3),
          
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(25),
                          child:
                          Row(
                            children: [
                              Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
          
                              Column(
                                children: [
                                  Text(
                                      "$des",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,color: Colors.white
                                  ),
                                  ),
                                  Text("In $city",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,color: Colors.white))
                                ],
                              )
                            ],
                          ),
                        ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.2),
          
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                            padding: EdgeInsets.all(25),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.thermometer,color:Colors.white,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$temp",style: TextStyle(fontSize: 85,fontWeight: FontWeight.w500,color: Colors.white),),
                                    Text("C",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white),),
                                  ],
                                )
          
                              ],
                            ) ,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.3),
                          
                            ),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            padding: EdgeInsets.all(25),
                            child:Column(
                              children: [
          
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(WeatherIcons.day_windy,color: Colors.white,),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text("$air",style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold ,color: Colors.white),),
                                Text("km/hr",style:TextStyle(color: Colors.white)),
                              ],
                            ) ,
                            height: 180,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.3),
                          
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                            padding: EdgeInsets.all(25),
                            height: 180,
                              child:Column(
                                children: [
          
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(WeatherIcons.humidity,color: Colors.white,),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text("$hum",style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold ,color: Colors.white),),
                                  Text("%",style: TextStyle(color: Colors.white),),
                                ],
                              ) ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80,),
                    Container(
                      padding:EdgeInsets.fromLTRB(0, 80, 0, 0) ,
                      child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Made by Ayush Garg",style: TextStyle(color: Colors.white),),
                            Text("Source:openweather.org",style: TextStyle(color: Colors.white),),
          
                          ],
                        )
                    )
          
          
                  ],
                ),
              )
          ),
        ),


    );
  }
}


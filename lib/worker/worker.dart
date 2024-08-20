import 'package:http/http.dart';
import 'dart:convert';
class worker
{
  String location;
  worker({required this.location})
  {
    location=this.location;
  }

  String temp="";
  String humidity="";
  String air_speed="";
  String description="";
  String main="";
  String Icon="";

  Future<void> getData()async
  {
    try{
      Response response= await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=516ca644cdc8e22d91781ecbd2d91602")) ;
      Map data= jsonDecode(response.body);

      Map temp_data =data['main'];
      double getTemp=temp_data['temp']-273.15;
      String getHumidity=temp_data['humidity'].toString();

      Map wind =data['wind'];
      double getAir_speed=wind["speed"]*18/5;

      List weather_data=data['weather'];
      Map weather_main_data= weather_data[0];

      String getDesc=weather_main_data['description'];
      String getMain_des=weather_main_data['main'];
      String icon=weather_main_data["icon"];

      temp=getTemp.toString();
      humidity=getHumidity;
      air_speed=getAir_speed.toString();
      description=getDesc;
      main=getMain_des;
      Icon=icon;

    }
    catch(e)
    {
      temp="NA   ";
      humidity="NA";
      air_speed="NA   ";
      description="NA";
      main="NA";
      Icon="03n";

    }


  }
}

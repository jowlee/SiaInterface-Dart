library SiaInterface.Response;
import 'dart:convert';

class Response{
  String jsonFormat;
  Response(input){
    jsonFormat = JSON.encode(input);
  }

  bool changeNotify(Map jsonResponse){
    String jsonData = JSON.encode(jsonResponse);

    if(jsonData == this.jsonFormat){
     return true;
    }
    print("this is " + jsonFormat);
    print("next is " + jsonData);
    this.jsonFormat = jsonData; 

    return false;
  }
  
}
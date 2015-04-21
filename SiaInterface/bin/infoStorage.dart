import 'dart:convert';

class inforStroage {

//  String nickName;
//  String destination;
//  String source;
//  String status;
//  String statusCode;
  
  infoStorage(var body /*, [var first, var second]*/){
    Map data = JSON.decode(body);
    String statusCode = data["statusCode"];
    String status = data["status"];
    
//    if(first == "source"){
//      source = data["source"]; 
//    }
//    else if(first == "nickName"){
//      nickName = data["nickName"]; 
//    }
//    
//    if(second == "destination"){
//      destination = data["destination"]; 
//    }
//    else if(first == "nickName"){
//      nickName = data["nickName"]; 
//    }
  }

  
  
}
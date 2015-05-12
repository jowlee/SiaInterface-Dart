library SiaInterface.Response;

class Response{
  String jsonFormat;
  Response(String input){
    jsonFormat = input;
  }

  bool changeNotify(String response){

    if(response == this.jsonFormat){
     return true;
    }
//    if(jsonFormat != null){
//      print("current is " + this.jsonFormat);
//    }
//    else{
//      print("Current is null");
//    }
//    print("next is " + response);
    jsonFormat = response; 

    return false;
  }
  
}
library SiaInterface.Abstract;


class Abstract{
  Map jsonFormat;

  Abstract(this.jsonFormat);
  
  bool changeNotify(Map json){
    if (jsonFormat==json){  
      return true;      
    }
    return false;
  }
}
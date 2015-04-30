library SiaInterface.Abstract;

class Abstract{
  Map jsonFormat;
  int customHashCode;
  Abstract(jsonFormat){
    jsonFormat = jsonFormat;
    customHashCode = getHashCode(jsonFormat);
  }

  bool changeNotify(Map json){
    int current = getHashCode(json);
    int next = this.customHashCode;
    print("Prev      Hash is " + this.customHashCode.toString());
    print("Prev Next Hash is " + current.toString());
    if(next == current){
      return true;
    }
    this.customHashCode = current;
    print("     Hash is " + this.customHashCode.toString());
    print("Next Hash is " + current.toString());

    this.customHashCode = current;
    return false;
  }
  
  void updateHash(int hash){
    this.customHashCode = hash;
  }
  
  // Override hashCode using strategy from Effective Java,
   static int getHashCode(Map jsonFormat){
     if(jsonFormat == null){
       return 0;
     }
     int result = 17;
     
     if(jsonFormat is List){
       return 100000000000000000000000000000000000000;
     }
     
     for(var key in jsonFormat.keys) {
       var value = jsonFormat[key];
       result = 37 * result + value.hashCode;
     }
     
     return result;
   }
}
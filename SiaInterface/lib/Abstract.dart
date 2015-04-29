library SiaInterface.Abstract;


class Abstract{
  Map jsonFormat;
  int hashCode;
  Abstract(this.jsonFormat);
  
  bool changeNotify(Map json){
    int current = json.hashCode;
    int next = this.jsonFormat.hashCode;
    print("Hashcode is " + next.toString());
    print("Next Hashcode is " + next.toString());

    if(next == current){
      return true;
    }
    return false;
  }
  
  // Override hashCode using strategy from Effective Java,
   int get hashCode {
     var values = jsonFormat.values;
     
     int result = 17;
     for (var value in values){
       result = 37 * result + value.hashCode;

     }
     return result;
   }
}
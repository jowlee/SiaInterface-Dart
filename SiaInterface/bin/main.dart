// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;

void parseHost(var requestList) {
  var request = requestList[0].substring(4,requestList[0].length);
  if (request == "announce") {
    // do announce stuff
  }
  else if (request == "config") {
    // do config stuff
  }
}

main(List<String> arguments) {
  if (arguments.length == 0) {
    return 0;
  }
  // first arguement decides where to send it
  // $ dart main.dart host/config parameters
  var request = arguments[0];
  if (request.toLowerCase().substring(0, 4) == "host"){
    parseHost(arguments);
  }
  
}

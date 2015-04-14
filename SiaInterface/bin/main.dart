// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;

void parseHost(var request) {
  if (request.substring(4,12) == "announce") {
    // do announce stuff
  }
  else if (request.substring(4,12) == "config") {
    // do config stuff
  }
}

main(List<String> arguments) {
  if (arguments.length == 1) {
    return 0;
  }
  // one arguement allowed
  // $ dart main.dart host/config
  var request = arguments[0];
  if (arguments[0].toLowerCase().substring(0, 4) == "host"){
    parseHost(arguments[0]);
  }
  
}

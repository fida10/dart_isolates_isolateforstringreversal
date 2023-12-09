/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';
import 'dart:isolate';

export 'src/isolates_isolateforstringreversal_base.dart';

/*
Practice Question 2: Isolate for String Reversal

Task:

Write a function reverseStringInIsolate that takes a string 
and reverses it in a separate isolate. 
The function should return a Future<String> with the reversed string.
 */

Future<dynamic> reverseStringInIsolate(String input) async {
  final receivePort = ReceivePort();
  final completer = Completer();
  final newIsolate = await Isolate.spawn(
    _reverseString,
    [receivePort.sendPort, input]
  );

  receivePort.listen((message) {
    completer.complete(message);
    receivePort.close();
    newIsolate.kill();
   });

   return completer.future;
}

void _reverseString(List<Object> inputs){
  Isolate.exit(inputs[0] as SendPort, (inputs[1] as String).split('').reversed.join(''));
}
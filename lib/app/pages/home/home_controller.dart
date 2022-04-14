import 'package:flutter/material.dart';

// class HomeController {
//   final counter$ = ValueNotifier(0);
//   int get counter => counter$.value;

//   void increment() {
//     counter$.value++;
//   }
// }

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  void increment() => value++;
  void decrement() => value--;
}

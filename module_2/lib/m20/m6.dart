/*
Write a program you have to print the table of given number.*/

import 'dart:io';

void main() {
  print("Write a num you want to print table:");
  var num = int.tryParse(stdin.readLineSync()!) ?? 1;

  for (int i = 1; i <= 10; i++) {
    print("$num * $i = ${num * i}");
  }
}

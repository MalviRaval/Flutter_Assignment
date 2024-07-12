/*
Write a program to find out the max from given number*/
import 'dart:io';

void main() {
  int num, temp = 0, reminder;
  print("Enter the num:");
  num = int.tryParse(stdin.readLineSync()!) ?? 0;

  while (num != 0) {
    reminder = num % 10;
    // print("RE $reminder and temp $temp");
    num = num ~/ 10;
    if (reminder > temp) {
      temp = reminder;
    }
  }
  print("Max num is $temp");
}

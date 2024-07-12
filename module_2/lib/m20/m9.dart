/*
Write a program make a summation of given number*/
import 'dart:io';

void main() {
  int num, reminder, sum = 0;
  print("Enter the num:");
  num = int.tryParse(stdin.readLineSync()!) ?? 0;
  while (num != 0) {
    reminder = num % 10;
    sum = sum + reminder;
    num = num ~/ 10;
  }
  print("sum $sum");
}

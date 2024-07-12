/*
Write a program you have to find the factorial of given number.*/

import 'dart:io';

void main() {
  int fact = 1;
  print("Enter the num:");
  int num = int.tryParse(stdin.readLineSync()!) ?? 0;
  if (num > 0) {
    for (int i = 1; i <= num; i++) {
      fact = fact * num;
    }
    print("factorial of $num is $fact");
  } else {
    if (num == 0) {
      print("factorial of 0 is 0");
    } else {
      print("Please enter correct number");
    }
  }
}

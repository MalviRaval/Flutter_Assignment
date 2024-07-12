//Write a program to find the Max number from the given three number using Ternary Operator

import 'dart:io';

void main() {
  print("Enter the three value");
  print("Enter the value A:");
  int a = int.tryParse(stdin.readLineSync()!) ?? 0;
  print("Enter the value B:");
  int b = int.tryParse(stdin.readLineSync()!) ?? 0;
  print("Enter the value C:");
  int c = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (a > 0 && b > 0 && c > 0) {
    a >= b
        ? a >= c
            ? print("$a is the largest number")
            : print("$c is the largest number")
        : b >= c
            ? print("$b is the largest number")
            : print("$c is the largest number");
  } else {
    print("Please enter non zero and positive value");
  }
}

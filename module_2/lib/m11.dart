//Write a Program to check the given year is leap year or not.

import 'dart:io';

void main() {
  print("Enter value to check leap year or not:");
  int? n = int.tryParse(stdin.readLineSync()!) ?? 0;
  //print(n);

  if (n % 4 == 0) {
    if (n % 100 == 0) {
      if (n % 400 == 0) {
        print("$n is a leap year");
      } else {
        print("$n isn't a leap year");
      }
    } else {
      print("$n is a leap year");
    }
  } else {
    print("$n isn't a leap year");
  }
}

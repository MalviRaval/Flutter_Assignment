//Write a Program to check the given number is prime or not prime.

import 'dart:io';

void main() {
  int flag = 0;
  print("Enter number:");
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (n != 0 && n != 1 && n > 1) {
    for (int i = 2; i < n / 2; i++) {
      if (n % i == 0) {
        flag = 1;
        break;
      }
    }
  } else {
    flag = 1;
  }

  if (flag != 0) {
    print('$n is not prime num');
  } else {
    print('$n is prime num');
  }
}

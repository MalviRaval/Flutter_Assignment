//Write a program to print the number in reverse order.
import 'dart:io';

void main() {
  int num = 123, reversedNumber = 0, remainder;

  print("Enter an integer: ");
  num = int.tryParse(stdin.readLineSync()!) ?? 1234;

  while (num != 0) {
    remainder = num % 10;
    reversedNumber = reversedNumber * 10 + remainder;
    num = num ~/ 10;
  }

  print("Reversed Number  $reversedNumber");
}

/*
Write a Program of Addition, Subtraction ,Multiplication and Division using Switch case.(Must Be Menu Driven)*/
import 'dart:io';

void main() {
  print("1. Addition");
  print("2. Subtraction");
  print("3. Multiplication");
  print("4. Division");
  print("Select your Choice(1-4) : ");
  int m = int.tryParse(stdin.readLineSync()!) ?? 0;

  switch (m) {
    case 1:
      print("Enter the Number 1 :");
      int a = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Enter the Number 2 :");
      int b = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Addition = ${(a + b)}");
      break;

    case 2:
      print("Enter the Number 1 :");
      int a = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Enter the Number 2 :");
      int b = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Subtraction = ${(a - b)}");
      break;

    case 3:
      print("Enter the Number 1 :");
      int a = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Enter the Number 2 :");
      int b = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Multiplication = ${(a * b)}");
      break;

    case 4:
      print("Enter the Number 1 :");
      int a = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Enter the Number 2 :");
      int b = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("Division = ${(a / b)}");
      break;
    default:
      print("Please choose correct number");
  }
}

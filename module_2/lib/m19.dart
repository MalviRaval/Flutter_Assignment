/*
Write a program of to find out the Area of Triangle, Rectangle and Circle using If Condition.(Must Be Menu Driven)*/

import 'dart:io';

void main() {
  print("Input 1 for area of Triangle\n");
  print("Input 2 for area of Rectangle\n");
  print("Input 3 for area of Circle\n");
  print("Input your choice : ");
  int num = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (num == 1) {
    print("Enter the base :");
    int base = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Enter the height :");
    int height = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Area of triangle is ${.5 * base * height}");
  } else if (num == 2) {
    print("Enter the length :");
    int length = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Enter the width :");
    int width = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Area of rectangle is ${length * width}");
  } else if (num == 3) {
    print("Enter the radius :");
    int radius = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Area of circle is ${3.14 * radius * radius}");
  } else {
    print("Please choose correct number");
  }
}

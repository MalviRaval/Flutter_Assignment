//Write a program to find the Area of Triangle
import 'dart:math';

void main(){

  int base=Random().nextInt(50);
  int height=Random().nextInt(50);
  print('''Area of Triangle of base $base & height $height is ${(base*height)/2} ''');

}
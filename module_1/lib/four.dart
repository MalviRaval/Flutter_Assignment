//Write a program to find the Area of Circle
import 'dart:math';

void main(){

  int randNum=Random().nextInt(50);
  print('''Area of circle with radius $randNum is ${3.14*pow(randNum, 2)} ''');

}
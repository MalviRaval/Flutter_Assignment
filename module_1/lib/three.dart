
//Write a program to make a square and cube of number.

import 'dart:math';

void main(){
  int a = Random().nextInt(50);
  print('''$a square of ${pow(a, 2)} & cube is ${pow(a, 3)}''');
}
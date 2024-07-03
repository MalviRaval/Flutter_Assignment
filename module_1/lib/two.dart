//Write a program to make addition, Subtraction, Multiplication and Division of Two Numbers.


import 'dart:math';

void main(){
  var a = Random().nextInt(50);
  var b = Random().nextInt(50);

  print('''Addition of  $a & $b is ${a+b}
  Subtraction of  $a & $b is ${a-b}
  Multiplication of  $a & $b is ${a*b}
  Division of  $a & $b is ${a/b}''');
}
//Write a program to convert temperature from degree centigrade to Fahrenheit.
import 'dart:math';


void main(){

  int centigrade=Random().nextInt(57);

  print('''degree centigrade $centigrade to Fahrenheit  is ${(centigrade * 9/5) + 32}''');

}
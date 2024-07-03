//Write a Program to show swap of two No's without using third variable.
import 'dart:math';

void main(){
  int a=Random().nextInt(50);
  int b=Random().nextInt(50);
  print("Before swap a=$a b=$b");
  a=a+b;
  b=a-b;
  a=a-b;
  print("\nAfter swap a=$a b=$b");
}
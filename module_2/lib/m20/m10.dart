/*
Write a program you have to make a summation of first and last Digit.*/
import 'dart:io';

void main() {
  print("Enter Num:");
  int firstNum = 0, secNum = 0, sum = 0,num=0;
  num = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (num.toString().length > 1) {
    //print("${num.toString().length-1}");
    firstNum = int.tryParse(num.toString()[0])!;          //int.tryParse(num.toString()[num.toString().length])!;
    secNum = int.tryParse(num.toString()[num.toString().length-1])!;
    sum = firstNum + secNum;
  } else {
    sum = num;
  }
  print("Sum of Num $sum");
}

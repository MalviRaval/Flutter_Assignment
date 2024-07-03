//Write a Program to check the given number is Positive, Negative.

import 'dart:io';

void main(){
  print("Enter Num : ");
  int num = int.tryParse(stdin.readLineSync()!) ?? 0;
  if(num >= 0){
    if(num>0){
      print("Num is positive");
    }else{
      print("Num is zero");
    }
  }else{
    print("Num is negative");
  }


}
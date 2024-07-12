// Write a program user enter the 5 subjects mark. You have to make a total and find the percentage. percentage > 75 you have to print “Distinction” percentage > 60 and percentage <= 75 you have to
// print “First class” percentage >50 and percentage <= 60 you have to print “Second class” percentage > 35 and percentage <= 50 you have to print “Pass class” Otherwise print “Fail”
import 'dart:io';

void main(){
  print("Enter five Subject Marks");
  print("M1:");
  int m1 = int.tryParse(stdin.readLineSync()!) ?? 0;
  print("M2:");
  int m2 = int.tryParse(stdin.readLineSync()!) ?? 0;
  print("M3:");
  int m3 = int.tryParse(stdin.readLineSync()!) ?? 0;
  print("M4:");
  int m4 = int.tryParse(stdin.readLineSync()!) ?? 0;
  print("M5:");
  int m5 = int.tryParse(stdin.readLineSync()!) ?? 0;

  var sum=m1+m2+m3+m4+m5;
  print("Total : $sum");
  var percentage=((sum*100)/500).round();
  print("Percentage : $percentage");

  if(percentage>75){
    print("Distinction");
  }else if(percentage > 60 && percentage <= 75){
    print("First class");
  }else if(percentage >50 && percentage <= 60){
    print("Second class");
  }else if(percentage > 35 && percentage <= 50){
    print("Pass class");
  }else{
    print("Fail");
  }


}
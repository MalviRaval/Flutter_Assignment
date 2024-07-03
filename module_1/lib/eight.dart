//Write a program to calculate sum of 5 subjects & find the percentage. Subject marks entered by user.

import 'dart:io';

void main() {
  print('Math:');
  int m1 = int.tryParse(stdin.readLineSync()!) ?? 0;
  print('Computer:');
  int m2 = int.tryParse(stdin.readLineSync()!) ?? 0;
  print('Chemistry:');
  int m3 = int.tryParse(stdin.readLineSync()!)?? 0;
  print('Physics:');
  int m4 = int.tryParse(stdin.readLineSync()!)?? 0;
  print('English:');
  int m5 = int.tryParse(stdin.readLineSync()!)?? 0;
  print('''Math : $m1
  Computer $m2
  Chemistry $m3
  Physics $m4
  English $m5
  Total = ${m1+m2+m3+m4+m5}
  Percentage = ${((m1+m2+m3+m4+m5)/500)*100}''');

}
/*Write a program you have to print the Fibonacci series up to user given
number*/


import 'dart:io';

void main() {
  int t1 = 0, t2 = 1;
  int nextTerm = t1 + t2;
  print("Enter the number of terms: ");
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;

  print("Fibonacci Series:$t1,$t2");

  for (int i = 3; i <= n; i++) {
    print("$nextTerm");
    t1 = t2;
    t2 = nextTerm;
    nextTerm = t1 + t2;
  }
}

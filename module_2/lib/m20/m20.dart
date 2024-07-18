
/*1
4 4
9 9 9
16 16 16 16
25 25 25 25 25*/

import 'dart:io';
void main(){

  for(int i=1;i<=5;i++){
    for(int k=1;k<=i;k++){
      stdout.write("${i*i} ");
    }
    stdout.write("\n");
  }
} 
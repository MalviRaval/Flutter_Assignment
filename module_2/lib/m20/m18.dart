/*1
23
456
78910
1112131415*/

import 'dart:io';

void main(){
  int n=1;
 for(int i=1;i<=5;i++){
   for(int k=1;k<=i;k++){
     stdout.write("$n");
     n++;
   }
   stdout.write("\n");
 }
}
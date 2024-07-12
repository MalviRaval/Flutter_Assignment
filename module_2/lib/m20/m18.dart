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
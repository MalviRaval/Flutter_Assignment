import 'dart:io';


void main(){

  for(int i=1;i<=5;i++){
    for(int k=1;k<=i;k++){
      stdout.write("${i*i} ");
    }
    stdout.write("\n");
  }
} 
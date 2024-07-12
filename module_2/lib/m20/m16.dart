import 'dart:io';

void main(){

  for(int i=1;i<6;i++){

    for(int j=0;j<=(6-i)-1;j++)
      {
        stdout.write(" ");
      }

    for(int k=1;k<=i;k++){
      stdout.write("$k ");
    }
    stdout.write("\n");
  }

}
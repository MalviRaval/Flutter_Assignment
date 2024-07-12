import 'dart:io';

void main(){
  bool isTemp=false;
  for(int i=1;i<=5;i++){
    isTemp=false;
    for(int k=1;k<=i;k++){
      if(isTemp==true){
        stdout.write("0 ");
        isTemp=false;
      }else{
        stdout.write("1 ");
        isTemp=true;
      }

    }
    stdout.write("\n");
  }
}
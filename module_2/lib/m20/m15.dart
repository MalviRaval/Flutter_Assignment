 //         1
 //       1 2
 //     1 2 3
 //   1 2 3 4
 // 1 2 3 4 5






import 'dart:io';

void main(){

  for(int i=1;i<6;i++){

    for(int j=0;j<2*(6-i)-1;j++){
      stdout.write(" ");
    }
    for(int k=1;k<=i;k++){
      stdout.write("$k ");
    }
    stdout.write("\n");
  }

}
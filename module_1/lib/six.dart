//Write a program to find the simple Interest.
import 'dart:math';


void main(){

  int principal=Random().nextInt(5000);
  int interest=Random().nextInt(9);
  int period=Random().nextInt(5);
  print('''Simple interest of principal $principal interest $interest & period $period is ${principal + (principal * interest * period) / 100}''');

}
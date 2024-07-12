//Write Program use switch statement. Display Monday to Sunday
import 'dart:io';

void main() {
  print("Enter day of number:");
  int m = int.tryParse(stdin.readLineSync()!) ?? 0;
  switch (m) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Please enter correct value");
  }
}

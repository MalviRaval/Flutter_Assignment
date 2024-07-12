
import 'dart:io';

void main() {
  for (int i = 0; i < 6; i++) {

    for (int j = 0; j < 2 * (6 - i) - 1; j++) {
      stdout.write(" ");
    }

    // loop for printing * character
    for (int k = 0; k <= i; k++) {
      stdout.write("* ");
    }
    stdout.write("\n");

  }
  // print("\n");
}
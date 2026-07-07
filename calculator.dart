import 'dart:io';

void main() {
  var calcused = 0;

  while (true) {
    print("Wanna to Continue Calculator...");
    String? check = stdin.readLineSync();

    if (check == "N" || check == "n") {
      break;
    }

    try {
      print("Enter first Number: ");
      double firstNumber = double.parse(stdin.readLineSync()!);

      print("Enter Second Number: ");
      double secondNumber = double.parse(stdin.readLineSync()!);

      print("Enter operator (+,-,/,*,**): ");
      String? operator = stdin.readLineSync();

      calcused++;
      double res = 1.0;

      switch (operator) {
        case "+":
          print(
              "Sum of $firstNumber and $secondNumber is ${firstNumber + secondNumber}");
          break;

        case "-":
          print(
              "Difference of $firstNumber and $secondNumber is ${firstNumber - secondNumber}");
          break;

        case "*":
          print(
              "Product of $firstNumber and $secondNumber is ${firstNumber * secondNumber}");
          break;

        case "**":
          for (double i = 1; i <= secondNumber; i++) {
            res *= firstNumber;
          }
          print("$firstNumber ^ $secondNumber is $res");
          break;

        case "/":
          try {
            if (secondNumber == 0) {
              throw IntegerDivisionByZeroException();
            }
            print(
                "Quotient of $firstNumber and $secondNumber is ${firstNumber ~/ secondNumber}");
          } on IntegerDivisionByZeroException {
            print("Division by zero is undefined.");
          }
          break;

        default:
          print("Invalid operator.");
      }
    } on FormatException {
      print("Invalid number entered. Please enter numeric values.");
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  print("Total calculations are: $calcused");
}
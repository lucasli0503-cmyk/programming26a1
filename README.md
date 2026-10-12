# programming26a1

## TERM1a

### OOP Calculator using Processing and Java

![Cal26](https://github.com/lucasli0503-cmyk/programming26a1/blob/main/images/Cal26.png?raw=true)

[Link to source code](https://github.com/lucasli0503-cmyk/programming26a1/tree/main/src)
## OOP Calculator

Created by Lucas Li using Processing and Java.

This calculator provides a graphical interface for basic arithmetic and additional math functions. Users can enter numbers by clicking the buttons or using the keyboard. The display shows the current input, the selected operation, and the completed equation with its result.

### Features

| Button | Function |
| --- | --- |
| `0–9` | Enter numbers, including numbers with multiple digits. |
| `.` | Enter decimal numbers. Only one decimal point is allowed per number. |
| `+` | Add two numbers. |
| `-` | Subtract the second number from the first. |
| `x` | Multiply two numbers. |
| `/` | Divide the first number by the second. |
| `=` | Calculate and display the result. |
| `C` | Clear the entire calculation and reset the display to `0.0`. |
| `←` | Delete the last character of the number being entered. |
| `±` | Switch the current number between positive and negative. |
| `%` | Divide the current number by 100. For example, `25` becomes `0.25`. |
| `√` | Calculate the square root of the current number. |
| `²` | Square the current number. For example, `5` becomes `25.0`. |

### Display and Controls

- The calculator has a 400 × 430 pixel window with a number pad and function buttons.
- Buttons become darker when the mouse moves over them.
- The display updates as numbers and operations are entered.
- After pressing `=`, the display shows the completed equation, such as `12 + 8 = 20.0`.
- A result can be used in another calculation by selecting an operator.
- Entering a new number after a completed calculation starts a new calculation.

### Keyboard Support

| Key | Action |
| --- | --- |
| `0–9` | Enter digits. |
| `.` | Enter a decimal point. |
| `+` or `-` | Add or subtract. |
| `*` or `x` | Multiply. |
| `/` | Divide. |
| `Enter` or `=` | Calculate the result. |
| `Backspace` | Delete the last character of the current entry. |
| `C` or `c` | Reset the calculator. |
| `%` | Convert the current number to a percentage value. |

The `±`, `√`, and `²` functions are available through the on-screen buttons.

### How to Use

1. Enter the first number.
2. Select an operator: `+`, `-`, `x`, or `/`.
3. Enter the second number.
4. Press `=` or `Enter` to display the answer.
5. Press `C` to reset, or select another operator to continue using the result.

For square roots, squares, percentages, or sign changes, enter a number and click the corresponding function button.

### Program Structure

The project contains two Processing files:

- **cal107.pde:** Handles the interface, number entry, calculations, display updates, and mouse and keyboard input.
- **Button.pde:** Defines the reusable `Button` class, including each button’s position, size, label, appearance, and hover detection.

### Current Limitations

The calculator performs one two-number operation at a time. It does not evaluate expressions with parentheses or apply order of operations to a longer expression. The percentage button always divides the current number by 100. Invalid operations, such as division by zero or the square root of a negative number, do not have custom error messages.

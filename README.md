
# ICS3203 CAT2 Assembly Language Programming (ALP) Project

This repository contains the implementation of assembly programming tasks for **ICS3203 CAT2**. The project demonstrates basic assembly programming techniques, including system calls, recursive functions, and sensor data processing. The tasks are designed to test the understanding of low-level programming concepts in an assembly language environment.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Tasks and Descriptions](#tasks-and-descriptions)
   - [Task 1: Input Handling and Classification](#task-1-input-handling-and-classification)
   - [Task 2: Sensor Value Monitoring and Control](#task-2-sensor-value-monitoring-and-control)
   - [Task 3: Factorial Calculation Using Recursion](#task-3-factorial-calculation-using-recursion)
   - [Task 4: Sensor Value Based Alarm and Motor Control System](#task-4-sensor-value-based-alarm-and-motor-control-system)
3. [Getting Started](#getting-started)
4. [Running the Program](#running-the-program)
5. [Git Setup and Usage](#git-setup-and-usage)
6. [System Requirements](#system-requirements)
7. [Contributing](#contributing)
8. [License](#license)

---

## Project Overview

The **ICS3203 CAT2** project involves working with assembly language to develop solutions for real-world scenarios, using low-level programming techniques. Each task in this project addresses a core aspect of assembly programming, such as handling user input, performing mathematical operations, and simulating system controls based on sensor data.

The project demonstrates the ability to:
- Read and process user input.
- Implement recursive functions in assembly.
- Simulate system behavior based on sensor data.
- Use system calls effectively for input/output operations.
- Track and commit changes using Git for version control.

---

## Tasks and Descriptions

### **Task 1: Input Handling and Classification**

**Objective**:  
This task involves writing a program that takes a user’s input, checks if it’s positive, negative, or zero, and outputs the result.

**Features**:
- The program prompts the user to input a number.
- The number is classified as either **positive**, **negative**, or **zero**.
- System calls are used for input and output.

**Key Concepts**:
- User input handling using system calls.
- Conditional logic in assembly to classify input.
- Output to the console based on classification.

---

### **Task 2: Sensor Value Monitoring and Control**

**Objective**:  
This task simulates the reading of a sensor value, compares it to predefined thresholds, and controls a motor and alarm system based on the value.

**Features**:
- The user enters a sensor value, which is read and stored.
- The program compares the value to two thresholds:
  - **High Level (above 80)**: Turns both the motor and alarm ON.
  - **Moderate Level (between 50 and 80)**: Turns the motor OFF and alarm OFF.
  - **Low Level (below 50)**: Turns the motor ON and alarm OFF.

**Key Concepts**:
- User input handling and conversion.
- Comparison of sensor values with thresholds.
- Motor and alarm status simulation based on the sensor input.

---

### **Task 3: Factorial Calculation Using Recursion**

**Objective**:  
This task implements a recursive assembly program to calculate the factorial of a given number.

**Features**:
- The user inputs a number.
- The program calculates the factorial of the number using recursion.
- The program demonstrates the use of the stack for function calls and returns.

**Key Concepts**:
- Recursive function implementation in assembly.
- Stack management for storing intermediate values.
- System calls for input/output.

---

### **Task 4: Sensor Value-Based Alarm and Motor Control System**

**Objective**:  
This task simulates a sensor value that determines the status of a motor and alarm system.

**Features**:
- The user enters a sensor value.
- The program checks the sensor value against defined thresholds:
  - **High Level**: Motor and alarm are ON.
  - **Moderate Level**: Motor and alarm are OFF.
  - **Low Level**: Motor is ON, alarm is OFF.
- Displays the status of the motor and alarm after checking the value.

**Key Concepts**:
- Conditional branching to set motor and alarm statuses based on the sensor value.
- Output the current status of the motor and alarm.
- Handling of user input and output via system calls.

---

## Getting Started

To get started with the project, clone this repository to your local machine using the following command:

```bash
git clone https://github.com/Lionmjr/ICS3203-CAT2-Assembly--Peris-Mwangi-146093-.git
```

### Prerequisites
You’ll need the following tools installed to compile and run the assembly code:
- **nasm** (Netwide Assembler): To assemble the assembly code.
- **ld** (GNU Linker): To link the object files and create the executable.
- A Linux-based system (e.g., SEED Ubuntu VM) or a Unix-like environment with the necessary tools.

### Installing Dependencies

If `nasm` and `ld` are not installed, you can install them on Ubuntu with:

```bash
sudo apt update
sudo apt install nasm
sudo apt install binutils
```

---

## Running the Program

To run any of the tasks in this project, follow these steps:

1. Navigate to the project folder where the `.asm` file is located:
   ```bash
   cd ICS3203-CAT2-Assembly--Peris-Mwangi-146093-
   ```

2. Assemble the code using `nasm`:
   ```bash
   nasm -f elf64 task4.asm -o task4.o
   ```

3. Link the object file with `ld`:
   ```bash
   ld -o task4 task4.o
   ```

4. Run the program:
   ```bash
   ./task4
   ```

The program will prompt you for a sensor value and display the corresponding status of the motor and alarm.

---

## Git Setup and Usage

This project uses **Git** for version control. To contribute or manage your changes, follow these steps:

1. **Clone the Repository** (if you haven’t already):
   ```bash
   git clone https://github.com/Lionmjr/ICS3203-CAT2-Assembly--Peris-Mwangi-146093-.git
   ```

2. **Track Changes**:
   - Add files to the staging area:
     ```bash
     git add .
     ```

   - Commit your changes:
     ```bash
     git commit -m "Add task files for CAT2"
     ```

3. **Push Changes to GitHub**:
   ```bash
   git push origin main
   ```

---

## System Requirements

This project is intended to run on a **Linux-based system** (e.g., Ubuntu or SEED VM). The following tools are required:
- **nasm** (for assembling the code).
- **ld** (for linking object files into an executable).
- **Git** (for version control).

---

## Contributing

Feel free to contribute by forking the repository, making changes, and submitting a pull request. You can contribute to the following areas:
- Bug fixes or improvements to the assembly code.
- Enhancing the README or adding more detailed documentation.

---

## License

This project is licensed under the MIT License.

---

### **Conclusion**
This README provides an overview of the tasks, instructions for running the programs, and details on how to set up and use the repository. The project offers a hands-on approach to learning assembly programming, system calls, and version control with Git.

---

### **Summary of Changes**
- Each task is described in detail, with an explanation of the input, output, and key concepts.
- Instructions for running the program are clear and include Git setup, assembly, linking, and execution.
- The **Git setup** section explains how to commit and push changes to the repository.
- The **README** adheres to the guidelines of the ALP CAT2 document.


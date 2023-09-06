import 'dart:io';

class Employee {
  int id;
  String fullName;
  DateTime birthday;
  String address;
  String phoneNumber;

  Employee({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.address,
    required this.phoneNumber,
  });
}

class EmployeeManagement {
  List<Employee> employees = [];

  void addNewEmployee(Employee employee) {
    employees.add(employee);
  }

  List<Employee> getAllEmployee() {
    return employees;
  }

  void updateEmployee(int id, Employee updatedEmployee) {
  int indexOfEmployeeToUpdate = findEmployeeIndexById(id);
  if (indexOfEmployeeToUpdate != -1) {
    employees[indexOfEmployeeToUpdate] = updatedEmployee;
  }
}
  int findEmployeeIndexById(int id) {
  for (int i = 0; i < employees.length; i++) {
    if (employees[i].id == id) {
      return i;
    }
  }
    return -1;
}


  void showAllEmployee() {
    for (var employee in employees) {
      print("Employee ID: ${employee.id}");
      print("Full Name: ${employee.fullName}");
      print("Birthday: ${employee.birthday}");
      print("Address: ${employee.address}");
      print("Phone Number: ${employee.phoneNumber}");
      print("-----------------------------");
    }
  }
}

void main() {
  EmployeeManagement employeeManager = EmployeeManagement();
  int? choice = 0;

  while (choice != 5) {
    print("Choose an option:");
    print("1. Add new employee");
    print("2. Get all employees");
    print("3. Update employee");
    print("4. Show all employees");
    print("5. Exit");

    var input = stdin.readLineSync();
    choice = int.tryParse(input ?? '');
    switch (choice) {
      case 1:
        print("Enter Employee ID:");
        var id = int.tryParse(stdin.readLineSync() ?? '');
        print("Enter Full Name:");
        var fullName = stdin.readLineSync() ?? '';
        print("Enter Birthday (YYYY-MM-DD):");
        var birthdayStr = stdin.readLineSync() ?? '';
        var birthday = DateTime.tryParse(birthdayStr) ?? DateTime.now();
        print("Enter Address:");
        var address = stdin.readLineSync() ?? '';
        print("Enter Phone Number:");
        var phoneNumber = stdin.readLineSync() ?? '';
        Employee newEmployee = Employee(
          id: id ?? 0, 
          fullName: fullName,
          birthday: birthday,
          address: address,
          phoneNumber: phoneNumber,
        );
        employeeManager.addNewEmployee(newEmployee);
        break;

      case 2:
        List<Employee> allEmployees = employeeManager.getAllEmployee();
        for (var employee in allEmployees) {
          print("Employee ID: ${employee.id}, Full Name: ${employee.fullName}");
        }
        break;

      case 3:
        print("Enter the employee ID: ");
        var employeeIdToUpdate = int.tryParse(stdin.readLineSync() ?? '');
        if (employeeIdToUpdate != null) {
          print("Enter Full Name:");
          var updatedFullName = stdin.readLineSync() ?? '';
          print("Enter Birthday (YYYY-MM-DD):");
          var updatedBirthdayStr = stdin.readLineSync() ?? '';
          var updatedBirthday = DateTime.tryParse(updatedBirthdayStr) ?? DateTime.now();
          print("Enter Address:");
          var updatedAddress = stdin.readLineSync() ?? '';
          print("Enter Phone Number:");
          var updatedPhoneNumber = stdin.readLineSync() ?? '';
          Employee updatedEmployee = Employee(
            id: employeeIdToUpdate,
            fullName: updatedFullName,
            birthday: updatedBirthday,
            address: updatedAddress,
            phoneNumber: updatedPhoneNumber,
          );

          employeeManager.updateEmployee(employeeIdToUpdate, updatedEmployee);
        } else {
          print("Invalid ID");
        }
        break;

      case 4:
        employeeManager.showAllEmployee();
        break;
      case 5:
        print("Exit");
        break;
      default:
        print("Choose 1-5 options");
        break;
    }
  }
}

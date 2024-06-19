class Employee {
  String? status;
  List<Data>? data;
  String? message;

  Employee(Map<String, dynamic> jsonMap) {
    status = jsonMap['status'];
    message = jsonMap['message'];

    data = [];
    if (jsonMap['data'] != null) {
      jsonMap['data'].forEach((mapObj) {
        Data obj = Data(mapObj);
        data!.add(obj);
      });
    }
  }
}

class Data {
  String? employee_name;
  String? id;
  String? employee_salary;
  String? employee_age;
  String? profile_image;

  Data(Map<String, dynamic> jsonMap) {
    employee_age = jsonMap['employee_age'];
    employee_salary = jsonMap['employee_salary'];
    id = jsonMap['id'];
    employee_name = jsonMap['employee_name'];
    profile_image = jsonMap['profile_image'];
  }
}

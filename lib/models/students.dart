class Student {
  String? name;
  int? registration;
  String? email;

  Student({
    this.registration,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'registration': this.registration,
      'name': this.name,
      'email': this.email,
    };
  }

  static Student toObject(Map<String, dynamic> data) {
    return Student(
      registration: data['registration'],
      name: data['name'],
      email: data['email'],
    );
  }
}

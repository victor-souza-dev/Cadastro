import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sqlite/DAO/studentDAO.dart';
import 'package:sqlite/models/students.dart';

class FormRegister extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de alunos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "name do aluno"),
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email do aluno"),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  saveRecord(context);
                },
                child: Text("Cadastrar aluno"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveRecord(BuildContext maincontext) async {
    final String _name = nameController.text;
    final String _email = emailController.text;
    String message;

    if (EmailValidator.validate(_email)) {
      Student student = Student(
        name: _name,
        email: _email,
      );
      int result = await StudentDAO.insertRecord(student.toMap());

      if (result != 0) {
        message = "O aluno $_name foi cadastrado com sucesso!!!";
      } else {
        message = "Não foi possível cadastrar o aluno $_name";
      }

      showDialog(
          context: maincontext,
          builder: (context) => AlertDialog(
                title: Text("Mensagem do sistema"),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  )
                ],
              ));
    } else {
      message = "Email inválido!!!";
      showDialog(
          context: maincontext,
          builder: (context) => AlertDialog(
                title: Text("Mensagem do sistema"),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  )
                ],
              ));
    }
  }
}

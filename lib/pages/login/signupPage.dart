import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto4/widgets/customTextFormField.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              child: Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
                size: 150,
              ),
            ),
            customTextField("Usuário"),
            SizedBox(
              height: height * 0.02,
            ),
            customTextField("Senha", isPassword: true),
            SizedBox(
              height: height * 0.02,
            ),
            customTextField("Confirme sua senha", isPassword: true),
            SizedBox(
              height: height * 0.02,
            ),
            MaterialButton(
              color: Theme.of(context).buttonColor,
              child: Text(
                "Solicitar cadastro",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.snackbar("Cadastro", "Seu cadastro foi enviado!!!",
                    backgroundColor: Colors.white);
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/main.dart';
import 'package:restaurante_app/model/user.dart';
import 'package:restaurante_app/screens/cadastroScreen.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgotPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailExists = false;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void verifyEmail() {
    String email = emailController.text;
    bool foundUser = false;

    for (var user in listaUsuarios) {
      if (user.email == email) {
        foundUser = true;
        Provider.of<User>(context, listen: false).userAtual = user;
        break;
      }
    }
    if (!foundUser) {
      showSnackBar('Email não encontrado!');
    }

    setState(() {
      emailExists = foundUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu a senha?'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Digite o seu email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: verifyEmail,
              child: Text('Verificar Email'),
            ),
            if (emailExists)
              Column(
                children: [
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Nova Senha',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<User>(context, listen: false)
                          .userAtual
                          .password = passwordController.text;
                      showSnackBar('Senha alterada com sucesso!');
                      Navigator.pop(context);
                    },
                    child: Text('Alterar Senha'),
                  ),
                ],
              ),
            if (!emailExists) SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

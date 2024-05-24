import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/model/user.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  email: emailController.text,
                  password: passwordController.text,
                  carrinho: [],
                );
                // await Provider.of<User>(context, listen: false).addUser(user);
                listaUsuarios.add(user);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Usuário cadastrado com sucesso!'),
                  ),
                );
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: Text('Cadastrar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/controller/comidaController.dart';
import 'package:restaurante_app/controller/userController.dart';
import 'package:restaurante_app/main.dart';
import 'package:restaurante_app/model/bebidas.dart';
import 'package:restaurante_app/model/pratos.dart';
import 'package:restaurante_app/model/sobremesa.dart';
import 'package:restaurante_app/model/user.dart';
import 'package:restaurante_app/screens/cadastroScreen.dart';
import 'package:restaurante_app/screens/forgotScreen.dart';
import 'package:restaurante_app/components/SetLocation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Future<List<User>> futureUsers;
  late Future<List<Pratos>> futurePratos;
  late Future<List<Sobremesa>> futureSobremesa;
  late Future<List<Bebidas>> futureBebidas;

  @override
  void initState() {
    super.initState();
    futureUsers =
        Provider.of<UserController>(context, listen: false).fetchUsers();
    futurePratos =
        Provider.of<ComidaController>(context, listen: false).fetchPratos();
    futureSobremesa =
        Provider.of<ComidaController>(context, listen: false).fetchSobremesas();
    futureBebidas =
        Provider.of<ComidaController>(context, listen: false).fetchBebida();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                bool foundUser = false;

                for (var user in listaUsuarios) {
                  if (user.email == email && user.password == password) {
                    foundUser = true;
                    Provider.of<User>(context, listen: false).userAtual = user;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                    break;
                  }
                }
                if (!foundUser) {
                  showSnackBar('Usuário não encontrado ou senha incorreta');
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPage(),
                  ),
                );
              },
              child: Text('Esqueceu a senha?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountPage(),
                  ),
                );
              },
              child: Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}

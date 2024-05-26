import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_app/controller/userController.dart';
import 'package:restaurante_app/model/user.dart';
import 'package:restaurante_app/screens/foodManager.dart';
import 'package:restaurante_app/screens/loginScreen.dart';

class DrawerWidget extends StatelessWidget {
  Widget funcaoSobre() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restaurante do Zé'),
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                    'Somos uma rede de restaurantes que atua no mercado há 10 anos. Nosso objetivo é oferecer a melhor experiência gastronômica para nossos clientes. Aqui você encontra pratos, sobremesas e bebidas de alta qualidade. Venha nos visitar!',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.justify),
              ),
              const SizedBox(height: 50),
              Container(
                height: 150,
                width: 150,
                child: Image.asset('images/logo.png'),
              )
            ],
          ),
        ));
  }

  Widget funcaoCreditos() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créditos'),
          backgroundColor: Colors.redAccent,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('Desenvolvido por:',
                    style: TextStyle(fontSize: 30, color: Colors.black87),
                    textAlign: TextAlign.justify),
                SizedBox(height: 100),
                Text(
                    'João Marinho \n'
                    'Lucas Matheus',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87),
                    textAlign: TextAlign.justify),
              ],
            ),
          ),
        ));
  }

  late User removedUser;
  bool foundUser = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.info, color: Colors.redAccent),
            title: const Text('Sobre', style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => funcaoSobre()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.redAccent),
            title:
                const Text('Creditos', style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => funcaoCreditos()),
              );
            },
          ),
          if (Provider.of<User>(context).userAtual.email == 'admin') ...[
            ListTile(
              leading: Icon(Icons.person_remove, color: Colors.redAccent),
              title: const Text('Remover Usuário',
                  style: TextStyle(color: Colors.black87)),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Remover Usuário'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                              'Digite o email do usuário que deseja excluir:'),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            onChanged: (value) {
                              String emailValue = value;
                              for (var user in listaUsuarios) {
                                if (user.email == emailValue) {
                                  removedUser = user;
                                  foundUser = true;
                                  break;
                                }
                              }
                              if (!foundUser) {
                                SnackBar(
                                    content: Text('Email não encontrado!'),
                                    duration: Duration(seconds: 2));
                              }
                            },
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (foundUser) {
                              Provider.of<UserController>(context,
                                      listen: false)
                                  .deleteUser(removedUser);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Usuário removido com sucesso!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Email não encontrado!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: const Text('Excluir'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancelar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle, color: Colors.redAccent),
              title: const Text('Edição de comidas',
                  style: TextStyle(color: Colors.black87)),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => foodManager()),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.delete, color: Colors.redAccent),
            //   title: const Text('Remover Produto',
            //       style: TextStyle(color: Colors.black87)),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // funcaoRemoverProduto();
            //   },
            // ),
          ],
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.redAccent),
            title: Text(
                'Log Out "${Provider.of<User>(context).userAtual.email}"',
                style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

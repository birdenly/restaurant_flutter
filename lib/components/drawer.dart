import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}

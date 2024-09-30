import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário e Lista Dinâmica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final List<String> _itens = [];
  final _chaveFormulario = GlobalKey<FormState>();
  final TextEditingController _controlador = TextEditingController();

  void _adicionarItem() {
    if (_chaveFormulario.currentState!.validate()) {
      setState(() {
        _itens.add(_controlador.text);
        _controlador.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário e Lista Dinâmica'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _chaveFormulario,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _controlador,
                    decoration: InputDecoration(
                      labelText: 'Digite um item',
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Por favor, insira algum texto';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _adicionarItem,
                    child: Text('Adicionar Item'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_itens[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado Pesquisa"),
      ),
      body: ListTile(title: Text("nome do personagem")),
    );
  }
}

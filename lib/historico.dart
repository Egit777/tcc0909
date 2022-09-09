import 'package:flutter/material.dart';
import 'package:tela_de_calculo/Home.dart';
import 'main.dart';

const Color darkBlue = Color.fromARGB(255, 255, 255, 255);

void main() {
  runApp(MyTable());
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Histórico"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: criaTabela(),
      ),
    );
  }

  criaTabela() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Table(
          defaultColumnWidth: FixedColumnWidth(100.0),
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            verticalInside: BorderSide(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          children: [
            _criarLinhaTable(
                "Data, Km, Litros, Valor, Valor/L, Consumo, Total"),
            _criarLinhaTable("D/M/A, 0, 0, 0, 0, 0, 0"),
            _criarLinhaTable("D/M/A, 0, 0, 0, 0, 0, 0"),
            _criarLinhaTable("D/M/A, 0, 0, 0, 0, 0, 0"),
          ],
        )
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}

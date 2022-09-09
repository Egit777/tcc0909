import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tela_de_calculo/Home.dart';
import 'package:tela_de_calculo/historico.dart';
import 'grafico.dart';
import 'leitura.dart';
import 'main.dart';

void main() {
  runApp(MyGrafico());
}

class MyGrafico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'GASTO NO MÊS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? dropDownValue;
  List<String> cityList = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    //setFilters();
    super.initState();
  }

  setFilters() {
    setState(() {
      dropDownValue = cityList[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.title),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 250,
                height: 30,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                    ),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    hintText: "Visão Geral - Mensal",
                    contentPadding: new EdgeInsets.fromLTRB(50, 5, 5, 5),
                    fillColor: Colors.blue[900],
                  ),
                  value: dropDownValue,
                  onChanged: (String? Value) {
                    setState(() {
                      dropDownValue = Value!;
                    });
                  },
                  items: cityList
                      .map((cityTitle) => DropdownMenuItem(
                          value: cityTitle,
                          child: Text(
                            "$cityTitle",
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 5, 5),
                            ),
                          )))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Icon(Icons.circle,
                  color: Color.fromARGB(255, 38, 255, 0), size: 30),
              Column(children: const [
                Text('ECONOMIA',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 38, 255, 0))),
                Text('RS 300,00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 38, 255, 0))),
              ]),
              Icon(Icons.circle,
                  color: Color.fromARGB(255, 255, 0, 0), size: 30),
              Column(children: const [
                Text('DESPESAS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 0, 0))),
                Text('RS 100,00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 0, 0))),
              ]),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  color: Colors.blue[900],
                  width: 360,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Despesas por categoria',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/1170/1170601.png')),
                    ),
                  ),
                  Graficos(),
                  Leituras(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

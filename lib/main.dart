import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView
      (
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          [
            Icon
            (
              Icons.person_outline,
              size: 130.0,
              color: Colors.blueGrey,
            ),
            TextField
            (
              keyboardType: TextInputType.number,
              decoration: InputDecoration
              (
                labelText: "Peso em quilogramas (km)",
                labelStyle: TextStyle
                (
                  color: Colors.blueGrey
                )
              ),
              textAlign: TextAlign.center,
              style: TextStyle
              (
                color: Colors.blueGrey,
                fontSize: 25.0,
              ),
            ),
            TextField
            (
              keyboardType: TextInputType.number,
              decoration: InputDecoration
              (
                labelText: "Altura em centímetros (cm)",
                labelStyle: TextStyle
                (
                  color: Colors.blueGrey
                )
              ),
              textAlign: TextAlign.center,
              style: TextStyle
              (
                color: Colors.blueGrey,
                fontSize: 25.0,
              ),
            ),
            Padding
            (
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container
              (
                height: 60.0,
                child: RaisedButton
                (
                  onPressed: () {},
                  child: Text
                  (
                    "Calcular",
                    style: TextStyle
                    (
                      color: Colors.white,
                      fontSize: 30.0
                    ),
                  ),
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Text
            (
              "Informações",
              style: TextStyle
              (
                fontSize: 25.0,
                color: Colors.blueGrey
              ),
              textAlign: TextAlign.center,
            )
          ],
        )
      ),
    );
  }
}
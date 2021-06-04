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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String infoText = "Insira seus dados";

  void resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      infoText = "Insira seus dados";
      formKey = GlobalKey<FormState>();
    });
  }

  void calculaIMC() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        infoText = "${imc.toStringAsPrecision(4)} - Abaixo do peso";
      } else {
        infoText = "${imc.toStringAsPrecision(4)} - Outro";
      }
    });

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / height * height;
    if (imc < 18.6) {
      infoText = "$imc - Abaixo do peso";
    }
  }

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
            onPressed: resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 130.0,
                    color: Colors.blueGrey,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso em quilogramas (km)",
                        labelStyle: TextStyle(color: Colors.blueGrey)),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                    ),
                    controller: weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Insira seu peso!";
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura em centímetros (cm)",
                        labelStyle: TextStyle(color: Colors.blueGrey)),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                    ),
                    controller: heightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira sua altura!";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) calculaIMC();
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Text(
                    infoText,
                    style: TextStyle(fontSize: 25.0, color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  )
                ],
              ))),
    );
  }
}

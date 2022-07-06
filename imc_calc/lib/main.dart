import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso ${imc.toStringAsPrecision(3)}.";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal ${imc.toStringAsPrecision(3)}.";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso ${imc.toStringAsPrecision(3)}.";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade grau I ${imc.toStringAsPrecision(3)}.";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade grau II ${imc.toStringAsPrecision(3)}.";
      } else if (imc >= 40) {
        _infoText = "Obesidade grau III ${imc.toStringAsPrecision(3)}.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: _resetField, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu peso";
                  }
                },
                decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua altura";
                  }
                },
                decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(fontSize: 25)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculate;
                      }
                    },
                    child: const Text("Calcular"),
                  ),
                ),
              ),
              Text(
                _infoText,
                style: const TextStyle(fontSize: 25, color: Colors.green),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

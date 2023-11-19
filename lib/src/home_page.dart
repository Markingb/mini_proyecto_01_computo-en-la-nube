import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_proyecto_01/src/recibidos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _estatura = TextEditingController();
  final _peso = TextEditingController();
  final data = Data(estatura: 0.00, peso: 0.00, imc: 0.00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: const Text("Mini proyecto 1"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^\d{0,2}(\.\d{0,2})?$')),
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escribe la estatura';
              }
              return null;
            },
            controller: _estatura,
            decoration: const InputDecoration(
              hintText: '0.00',
              labelText: 'Estatura en Metros',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^\d{0,3}(\.\d{0,2})?$')),
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escribe el peso';
              }
              return null;
            },
            controller: _peso,
            decoration: const InputDecoration(
              hintText: '0.00',
              labelText: 'Peso en Kilogramos',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange[200]),
              onPressed: () {
                setState(() {
                  data.peso = double.parse(_peso.text);
                  data.estatura = double.parse(_estatura.text);
                  data.imc = data.peso / (data.estatura * data.estatura);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DatosRecibidos(data: data)));
                });
              },
              child: const Text("Calcular"))
        ],
      )),
    );
  }
}

class Data {
  double peso;
  double estatura;
  double imc;

  Data({required this.peso, required this.estatura, required this.imc});
}
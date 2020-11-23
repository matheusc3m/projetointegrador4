import 'package:date_time_picker/date_time_picker.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/lancamento/destilacao/destilacaoController.dart';
import 'package:projeto4/pages/home/lancamento/destilacao/destilacaoModel.dart';

class DestilacaoPage extends StatefulWidget {
  @override
  _DestilacaoPageState createState() => _DestilacaoPageState();
}

class _DestilacaoPageState extends State<DestilacaoPage> {
  DateTime selectedDate;
  final DestilacaoController controller = DestilacaoController();

  final _formKey = GlobalKey<FormState>();

  final _percent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            ListaDestilacao l = ListaDestilacao(
                date: selectedDate.toString(),
                porcentdePerca: int.parse(_percent.text));
            // If the form is valid, display a Snackbar.
            if (_formKey.currentState.validate()) {
              // If the form is valid, display a Snackbar.
              controller.addData(l.toJson());
              print("Requisitando Post");
            }
          }),
      appBar: AppBar(
        elevation: 0,
        title: Text("Destilação"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            _dateTime(),
            _customTextFormField(label: "% de perca do álcool"),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                ListaDestilacao l = ListaDestilacao(
                    date: selectedDate.toString(),
                    porcentdePerca: int.parse(_percent.text));
                // If the form is valid, display a Snackbar.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  controller.addData(l.toJson());
                  print(l.toJson());
                  print("Requisitando Post");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _customTextFormField({String label}) {
    return TextFormField(
      controller: _percent,
      decoration: InputDecoration(labelText: label),
    );
  }

  _dateTime() {
    return DateField(
      label: "Selecionar a data",
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.calendar_today),
        hintText: ("Valor"),
      ),
      selectedDate: selectedDate,
      onDateSelected: (DateTime date) {
        setState(() {
          selectedDate = date;
          print(selectedDate);
        });
      },
      lastDate: DateTime.now(),
    );
  }
}

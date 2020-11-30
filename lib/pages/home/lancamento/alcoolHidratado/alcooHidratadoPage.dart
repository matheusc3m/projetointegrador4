import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class AlcoolHidratadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text("Lançamento Álcool"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _dateTime(),
          _customTextFormField(label: "Massa Específica"),
          _customTextFormField(label: "Massa Específica a 20ºC"),
          _customTextFormField(label: "Temperatura em Cº"),
          _customTextFormField(label: "Fator correção volume a 20ºC"),
          _customTextFormField(label: "ºINPM"),
          _customTextFormField(label: "pH"),
          _customTextFormField(label: "Condutividade"),
          _customTextFormField(label: "Acidez"),
          _customTextFormField(label: "Quantidade"),
        ],
      ),
    );
  }

  _customTextFormField({String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
    );
  }

  _dateTime() {
    return DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: 'Data',
      timeLabelText: "Hora",
      onChanged: (val) => print(val),
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) => print(val),
    );
  }
}

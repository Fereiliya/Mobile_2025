// widgets/date_picker_widget.dart
import 'dart:async';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Penting agar Column tidak mengambil seluruh ruang
      children: <Widget>[
        Text("Tanggal Dipilih: ${selectedDate.toLocal()}".split(' ')[0]),
        const SizedBox(height: 10.0), // Perkecil jarak
        ElevatedButton(
          onPressed: () => {
            _selectDate(context),
            print(selectedDate.day + selectedDate.month + selectedDate.year)
          },
          child: const Text('Pilih Tanggal'),
        ),
      ],
    );
  }
}
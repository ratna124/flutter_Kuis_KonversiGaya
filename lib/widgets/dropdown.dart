import 'package:flutter/material.dart'; //import dari main

class DropdownConversi extends StatelessWidget { //kelas dengan extends stateless
  const DropdownConversi({ //konstruktor
    Key key, //menandakan id
    @required this.listItem, //isi parameter dari konstruktor
    @required this.dropdownOnChanged,
    @required String newValue,
  }) : _newValue = newValue, super(key: key); //menandakan id agar dapat dilempar ke super/parent

  final List<String> listItem; //mendeklarasikan variabel dari konstrukor
  final String _newValue;
  final Function dropdownOnChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) { //iterasi(menampilkan) setiap item dari list
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: dropdownOnChanged, //fungsi agar dropdown dapat diganti
    );
  }
}
import 'package:flutter/material.dart'; //import dari main

class DropdownConversiBefore extends StatelessWidget { //kelas dengan extends stateless
  const DropdownConversiBefore({ //konstruktor
    Key key, //menandakan id
    @required this.listFrom, //isi parameter dari konstruktor
    @required this.dropdownOnChangedFrom,
    @required String newValueFrom,
  }) : _newValueFrom = newValueFrom, super(key: key); //menandakan id agar dapat dilempar ke super/parent

  //mendeklarasikan variabel dari konstrukor
  final List<String> listFrom;
  final String _newValueFrom;
  final Function dropdownOnChangedFrom;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listFrom.map((String value) { //iterasi(menampilkan) setiap item dari list
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValueFrom,
      onChanged: dropdownOnChangedFrom, //fungsi agar dropdown dapat diganti
    );
  }
}
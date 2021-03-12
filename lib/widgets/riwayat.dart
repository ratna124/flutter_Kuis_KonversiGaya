import 'package:flutter/material.dart'; //import dari main

class Riwayat extends StatelessWidget { //kelas dengan extends stateless
  const Riwayat({ //konstruktor
    Key key, //menandakan id
    @required this.listViewItem, //isi parameter dari konstruktor
  }) : super(key: key); //menandakan id agar dapat dilempar ke super/parent

  final List<String> listViewItem; //mendeklarasikan variabel dari konstrukor

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listViewItem.map((String value) { //iterasi(menampilkan) setiap item dari list
      return Container(
          margin: EdgeInsets.all(10),
          child: Text(
            value,
            style: TextStyle(fontSize: 15),
          ));
    }).toList()); //membuat list yang berisi elemen iterable yang berurutan
  }
}
import 'package:flutter/material.dart'; //import dari main

class Result extends StatelessWidget { //kelas dengan extends stateless
  const Result({ //konstruktor
    Key key, //menandakan id
    @required this.result, //isi parameter dari konstruktor
  }) :  super(key: key); //menandakan id agar dapat dilempar ke super/parent

   final double result; //mendeklarasikan variabel dari konstrukor

  @override
  Widget build(BuildContext context) {
    return
    Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hasil",style: TextStyle(fontSize: 20),),
        Text(
        result.toStringAsFixed(3), //menampilkan hasil dengan 0 setelah koma ada 3
        style: TextStyle(fontSize: 30),
        )
      ],
      ),
    );
  }
}
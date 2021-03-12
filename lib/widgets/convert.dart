import 'package:flutter/material.dart'; //import dari main

class Convert extends StatelessWidget { //kelas dengan extend stateless
  final Function konvertHandler;  //deklarasi
  Convert({Key key, @required this.konvertHandler}); //isi parameter dari konstruuktor
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //memperluas lebar button
      height: 50,
      child: RaisedButton( //button
        onPressed: konvertHandler, //button agar dapat di klik
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Hitung"),
      ),
    );
  }
}
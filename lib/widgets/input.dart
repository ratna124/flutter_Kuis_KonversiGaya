import 'package:flutter/material.dart'; //import dari main

class Input extends StatelessWidget { //kelas extends stateless
  const Input({ //konstruktor
    Key key, //menandakan id
    @required this.inputUserController, //isi parameter dari konstruktor
  }) : super(key: key); //menandakan id agar dapat dilempar ke super/parent

  final TextEditingController inputUserController; //deklarasi konstruktor

  @override
  Widget build(BuildContext context) {
    return TextFormField( //untuk membuat form inputan
        controller: inputUserController,
        decoration: InputDecoration(
          hintText: 'Masukkan nilai',
        ),
        keyboardType: TextInputType.numberWithOptions(), //menampilkan keyboard angka
        validator: (String value) { //validasi inpputan user
          if (value.isEmpty) {
            return 'Enter some text';
          }
          return null;
        });
  }
}
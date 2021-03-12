import 'package:flutter/material.dart';
import 'widgets/input.dart'; //import agar yang ada pada kelas input dapat digunakan pada main
import 'widgets/result.dart'; //import agar yang ada pada kelas result dapat digunakan pada main
import 'widgets/convert.dart'; //import agar yang ada pada kelas convert dapat digunakan pada main
import 'widgets/dropdown.dart'; //import agar yang ada pada kelas dropdown dapat digunakan pada main
import 'widgets/riwayat.dart'; //import agar yang ada pada kelas riwayat dapat digunakan pada main
import 'widgets/dropdownBefore.dart'; //import agar yang ada pada kelas dropdown before dapat digunakan pada main

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi gaya', //judul
      theme: ThemeData( //mengatur tema tampilan aplikasi
        primarySwatch: Colors.blue,  //mengatur tampilan berwarna biru
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _inputUser = 0; //instansiasi variabel untuk nilai yang akan diinputkan oleh user
  double _mili = 0; //instansiasi variabel untuk menyimpan meganewton
  double _kilo = 0; //instansiasi variabel untuk menyimpan kilonewton
  final inputController = TextEditingController(); //memanggil nilai variable dari inputan
  String _newValue = "Milinewton"; //inisialisasi value to
  String _newValueFrom = "Milinewton"; //inisialisasi value before
  double _result = 0; //inisialisasi variabel untuk menyimpan hasil dari perhitungan

  void perhitunganGaya() { //fungsi untuk perhitungan gaya
    setState(() { //mentrigger fungsi build agar dapat dibuild ulang
      _inputUser = double.parse(inputController.text);  //mengkonversi controller menjadi double
      //milinewton
      if (_newValueFrom == "Milinewton" && _newValue == "Kilonewton") //kondisi yang akan diproses jika memilih milinewton
        _result = _inputUser * 0.000001; //perhitungan untuk mendapatkan hasil milinewton
      else if(_newValueFrom == "Milinewton" && _newValue == "Newton")
        _result = _inputUser * 0.001; 
      else if(_newValueFrom == "Milinewton" && _newValue == "Milinewton")
        _result = _inputUser * 1; 
      //kilonewton
      else if(_newValueFrom == "Kilonewton" && _newValue == "Kilonewton")
        _result = _inputUser * 1; 
      else if(_newValueFrom == "Kilonewton" && _newValue == "Newton")
        _result = _inputUser * 1000; 
      else if(_newValueFrom == "Kilonewton" && _newValue == "Milinewton")
        _result = _inputUser * 0.001; 
      //newton
      else if(_newValueFrom == "Newton" && _newValue == "Kilonewton")
        _result = _inputUser * 0.001; 
      else if(_newValueFrom == "Newton" && _newValue == "Newton")
        _result = _inputUser * 1; 
      else if(_newValueFrom == "Newton" && _newValue == "Milinewton")
        _result = _inputUser * 1000;
    });
    listViewItem.add("$_newValueFrom > $_newValue : $_result"); //menyimpan value dan hasil perhitungan agar dapat ditampilkan pada riwayat
  }

  void dropdownOnChanged(String changeValue) { //fungsi untuk dropdown dengan parameter string
    setState(() { //mentrigger fungsi build agar dapat dibuild ulang
      _newValue = changeValue; //mengirim parameter dari changeValue ke _newValue
      perhitunganGaya(); //memanggil fungsi perhitunganGaya();
    });
  }

  void dropdownOnChangedFrom(String changeValue) { //fungsi untuk dropdown dengan parameter string
    setState(() { //mentrigger fungsi build agar dapat dibuild ulang
      _newValueFrom = changeValue; //mengirim parameter dari changeValue ke _newValueFrom
      perhitunganGaya(); //memanggil fungsi perhitunganGaya();
    });
  }

  List<String> listViewItem = List<String>(); //membuat variabel bertipe list (string)

  var listItem = ["Milinewton", "Kilonewton", "Newton"]; //data pada list
  var listFrom = ["Milinewton", "Kilonewton", "Newton"]; //data pada list

  @override //fungsi yang nama dan parameter yang sama
  Widget build(BuildContext context) {
    return Scaffold( //mengatur tata letak
      appBar: AppBar(title: Text("Konverter Gaya")), //header
      body: Container( //menampung berbagai macam objek
        child: Column( //menampung widget kolom
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //mengatur kolom
          children: [
            Input(inputUserController: inputController), //menjadikan widget lebih sederhana
            Divider(), //memberi jarak
            Convert(konvertHandler: perhitunganGaya), //menjadikan widget lebih sederhana
            Divider(), //memberi jarak
            Row( //membuat baris
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ //kumpulan widget
                Text( //memberikan text
                  "From",  //isi text
                  style: TextStyle(fontSize: 20), //mengatur ukuran font
                ),
                Text( //memberikan text
                  "To", //isi text
                  style: TextStyle(fontSize: 20), //mengatur ukuran font
                ),
              ],
            ),
            Row( //membuat baris
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ //kumpulan widget
                DropdownConversiBefore( //menjadikan widget lebih sederhana
                    listFrom: listFrom,
                    newValueFrom: _newValueFrom,
                    dropdownOnChangedFrom: dropdownOnChangedFrom),
                DropdownConversi( //menjadikan widget lebih sederhana
                    listItem: listItem,
                    newValue: _newValue,
                    dropdownOnChanged: dropdownOnChanged),
              ],
            ),
            Result(result: _result), //menjadikan widget lebih sederhana
            Container( //menampung berbagai macam objek
              margin: EdgeInsets.only(top: 10, bottom: 10), //mengatur margin
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20), //mengatur ukuran text
              ),
              alignment: Alignment.bottomLeft  //meletakkan text pada posisi kiri
            ),
            Expanded(
              //memenuhi ruang kosong
              child: Riwayat(listViewItem: listViewItem), //menjadikan widget lebih sederhana
            ),
          ],
        ),
      ),
    );
  }
}

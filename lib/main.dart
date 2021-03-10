import 'package:flutter/material.dart';
import 'widgets/input.dart'; //import agar yang ada pada kelas input dapat digunakan pada main
import 'widgets/result.dart'; //import agar yang ada pada kelas result dapat digunakan pada main
import 'widgets/convert.dart'; //import agar yang ada pada kelas convert dapat digunakan pada main
import 'widgets/dropdown.dart';
import 'widgets/riwayat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi gaya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  double _inputUser = 0; //variabel untuk nilai yang akan diinputkan oleh user
  double _mili = 0; //variabel untuk menyimpan meganewton
  double _kilo = 0; //variabel untuk menyimpan kilonewton
  final inputController = TextEditingController();
  String _newValue = "Milinewton (MN)";
  double _result = 0; //variabel untuk menyimpan hasil dari perhitungan

  void perhitunganGaya() {
    //fungsi untuk perhitungan gaya
    setState(() {
      if (_newValue == "Milinewton (MN)") //kondisi yang akan diproses jika memilih milinewton
        _result = _inputUser * 1000;  //perhitungan untuk mendapatkan hasil milinewton
      else if (_newValue == "Kilonewton (kN)") //kondisi yang akan diproses jika memilih kilonewton
        _result = _inputUser * 0.001; //perhitungan untuk mendapatkan hasil kilonewton
      else
        _result = (_inputUser * 1000000000); //perhitungan untuk mendapatkan hasil nanonewton
    });
    listViewItem.add("$_newValue : $_result");
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganGaya();
    });
  }

  List<String> listViewItem = List<String>();

  var listItem = ["Milinewton (MN)", "Kilonewton (kN)", "Nanonewton (nN)"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konverter Gaya")),
      body: Container(
        child: Column( //membuat kolom
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Input(inputUserController: inputController),
            Divider(), //memberi jarak
            Convert(konvertHandler: perhitunganGaya),
            Divider(), //memberi jarak
            Row( //membuat baris
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "From",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "To",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownConversi(
                    listItem: listItem,
                    newValue: _newValue,
                    dropdownOnChanged: dropdownOnChanged),
                DropdownConversi(
                    listItem: listItem,
                    newValue: _newValue,
                    dropdownOnChanged: dropdownOnChanged),
              ],
            ),
            Result(result: _result),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
              alignment: Alignment.bottomLeft  //meletakkan text pada posisi kiri
            ),
            Expanded(
              //memenuhi ruang kosong
              child: Riwayat(listViewItem: listViewItem),
            ),
          ],
        ),
      ),
    );
  }
}

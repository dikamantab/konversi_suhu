import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;

konversi (){
  //set state
  setState(() {
    inputUser = double.parse(etInput.text);
    reamur = 4 / 5 * inputUser;
    kelvin = inputUser + 273;
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Suhu Converter"),
          ),
          body: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: "Masukkan Nilai Suhu celcius"),
                    keyboardType: TextInputType
                        .number, //supaya jenis text nya angka bukan huruf
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: etInput,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Suhu Dalam Kelvin",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '$kelvin',
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Suhu Dalam Reamur",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '$reamur',
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: konversi,
                        color: Colors.blue,
                        textColor: Colors.black,
                        child: Text("Konversi"),
                      ))
                ],
              )),
        ));
  }
}

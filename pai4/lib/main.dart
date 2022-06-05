import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _textEditingController1 =
      new TextEditingController(text: "");
  TextEditingController _textEditingController2 =
      new TextEditingController(text: "");

  double? _resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("AI4 Calculadora"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Resultado: $_resultado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    TextField(
                      decoration: InputDecoration(hintText: "Escribe un numero"),
                      controller: _textEditingController1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Escribe otro numero"),
                      controller: _textEditingController2,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _suma();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 30),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _resta();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      child: Text(
                        "x",
                        style: TextStyle(fontSize: 30),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _multiplicacion();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 30),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _division();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      child: Text(
                        "%",
                        style: TextStyle(fontSize: 30),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _porcentaje();
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Metodo propio para llamar a la snackbar
  _showSnackBar(BuildContext context, String mensaje) {
    final snackbar = SnackBar(
      content: new Text(mensaje.toUpperCase()),
    );
    _scaffoldkey.currentState?.showSnackBar(snackbar);
  }

  _suma() {
    setState(() {
      double? n1 = double.tryParse(_textEditingController1.text);

      double? n2 = double.tryParse(_textEditingController2.text);
      _resultado = (n1! + n2!)!;
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _resta() {
    setState(() {
      double? n1 = double.tryParse(_textEditingController1.text);

      double? n2 = double.tryParse(_textEditingController2.text);
      _resultado = (n1! - n2!)!;
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _multiplicacion() {
    setState(() {
      double? n1 = double.tryParse(_textEditingController1.text);

      double? n2 = double.tryParse(_textEditingController2.text);
      _resultado = (n1! * n2!)!;
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _division() {
    setState(() {
      double? n1 = double.tryParse(_textEditingController1.text);

      double? n2 = double.tryParse(_textEditingController2.text);
      _resultado = (n1! / n2!)!;
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _porcentaje() {
    setState(() {
      double? n1 = double.tryParse(_textEditingController1.text);

      double? n2 = double.tryParse(_textEditingController2.text);
      _resultado = ((n2! * 100) / n1!)!;
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }
}
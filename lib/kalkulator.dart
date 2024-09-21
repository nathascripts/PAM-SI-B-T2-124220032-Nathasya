import 'package:flutter/material.dart';

void main() {
  runApp(Kalkulator());
}

class Kalkulator extends StatelessWidget {
  const Kalkulator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 194, 214),
        ),
        useMaterial3: true,
      ),
      home: KalkulatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String text = "";
  late int first, second;
  late String res = "", opp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        backgroundColor: const Color(0xFFFFC1E3),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            )),
        titleTextStyle: const TextStyle(fontSize: 25, color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customOutlineButton("C", Colors.pink[200]!),
                customOutlineButton("%", Colors.pink[200]!),
                customOutlineButton("⌫", Colors.pink[200]!),
                customOutlineButton("/", Colors.pink[200]!),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("7", Colors.purple[100]!),
                customOutlineButton("8", Colors.purple[100]!),
                customOutlineButton("9", Colors.purple[100]!),
                customOutlineButton("*", Colors.pink[200]!),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("4", Colors.blue[100]!),
                customOutlineButton("5", Colors.blue[100]!),
                customOutlineButton("6", Colors.blue[100]!),
                customOutlineButton("-", Colors.pink[200]!),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("1", Colors.green[100]!),
                customOutlineButton("2", Colors.green[100]!),
                customOutlineButton("3", Colors.green[100]!),
                customOutlineButton("+", Colors.pink[200]!),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("00", Colors.yellow[300]!),
                customOutlineButton("0", Colors.yellow[300]!),
                customOutlineButton(".", Colors.yellow[300]!),
                customOutlineButton("=", Colors.pink[200]!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val, Color color) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: const TextStyle(fontSize: 35.0, color: Colors.black),
        ),
      ),
    );
  }

  void btnClicked(String btnText) {
    if (btnText == "C") {
      setState(() {
        text = "";
        res = "";
        first = 0;
        second = 0;
        opp = "";
      });
    } else if (btnText == "⌫") {
      setState(() {
        text = text.isNotEmpty ? text.substring(0, text.length - 1) : "";
      });
    } else if (btnText == "%") {
      setState(() {
        text = (double.parse(text) / 100).toString();
      });
    } else if (btnText == "00") {
      setState(() {
        text += "00";
      });
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
      setState(() {
        text = "";
      });
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      } else if (opp == "-") {
        res = (first - second).toString();
      } else if (opp == "*") {
        res = (first * second).toString();
      } else if (opp == "/") {
        res = (first ~/ second).toString();
      }
      setState(() {
        text = res;
      });
    } else {
      setState(() {
        text = text + btnText;
      });
    }
  }
}

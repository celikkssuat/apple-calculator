import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  Widget numButton(String btnText, Color btnColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: textColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('SUAT'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.grey[850])!, Colors.white),
                numButton("8", (Colors.grey[850])!, Colors.white),
                numButton("9", (Colors.grey[850])!, Colors.white),
                numButton("x", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.grey[850])!, Colors.white),
                numButton("5", (Colors.grey[850])!, Colors.white),
                numButton("6", (Colors.grey[850])!, Colors.white),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.grey[850])!, Colors.white),
                numButton("2", (Colors.grey[850])!, Colors.white),
                numButton("3", (Colors.grey[850])!, Colors.white),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                ),
                numButton(".", (Colors.grey[850])!, Colors.white),
                numButton("=", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  //Mantık
  int ilkNumara = 0;
  int ikinciNumara = 0;
  String sonuc = "";
  String text = "";
  String oparasyon = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      sonuc = "";
      text = "";
      ilkNumara = 0;
      ikinciNumara = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      ilkNumara = int.parse(text);
      sonuc = "";
      oparasyon = btnText;
    } else if (btnText == "=") {
      ikinciNumara = int.parse(text);
      if (oparasyon == "+") {
        sonuc = (ilkNumara + ikinciNumara).toString();
      }
      if (oparasyon == "-") {
        sonuc = (ilkNumara - ikinciNumara).toString();
      }
      if (oparasyon == "x") {
        sonuc = (ilkNumara * ikinciNumara).toString();
      }
      if (oparasyon == "/") {
        sonuc = (ilkNumara ~/ ikinciNumara).toString();
      }
    } else {
      sonuc = int.parse(text + btnText).toString();
    }
    setState(() {
      text = sonuc;
    });
  }
}

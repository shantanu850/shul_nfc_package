import 'package:flutter/material.dart';
import 'package:shul_nfc_package/shul_nfc_package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(child: NfcScan()),
      ),
    );
  }
}

class NfcScan extends StatefulWidget {
  NfcScan({Key? key}) : super(key: key);

  @override
  _NfcScanState createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  TextEditingController writerController = TextEditingController();

  @override
  initState() {
    super.initState();
    writerController.text = 'Flutter NFC Scan';
    ShulNfcPackage.onTagDiscovered().listen((onData) {
      print(onData.id);
      print(onData.content);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    writerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: writerController,
        ),
        TextButton(
          onPressed: () {
            ShulNfcPackage.read(instruction: "It's reading");
          },
          child: Text("Read"),
        ),
        TextButton(
          onPressed: () {
            ShulNfcPackage.write(" ", writerController.text).then((value) {
              print(value.content);
            });
          },
          child: Text("Write"),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  bool _Show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Generator'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    _Show = !_Show;
                  },
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12)),
                  width: 280,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Generate QR Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                  )),
            ),
            SizedBox(
              height: 140,
            ),
            Visibility(
              visible: _Show,
              child: QrImage(
                data: 'http://13.235.16.14/back/user-api/v0/test-raw-id/',
                size: 300,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(
                    100,
                    100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

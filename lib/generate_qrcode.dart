import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Future<RawData> fetchRawData() async {
//   final response = await http
//       .get(Uri.parse('http://13.235.16.14/back/user-api/v0/test-raw-id/'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return RawData.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class RawData {
//   final String data;

//   const RawData({
//     required this.data,
//   });

//   factory RawData.fromJson(Map<String, dynamic> json) {
//     return RawData(
//       data: json['raw_id'],
//     );
//   }
// }

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  String data = "";
  bool display = false;
  // List<dynamic> data = [];

  // late Future<RawData> futureData;
  // bool _Show = false;

  // Future<http.Response> fetchRawdata() {
  //   return http.get(
  //     Uri.parse('http://13.235.16.14/back/user-api/v0/test-raw-id/'),
  //   );
  // }

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
              onTap: getdata,
              // onTap: () {
              //   setState(
              //     () {
              //       _Show = !_Show;
              //     },
              //   );
              // },
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
                ),
              ),
            ),
            SizedBox(
              height: 140,
            ),
            Visibility(
              visible: display,
              child: QrImage(
                data: data,
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

  void getdata() async {
    print('1 call');
    const url = 'http://13.235.16.14/back/user-api/v0/test-raw-id/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      data = json['raw_id'];
    });
    display = true;
    print(data);
  }

  // getData() {
  //   futureData = fetchRawData();
  //   print(futureData);
  //   print("a");
  // }
}

// List<dynamic> data = [];

// void getdata() async {
//   print('1 call');
//   const url = 'http://13.235.16.14/back/user-api/v0/test-raw-id/';
//   final uri = Uri.parse(url);
//   final response = await http.get(uri);
//   final body = response.body;
//   final json = jsonDecode(body);
//   setState(() {
//     data = json['raw_data'];
//   });
//   print('2');
// }

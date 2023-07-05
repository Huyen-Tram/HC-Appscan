import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_launcher_icons/xml_templates.dart';

class NetworkImageBytes extends StatefulWidget {
  const NetworkImageBytes({super.key, required this.src});

  final String src;

  @override
  _NetworkImageBytesState createState() => _NetworkImageBytesState();
}

class _NetworkImageBytesState extends State<NetworkImageBytes> {
  Uint8List? _bytes;
  final httpClient = HttpClient();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final request =
    await httpClient.getUrl(Uri.parse(widget.src));
    final response = await request.close();

    _bytes = await consolidateHttpClientResponseBytes(response);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _bytes != null
        ? Image.memory(_bytes!)
        : Container(color: Colors.blue[300],);
        
  }
}
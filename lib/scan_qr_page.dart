import 'package:appscan/Button_Widget.dart';
import 'package:appscan/product_details_page.dart';
import 'package:appscan/repository/repository.dart';
import 'package:appscan/utils/HiveUtils.dart';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/product.dart';
import 'utils/Utils.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String qrCode = 'Not yet Scanner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scan Barcode",
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "RESULT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                qrCode,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                color: Colors.black,
                text: "Scan Barcode",
                onclicked: () async {
                  await scanQRcode();
                  print("Scan barcode $qrCode");
                  if (qrCode != "") {
                    var hiveProduct = HiveUtils.getHiveProducts();
                    var newProduct = await getProductByBarCode();
                    if (newProduct == null) return;
                    hiveProduct.put(newProduct.id, newProduct);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(
                            product: newProduct,
                          );
                        },
                      ),
                    );
                  } else {
                    //showTextToast("Barcode invalid");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Product?> getProductByBarCode() async {
    print("getInfoProductByBC code 1: $qrCode");

    var repo = Repository();
    var response = await repo.getInfoProductByBC(qrCode);
    if (response == null || response.data == null) return null;
    var dataProduct = response.data!;
    var idProduct = dataProduct.sId;
    var timeScan = Utils.getDateTimeHoursCurrent();
    

    var productMapped = Product(id: idProduct!);
    productMapped.lotCode = dataProduct.lotCode;
    productMapped.description = dataProduct.pDescription;
    productMapped.name = dataProduct.pName;
    productMapped.image = dataProduct.pAvatar;
    productMapped.dateOfManufacture = dataProduct.pPackingDate;
    productMapped.expirationDate = dataProduct.pExpirationDate;
    productMapped.dateTimeScan = timeScan;
    print("image : https:${productMapped.image}");


    return productMapped;
  }

  Future<void> scanQRcode() async {
    try {
      final qrCode = await BarcodeScanner.scan();
      if (!mounted) return;
      setState(() {
        this.qrCode = qrCode.rawContent;
      });
    } on PlatformException {
      qrCode = 'failed to get platform version';
    }
  }
}

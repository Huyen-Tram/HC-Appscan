import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/HiveUtils.dart';
import 'models/product.dart';
import 'product_history.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveProduct = HiveUtils.getHiveProducts();
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Container(
            color: Color(0xffeff5f4),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 15,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Text(
                            "   History Scan",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 10),
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: hiveProduct.listenable(),
                              builder: (BuildContext context,
                                  Box<Product> value, Widget? child) {
                                return ListView.builder(
                                  itemCount: value.values.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print("Code: $index");
                                    print(
                                        "Code value.values.length : ${value.values.length}");
                                    return ProductHistory(
                                      product: value.values.toList()[index],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

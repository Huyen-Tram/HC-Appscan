import 'package:flutter/material.dart';
import '../models/product.dart';
import '../product_details_page.dart';
import '../utils/HiveUtils.dart';
import 'network_image_bytes.dart';

class ProductHistory extends StatelessWidget {
  final Product? product;
  final bool clickable;
  const ProductHistory({Key? key, this.product, this.clickable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (clickable) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                product: product,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 6,
              color: Color.fromARGB(255, 42, 5, 249).withOpacity(0.06),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(

          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    color: Color(0xffeff5f4),
                    child: NetworkImageBytes(src: "https:${product!.image}")),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
            
                  Row(
                    children: [
                      Icon(
                        Icons.qr_code,
                        size: 18,
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.75),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        product!.dateTimeScan ?? '-',
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 13,
                          color: Color.fromARGB(255, 0, 34, 255),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            IconButton(
              onPressed: () {
                deleteHistoryItem(product!);
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Color.fromARGB(255, 0, 110, 255),
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteHistoryItem(Product product) async {
    var hiveProduct = HiveUtils.getHiveProducts();
    hiveProduct.delete(product.id);
  }
}

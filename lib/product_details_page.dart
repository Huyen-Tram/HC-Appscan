import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'models/product.dart';
import 'network_image_bytes.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product? product;

  const ProductDetailsPage({Key? key, this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var widthParent = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Product",
        ),
        // actions: <Widget>[
        //   Ink(
        //     child: IconButton(
        //         icon: const Icon(Icons.save),
        //         onPressed: (() {
                  
        //         }),
        //     ),
        //   )  
        // ],
      ),
      body: Container(
        
            child: Column(
              children: [
                Container(
                 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Container(
                                    color: Color(0xffeff5f4),
                                  child: Container(
                                    color: Color.fromARGB(255, 0, 4, 5)
                                        .withOpacity(0.1),

                                    child: (product!.image == null)
                                         ? Center(
                                            child: Icon(
                                              Icons.image,
                                              color: Color.fromARGB(255, 0, 2, 2)
                                                  .withOpacity(0.3),
                                            ),
                                          )
                                          : NetworkImageBytes(src: "https:${product!.image}"),
                                        // : CachedNetworkImage(
                                        //     fit: BoxFit.cover,
                                        //     //imageUrl: 'https:${product!.image!}',
                                        //     //imageUrl: 'https://check.pvcfc.com.vn//Images/Authentic/HUMATE25/HUMATE25_807379_N1gYAYxtME.jpg',
                                        //     //imageUrl: product!.image!,
                                        //     imageUrl: 'https://haycafe.vn/wp-content/uploads/2022/01/Hinh-nen-vu-tru-khong-gian-sao-tho-vo-cung-ky-vi.jpg',

                                        //     errorWidget: (context, s, a) {
                                        //       return Icon(
                                        //         Icons.error,
                                        //         color: Color.fromARGB(255, 0, 153, 255)
                                        //             .withOpacity(0.5),
                                        //       );
                                        //     },
                                        //   ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // getDataWidgetFromHTML(
                              //   "Avatar",
                              //   "https:${product!.image!}",),
                              getDataWidget(
                                  widthParent,
                                  "Product name",
                                  product!.name!),
                              getDataWidget(widthParent,
                                "Date time scanned",
                                product!.dateTimeScan!,
                              ),
                              getDataWidget(widthParent,
                                "Packing date",
                                product!.dateOfManufacture!
                                 //"2023-06-16T06:59:43.736Z",
                              ),
                              getDataWidget(widthParent,
                                "Expiration date",
                                product!.expirationDate!
                                // "2023-06-16T06:59:43.736Z",
                              ),
                              getDataWidget(widthParent,
                                "Lot code",
                                product!.lotCode!,
                              ),
                              getDataWidgetFromHTML(
                                "Description",
                                product!.description!,
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
    //   ),
    // );
  }
  

  Widget getDataWidgetFromHTML(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            bottom: 3,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "Raleway",
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 140, 255),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 6,
                color: Color.fromARGB(255, 0, 140, 255),
              ),
            ],
          ),
          child: HtmlWidget(value,  textStyle : TextStyle(fontSize: 15,),),
        ),
      ],
    );
  }

  Widget getDataWidget(double width, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            bottom: 3,
          ),
          child: Text(
            title,

            style: const TextStyle(
              fontFamily: "Raleway",
              fontSize: 17,

              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 140, 255),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 6,
                color: Color.fromARGB(255, 0, 156, 252).withOpacity(0.2),
              ),
            ],
          ),
          height: 50,
          child: Text(
            value,
            style: TextStyle(fontSize: 15,),
          ),

        ),
      ],
    );
  }
}

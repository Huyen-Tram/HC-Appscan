
import 'package:hive/hive.dart';

import '../models/product.dart';

class HiveUtils {


  static Box<Product> getHiveProducts() {
    return Hive.box("products");
  }


}
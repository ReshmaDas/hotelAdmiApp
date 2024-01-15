import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productName = TextEditingController();
  TextEditingController productDiscription = TextEditingController();
  TextEditingController productImageUrl = TextEditingController();
  TextEditingController productPriceCrtl = TextEditingController();
  String category = 'Normal';
  String brand = "No Brand";
  bool offer = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
          id: doc.id,
          name: productName.text,
          category: category,
          brand: brand,
          price: double.tryParse(productPriceCrtl.text),
          description: productDiscription.text,
          image: productImageUrl.text,
          offer: offer);
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product add successfuly',
          colorText: Colors.green);
      setValuesDefault();
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.green);
      print(e.toString());
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapShort = await productCollection.get();
      final List<Product> retrivedProduct = productSnapShort.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrivedProduct);

      Get.snackbar('Success', 'Product Fetch Successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      // TODO
    }
  }

  setValuesDefault() {
    productName.clear();
    productPriceCrtl.clear();
    productDiscription.clear();
    productImageUrl.clear();
    category = 'Normal';
    brand = "No Brand";
    offer = false;
    update();
  }
}

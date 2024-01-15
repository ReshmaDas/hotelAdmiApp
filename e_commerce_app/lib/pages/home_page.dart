
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Food Items Admin'),
        
          ),
          body: ListView.builder(
        
            itemCount: ctrl.products.length,
            itemBuilder: (context,index)
            {
            return Card(
              elevation: 3,
              child: ListTile(
                title: Text(ctrl.products[index].name ?? ''),
                subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(icon: Icon(Icons.delete),
                onPressed: (){
                 ctrl.deleteProduct(ctrl.products[index].id ?? '');
                  print('Delete');
                },
                ),
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              print('add new data');
              Get.to(AddProductPage());
            },
            child: Icon(Icons.add),
            ),
        );
      }
    );
  }
}
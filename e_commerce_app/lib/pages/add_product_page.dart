import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_app/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Product'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add Product',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  TextField(
                    controller: ctrl.productName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text('Product Name'),
                        hintText: 'Enter Your Name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 4,
                    controller: ctrl.productDiscription,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text('Enter Product Description'),
                        hintText: 'Product Description '),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: ctrl.productImageUrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text('Image Url'),
                        hintText: 'Enter Your Image Url'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: ctrl.productPriceCrtl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text('Product Price'),
                        hintText: 'Enter Your Product Price'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 Row(
                   children: [
                     Flexible(
                      child: DropDownButtonWidget(
                        selectedItemText: ctrl.category,
                        Items: ['Main Courses','Pasta and Noodles',' Soups and Salads' 'Specialties'],
                        onSelected: (selectedVAlue){
                          ctrl.category= selectedVAlue ??  'Normal';
                          ctrl.update();
                           print(selectedVAlue);
        
                        },
                      ),),
                      Flexible(
                        child: DropDownButtonWidget(
                        selectedItemText: ctrl.brand,
                        Items: ['Brand1','Brand2','Brand3'],
                        onSelected: (selectedVAlue){
                          ctrl.brand= selectedVAlue ?? 'No Brand';
                          ctrl.update();
                           print(selectedVAlue);
                          
                        },
                      ),),
                      SizedBox(height: 10,)
        
                   ],
                 ),
                 Text(
                    'Offer Product ?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  DropDownButtonWidget(
                    selectedItemText: ctrl.offer.toString(),
                    Items: ['true','false'],
                    onSelected: (selectedVAlue){
                      ctrl.offer= bool.tryParse(selectedVAlue ?? 'false')?? false  ;
                      
                          print(selectedVAlue);
                          ctrl.update();
                        },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (){
                      ctrl.addProduct();
                      print('add product clicked');
                    }, 
                    child: Text('Add Product'),),
                  
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

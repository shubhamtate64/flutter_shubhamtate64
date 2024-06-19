import "package:flutter/material.dart";
import "package:mvc_pattern_demo_changenotifierprovider/controller/product_controller.dart";
import "package:mvc_pattern_demo_changenotifierprovider/model/product_model.dart";
import "package:mvc_pattern_demo_changenotifierprovider/view/product_display.dart";
import "package:provider/provider.dart";

class GetProductDetails extends StatelessWidget{

  GetProductDetails({super.key});

  final TextEditingController _productImageTextEditingController = TextEditingController(); 
  final TextEditingController _productNameTextEditingController = TextEditingController();
  final TextEditingController _productPriceTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("Get Product Details"),
        centerTitle:true,
      ),
      body: Column(
        children:[

          const SizedBox(height:20),

          ///Product Image
          TextFormField(
            controller:_productImageTextEditingController,
            decoration:InputDecoration(
              hintText:"Add Product Image",
              enabledBorder:UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20),
              ),
              focusedBorder:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20)
              ),
            ),
          ),

          const SizedBox(height:20),

          ///Product Name
          TextFormField(
            controller:_productNameTextEditingController,
            decoration:InputDecoration(
              hintText:"Enter Product Name",
              enabledBorder:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20),
              ),
              border:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20)
              ),
              focusedBorder:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20)
              )
            ),
          ),

          const SizedBox(height:20),

          ///Product Price
          TextFormField(
            controller:_productPriceTextEditingController,
            decoration: InputDecoration(
              hintText:'Enter Product Price',
              border:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20),
              ),
              enabledBorder:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20),
              ),
              focusedBorder:UnderlineInputBorder(
                borderRadius:BorderRadius.circular(20)
              ),
            ),
          ),

          ElevatedButton(
            onPressed:(){
                var tempObj = ProductModel(
                  isFavorite: false,
                  price: _productPriceTextEditingController.text,
                  productImage: _productImageTextEditingController.text,
                  productName: _productNameTextEditingController.text,
                  quantity: 0,
                );
                Provider.of<ProductController>(context,listen: false).addProductData(pObj:tempObj);
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return const ProductDisplay();
                }));
            },
            child: const Text("Submit"),
          ),
        ]
      ),
    );
  }


}
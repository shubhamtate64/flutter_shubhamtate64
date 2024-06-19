
import "package:flutter/material.dart";
import "package:mvc_pattern_demo_changenotifierprovider/controller/product_controller.dart";
import "package:provider/provider.dart";

class ProductDisplay extends StatelessWidget{

  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context){

    ProductController productControllerObj = Provider.of<ProductController>(context,listen:false);
    return Scaffold(
      appBar:AppBar(
        title:const Text("Product Display"),
        centerTitle:true
      ),
      body:Center(
        child:Container(
          child:Column(
          
            children: [
              Image.network("${productControllerObj.productModelObj!.productImage}"),
              const SizedBox(height: 10,),
              Text("${productControllerObj.productModelObj!.productName}"),
              const SizedBox(height: 10,),
              Text("${productControllerObj.productModelObj!.price}"),
              const SizedBox(height: 10,),

              Row(
                children: [
                  ///is Favorite
                  Consumer<ProductController>(
                    builder:(context,provider,child){
                      return GestureDetector(
                        onTap:(){
                          productControllerObj.addToFavorite();
                        },
                        child:Icon(productControllerObj.productModelObj!.isFavorite! ? Icons.favorite_rounded : Icons.favorite_border)
                      );
                    }
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      productControllerObj.addQuantity();
                    },
                    child:const Icon(Icons.add)
                  ),

                  const SizedBox(width: 5,),

                  ///Quantity
                  Consumer<ProductController>(builder: (context,value,child){
                    return Text("${value.productModelObj!.quantity}");
                  }),

                  const SizedBox(width: 5,),

                  GestureDetector(
                    onTap:(){
                      productControllerObj.removeQuantity();
                    },
                    child:const Icon(Icons.remove)
                  )
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_p_eco/pages/productsDetails.dart';
import 'package:provider/provider.dart';
import '../providers/productsp.dart';

class GridItems extends StatelessWidget {
  const GridItems({Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
       int selectedVal ;
   final product = Provider.of<Product>(context);
   final cart = Provider.of<Product>(context);
    return Consumer<Product>(
  builder: (context, product, _) {
    return Card(
elevation: 2.0,

 child: Hero(
  tag: product.id,
 child: GridTile(

  child:GestureDetector(
              onTap:() {
                Navigator.of(context).pushNamed(DetailsScreen.id,arguments:product.id);
              },
              child: 

              Image.asset(product.image ,    fit: BoxFit.fill,
                       
                   width: double.infinity, )),
              


                footer: Container(
                  height: 40,
                   color: Color.fromARGB(183, 255, 255, 255),
                  child: ListTile(

 
                      title: Text(product.price.toString() + " KWD"),
          
                  
                  

              trailing:
              
               IconButton(icon: product.isFavorite ? Icon(Icons.favorite): Icon(Icons.favorite_border),
          onPressed:() { product.toggleIsFav(); },
          ),
                  ),
                  
                      ),

               
   header: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: ListTile(
                        leading: Text(
                          product.title,
                          style: TextStyle(fontWeight:FontWeight.w800,  color: Color.fromARGB(255, 227, 113, 105),fontSize: 16 ),
                        ),
                        
    trailing:   Padding(padding: EdgeInsets.only(bottom: 10),
                   child : IconButton(icon:Icon(Icons.shopping_cart),
          onPressed:() {
          cart.addItem(productId: product.id,title: product.title,price: product.price);
          },),
          )
                    ),
                    
                    
                  ),
                  
             
                  ),
                  
            ),
          );
  });
 
  }
}


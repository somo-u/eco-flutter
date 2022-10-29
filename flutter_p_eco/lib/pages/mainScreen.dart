import 'package:flutter/material.dart';
import 'package:flutter_p_eco/pages/cartScreen.dart';
import 'package:flutter_p_eco/pages/productsDetails.dart';
import 'package:provider/provider.dart';
import '../providers/cartp.dart';
import '../providers/productsp.dart';
import 'details.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context);
   final cart = Provider.of<Cart>(context);
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
          
                  
                    trailing: IconButton(icon: product.isFavorite ? Icon(Icons.favorite , color: Color.fromARGB(255, 253, 96, 96),): Icon(Icons.favorite_border),
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
                          trailing: 
                   Padding(padding: EdgeInsets.only(bottom: 10 ,),
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







class HomeScreen extends StatefulWidget {
  static const id = '/MainShoppingScreen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  bool showFav = false;

  @override
     final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Color.fromARGB(255, 247, 247, 247),

  primary:  Color(0xffE56B6F),
  minimumSize: Size(40,40),
  padding: EdgeInsets.symmetric(horizontal: 30),
  shape: const RoundedRectangleBorder(
  ),
);
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),

  
        appBar: AppBar(
        toolbarHeight: 80,
elevation: 0,
backgroundColor: Color.fromARGB(255, 255, 255, 255),
 
          actions: [
   

             Padding( padding: EdgeInsets.only(right: 15),
    
        
 
   child: PopupMenuButton(
              onSelected: (int selectedVal) {
                if (selectedVal == 1) {
                  setState(() {
                   showFav = false;
                  });
                }
                if (selectedVal == 2) {
                  setState(() {
                    Navigator.of(context).pushNamed(CartScreen.id);
                  });
                }

                 if (selectedVal == 3) {
                  setState(() {
                 
                    showFav = true;
                  });
                }
              },
              icon: Icon(Icons.menu , color: Color.fromARGB(255, 255, 97, 97), size: 32, ),
              
            
              itemBuilder: (_) {
                return [
                  PopupMenuItem(child: Text('Home'), value: 1),
                     PopupMenuItem(child: Text('Cart'), value: 2),
                   PopupMenuItem(child: Text('Favorites'), value: 3),
                
                ];
   } ), ),
       ], ),
        body: 
        Column(children: [
          Padding(padding: EdgeInsets.only(left: 15),
           child:Text(
  "Hello It's CrazyTown Pastries 👋",
    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500,  color: Color(0xffE56B6F)),
   ) ,
   ),
    

 
 SizedBox(height: 0),
     
           

                        Row(children: [
                          Padding(padding: const EdgeInsets.only(left: 15 , top: 20),
                          child:
 Text("Our Products", style:  TextStyle(fontSize: 30 ,  color: Color.fromARGB(255, 53, 53, 53) , fontWeight:FontWeight.bold),),
  ),

  ],

  ),

 SizedBox(height: 25),

              Container(
                height: 500, 

                child:  ProductsGrid(
          isFav: showFav,
        ),
              ),
    
        ], 
              ),
              ),
              );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.isFav,
  }) : super(key: key);

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productDate = Provider.of<Products>(context);
    final availProducts =
        isFav ? productDate.favoriteProducts : productDate.availProducts;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: availProducts.length,
      itemBuilder: (contex, index) {
        return ChangeNotifierProvider<Product>.value(
          value: availProducts[index],
          
          child: GridProductItem(
             
              ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1/ 1,

        mainAxisSpacing: 20,
      ),
      
    );
 
      }
    }
        
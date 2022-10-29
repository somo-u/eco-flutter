import 'package:flutter/material.dart';


class CartItem {
  final String id;
  final String title;
  final String price;
  final int qty;

  CartItem({
 required this.id,
 required this.title,
 required this.price,
 required this.qty,
});
}

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.isFavorite = false,
});




  void toggleIsFav(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void addItem({required String productId, required String title, required double price}) {}

}

class Products with ChangeNotifier{

   List<Product> theProducts = [
    Product(
        id: '0',
        title: 'Croissant',
   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        image: 'assets/b4.jpg',
        price: 3.5
        ),
    Product(
        id: '1',
        title: 'Egg toast',
   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        image: 'assets/b5.jpg',
        price:2.9,),
    Product(
        id: '2',
        title: 'Tiramisu',
   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        image: 'assets/s2.jpg',
        price: 3),
         Product(
        id: '3',
        title: 'Macroons',
   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        image: 'assets/s6.jpg',
        price: 3.5,),
    Product(
        id: '4',
        title: 'Amaricano',
   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        image: 'assets/c2.jpg',
        price: 1.6,),
    Product(
        id: '5',
        title: 'latte',
   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        image: 'assets/c4.jpg',
        price: 2.7),
        
  ];

   List<Product>get favoriteProducts{
     return theProducts.where((product)=> product.isFavorite).toList();
   }

   List<Product> get availProducts => theProducts;

   void addProduct(value){
     theProducts.add(value);
     notifyListeners();
   }

   Product theId(String id){
     return theProducts.firstWhere((product)=> product.id == id);
   }
}




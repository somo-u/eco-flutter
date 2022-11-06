import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cartp.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({Key? key, required this.id, required this.title, required this.productId, required this.price, required this.qty}) : super(key: key);

  final String id;
  final String title;
  final String productId;
  final String price;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: ListTile(
       
        title:Text(title.toString(), style: TextStyle(fontSize: 20),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Text('Total price : ${double.parse(price) * qty}', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 242, 139, 153)))
          ],
        ),
        trailing:IconButton(
          icon: Icon(Icons.delete),
          onPressed: (){
            Provider.of<Cart>(context,listen: false).removeItem(productId);
          },
        ),
    ),
    );
  }
}

class CartScreen extends StatelessWidget {
  static const id = '/CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 97, 97),
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total :', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                  Spacer(),
             Text(cart.totalToPay.toString()+" KWD" , style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500 ,color: Color.fromARGB(255, 242, 139, 153)),),

         ], ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => CartProducts(
                      id: cart.items.values.toList()[index].id,
                      title: cart.items.values.toList()[index].title,
                      price: cart.items.values.toList()[index].price,
                      qty: cart.items.values.toList()[index].qty,
                      productId: cart.items.keys.toList()[index],
                    )),
          ),
        ],
      ),
    );
  }
}

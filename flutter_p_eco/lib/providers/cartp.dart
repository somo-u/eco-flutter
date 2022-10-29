import 'package:flutter/material.dart';

class MytItems {
  final String id;
  final String title;
  final String price;
  final int qty;

  MytItems({
 required this.id,
 required this.title,
 required this.price,
 required this.qty,
});
}

class Cart with ChangeNotifier{
  Map<String, MytItems> _items = {};

  Map<String, MytItems>get items{
    return{..._items};
  }

  void addItem({required String productId, price, title}){
    if(_items.containsKey(productId)){
      _items.update(productId,(value)=>
          MytItems(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty +1
          ));
      notifyListeners();
    }else{
      _items.putIfAbsent(productId,()=> MytItems(
        id: DateTime.now().toString(),
        title: title.toString(),
        price: price.toString(),
        qty: 1,
      ));
      notifyListeners();
    }


}

  double get totalToPay{
    double total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.qty;
     });
    return total;
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart(){
    _items = {};
    notifyListeners();
  }

}
import 'package:flutter/foundation.dart';

class Cart{
  final String id;
  final String title;
  final int quantity;
  final int price;

  Cart({required this.id, required this.price, required this.title, required this.quantity});


}
// var itemcount=0;

class CartItem with ChangeNotifier{
  Map<String, Cart> _items={};

  Map get items{
    return {..._items};
  }

  void addtocart(String id, String title, int price)
  {
    if(_items.containsKey(id))
    {
      _items.update(id, (value) => Cart(id: value.id, price: value.price, title: value.title, quantity: value.quantity+1));
    }
    else{
      _items.putIfAbsent(id, () => Cart(id: DateTime.now().toString(), price: price, title: title, quantity: 1));
    }
 
    // print("object");
    

  }
  int totalamount()
  { var total=0;
    _items.forEach((key, CartItem) {
      total+=CartItem.price*CartItem.quantity;
    });
    return total;
  }
  void itemdelete(String id)
  {
   
    _items.remove(id);
    
    notifyListeners();

  }


  String get itemcounts
  {
    // notifyListeners();
    return _items.length.toString();
    
    
  }

  void clearCart()
  {
    _items={};
    notifyListeners();
  }
  


}
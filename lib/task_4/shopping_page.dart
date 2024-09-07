import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingBag(),
    );
  }
}

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {

  int pulloverQuantity = 1;
  int tshirtQuantity = 1;
  int dressQuantity = 1;

  final double pulloverPrice = 51.0;
  final double tshirtPrice = 30.0;
  final double dressPrice = 43.0;

  // Calculate total amount
  double getTotalAmount() {
    return (pulloverQuantity * pulloverPrice) +
        (tshirtQuantity * tshirtPrice) +
        (dressQuantity * dressPrice);
  }


  bool isCartEmpty() {
    return pulloverQuantity == 0 && tshirtQuantity == 0 && dressQuantity == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: Center(
        child: SingleChildScrollView(

         child: Column( children: [
           buildCartItem("Pullover", pulloverPrice, pulloverQuantity, (newQuantity) {
             setState(() {
               pulloverQuantity = newQuantity;
             });
           }),
           buildCartItem("T-Shirt", tshirtPrice, tshirtQuantity, (newQuantity) {
             setState(() {
               tshirtQuantity = newQuantity;
             });
           }),
           buildCartItem("Sport Dress", dressPrice, dressQuantity, (newQuantity) {
             setState(() {
               dressQuantity = newQuantity;
             });
           }),

           // Total amount display
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Text(
               'Total amount: \$${getTotalAmount().toStringAsFixed(2)}',
               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
             ),
           ),

           // Checkout button
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: ElevatedButton(

               onPressed: isCartEmpty()
                   ? null
                   : () {

                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                     content: Text('Congratulations! You have checked out successfully!'),
                     duration: Duration(seconds: 2),
                   ),
                 );
               },
               child: Text('CHECK OUT'),
               style: ElevatedButton.styleFrom(
                 backgroundColor: isCartEmpty() ? Colors.grey : Colors.red, // Change button color based on state
               ),
             ),
           ),
         ],),
        ),
      ),
    );
  }


  Widget buildCartItem(String itemName, double price, int quantity, Function(int) onQuantityChanged) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemName),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    onQuantityChanged(quantity - 1);
                  }
                },
              ),
              Text('$quantity'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  onQuantityChanged(quantity + 1);
                },
              ),
            ],
          ),
          Text("\$${(price * quantity).toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}

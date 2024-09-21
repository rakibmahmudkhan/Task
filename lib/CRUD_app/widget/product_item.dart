import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task/CRUD_app/models/product.dart';
import 'package:task/CRUD_app/screen/edit_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.8)),
      tileColor: Colors.white,
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product code :${product.productCode}"),
          Text("Price : ${product.unitPrice}"),
          Text("Quantity: ${product.quantity}"),
          Text("Total Price : ${product.totalPrice}"),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditProductScreen(
                        productId: product.id,
                        productName: product.productName,
                        unitPrice: product.unitPrice,
                        totalPrice: product.totalPrice,
                        productImg: product.productImage,
                        productCode: product.productCode,
                        productQuantity: product.quantity);
                  }));
                },
                icon: const Icon(Icons.edit),
                label: const Text("Edit"),
              ),
              TextButton.icon(
                onPressed: () {
                  _showDeleteConfirmationDialog(
                      context, product.productName, product);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                label: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void _showDeleteConfirmationDialog(
    BuildContext context, String productName, Product product) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this product?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              deleteProduct(
                productName: productName,
                context: context,
                myProduct: product,
              );

              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

Future<void> deleteProduct({
  Product? myProduct,
  BuildContext? context,
  String? productName,
}) async {
  Uri uri = Uri.parse(
      'http://164.68.107.70:6060/api/v1/DeleteProduct/${myProduct!.id}');

  Response response = await get(uri);
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    _deleteProduct(context!, productName);
  }
}

void _deleteProduct(BuildContext context, String? productName) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${productName} has been deleted.'),
      backgroundColor: Colors.red,
    ),
  );
}

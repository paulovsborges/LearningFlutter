import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.cyan),
      child: const Center(
        child: Text(
          'Shopping list',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      {required this.callback, required this.inCart, required this.product})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback callback;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {

    if(!inCart) return null;

    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callback(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
              callback: _handleCartChanged,
              inCart: _shoppingCart.contains(product),
              product: product);
        }).toList(),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: ShoppingList(products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Blueberry'),
        ]),
      ),
    );
  }
}

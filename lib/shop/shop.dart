import 'package:flutter/material.dart';
import 'package:flutter_drawer_example/shop/model/cart_model.dart';
import 'package:flutter_drawer_example/shop/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Shop());
}

class Shop extends StatelessWidget {
  const Shop({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

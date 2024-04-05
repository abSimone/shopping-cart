import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/ui/widgets/product_list_item.dart';
import 'package:shopping_cart/ui/widgets/profile_drawer.dart';

final _firebase = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<Product> productList;

  @override
  void initState() {
    super.initState();
    productList = [];
  }

  void _onLogOut() {
    _firebase.signOut();
  }

  void retrieveData() async {
    final List<Product> temp = [];
    final res = await db.collection("products").get();
    for (final doc in res.docs) {
      final map = doc.data();
      temp.add(Product.map(doc.id,
          name: map["name"],
          price: map["price"],
          category: Category.values
              .where((element) => element.name == map["category"])
              .first));
    }

    setState(() {
      productList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    retrieveData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        title: Text(
          "Available products",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme
              .of(context)
              .colorScheme
              .onPrimary),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              //   Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: badges.Badge(
                // position: badges.BadgePosition.topEnd(),
                badgeContent: const Text(
                  "0",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_basket,
                  size: 28,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        height: 300,
                        padding: const EdgeInsets.all(16),
                        key: ValueKey(productList[index]),
                        child: ProductListItem(
                          product: productList[index],
                        ),
                      ),
                  childCount: productList.length)),
        ],
      ),
      drawer: ProfileDrawer(logOut: _onLogOut),
    );
  }
}

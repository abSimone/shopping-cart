import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: const NetworkImage(url),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 200,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.6),
                        ),
                        Text(
                          product.price.toStringAsFixed(2),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.6)),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                // IconButton(
                //     onPressed: () {
                //       ref.read(cartProvider.notifier).addToCart(product);
                //       ScaffoldMessenger.of(context).clearSnackBars();
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //         content: const Text("Added to cart."),
                //         action: SnackBarAction(
                //           onPressed: () {
                //             ref
                //                 .read(cartProvider.notifier)
                //                 .decreaseQuantityOf(product);
                //           },
                //           label: "UNDO",
                //         ),
                //       ));
                //     },
                //     icon: const Icon(Icons.add_shopping_cart)),
              ],
            ),
          ),
        )
      ],
    );
  }
}



const url =
    "https://i1.wp.com/potafiori.com/wp-content/uploads/2020/04/placeholder.png?ssl=1";

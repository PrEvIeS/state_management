import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int productCount;

  const CartButton({super.key, required this.productCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_cart),
        if (productCount > 0)
          Positioned(
            right: -8,
            bottom: -8,
            child: SizedBox(
              width: 20,
              height: 20,
              child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          productCount.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
      ],
    );
  }
}

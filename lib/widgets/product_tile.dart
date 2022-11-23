import 'package:flutter/material.dart';
import 'package:state_management/models/product_list.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final String url in product.images)
                          SizedBox(
                            width: constraints.maxWidth,
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                            ),
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Text(product.title,maxLines: 1,),
        ],
      ),
    );
  }
}

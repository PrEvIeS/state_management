import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/product_list.dart';
import 'package:state_management/utils/cart_helper.dart';
import 'package:state_management/widgets/cart_button_widget.dart';
import 'package:state_management/widgets/product_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartHelper>(
      create: (_) => CartHelper(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'State Management Application'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: FutureBuilder<ProductListModel>(
          future: context.watch<CartHelper>().getProducts(),
          builder: (
              BuildContext context,
              AsyncSnapshot<ProductListModel> snapshot,
              ) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: snapshot.data!.limit,
              itemBuilder: (_, int index) {
                return GestureDetector(
                  onTap: context.watch<CartHelper>().addToCart,
                  child: ProductTile(product: snapshot.data!.products[index]),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Open Cart',
        onPressed: () {},
        child: Consumer<CartHelper>(
          builder: (context, state, child) => CartButton(
            productCount: state.counter,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

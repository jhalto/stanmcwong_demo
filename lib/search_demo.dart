import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchDemo extends StatefulWidget {
  const SearchDemo({super.key});

  @override
  State<SearchDemo> createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {


   TextEditingController textEditingController = TextEditingController();
    
    var products = [
      Products(name: "Maya", price: "2000", category: "Book"),
      Products(name: "Maya", price: "2000", category: "Cook"),
      Products(name: "Maya", price: "2000", category: "Roof"),
      Products(name: "Maya", price: "2000", category: "Commercial"),
      Products(name: "Maya", price: "2000", category: "Book"),
      Products(name: "Maya", price: "2000", category: "cook"),
      Products(name: "Maya", price: "2000", category: "Book"),

    ];
    
     var filteredProducts =  [];
     @override
  void initState() {
    filteredProducts = products;
    super.initState();
  }

   void filteringProducts(String category){
         setState(() {
           filteredProducts = products.where((element) => element.category.toLowerCase().contains(category.toLowerCase()),).toList();
         });
   }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    print(screenHeight);
    print(screenWidth);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Search demo"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                   controller: textEditingController,
                   onChanged: (value) {
                     filteringProducts(value);
                   },
                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                return ListTile(
                    title: Text(filteredProducts[index].name),
                    subtitle: Text(filteredProducts[index].category),
                    trailing: Text(filteredProducts[index].price),
                );
              },))
            ],
          ),
      ),
    );
  }
}

class Products{
  String name;
  String price;
  String category;
  Products({required this.name,required this.price,required this.category});
}
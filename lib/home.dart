import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
   FocusNode focusNode = FocusNode();
   int selectedIndex = 0;
   int selectedIndex2 = 0;
    final List<Product> products = [
    Product(name: 'Product 1', price: 10.0, category: 'Food'),
    Product(name: 'Product 2', price: 25.0, category: 'Cook'),
    Product(name: 'Product 3', price: 15.0, category: 'Commercial'),
    Product(name: 'Product 4', price: 30.0, category: 'Roof'),
    Product(name: 'Product 5', price: 20.0, category: 'Food'),
  ];
   
    String filterPrice = '';
    
  List<Product> filteredProducts = [];
  List<String> categories = ['All', 'Food', 'Cook', 'Commercial', 'Roof'];
  String selectedCategory = 'All';

   
    @override
  void initState() {
    // Initialize the filtered 
    // list with all products
    filteredProducts = products; 
    super.initState();
  }
  
    void filterProductsByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        filteredProducts = products;
      } else {
        filteredProducts =
            products.where((product) => product.category == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Practice"),
          ),
            resizeToAvoidBottomInset: true,
           body: SingleChildScrollView(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xffC69297),
                      ),
             
                    ),
                     child: Row(
                      children: [
                         Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            child: Container(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                  color: selectedIndex ==0? Color(0xffE52235):Colors.transparent,
                                  borderRadius: BorderRadius.circular(24)
                                ),
                            child: Center(child: Text("Sell",style: TextStyle(color: selectedIndex==0? Colors.white:Colors.black),)),
                                               ),
                          )),
                           SizedBox(width: 10,),
                           Expanded(
                            
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedIndex =1;
                                });
                              },
                              child: Container(
                              
                                decoration: BoxDecoration(
                                  color: selectedIndex ==1? Color(0xffE52235):Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7),
                                                  
                                                  child: Center(child: Text("Lease",style: TextStyle(color: selectedIndex==1? Colors.white:Colors.black),)),
                                                 ),
                            )),
                      ],
                     ),
                   ),
                    SizedBox(height: 10,),
                    Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xffC69297),
                      ),
             
                    ),
                     child: Row(
                      children: [
                         Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex2 = 0;
                              });
                            },
                            child: Container(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                  color: selectedIndex2 ==0? Color(0xffE52235):Colors.transparent,
                                  borderRadius: BorderRadius.circular(24)
                                ),
                            child: Center(child: Text("Takeover",style: TextStyle(color: selectedIndex2==0? Colors.white:Colors.black),)),
                                               ),
                          )),
                           SizedBox(width: 10,),
                           Expanded(
                            
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedIndex2 =1;
                                });
                              },
                              child: Container(
                              
                                decoration: BoxDecoration(
                                  color: selectedIndex2 ==1? Color(0xffE52235):Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7),
                                                  
                                                  child: Center(child: Text("Franchise",style: TextStyle(color: selectedIndex2==1? Colors.white:Colors.black),)),
                                                 ),
                            )),
                            Expanded(
                            
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedIndex2 =2;
                                });
                              },
                              child: Container(
                              
                                decoration: BoxDecoration(
                                  color: selectedIndex2 ==2? Color(0xffE52235):Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7),
                                                  
                                                  child: Center(child: Text("Partnership",style: TextStyle(color: selectedIndex2==2? Colors.white:Colors.black),)),
                                                 ),
                            )),
                      ],
                     ),
                   ),
                   
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedCategory,
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      filterProductsByCategory(value);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Filtered Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var product in filteredProducts)
                _buildProductCard(product, context),
               
              ],
             ),
           ),
        ),
      ),
    );
  }
   Widget _buildProductCard(Product product, BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Price: Rs.${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 5),
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

}
class Product {
  final String name;
  final double price;
  final String category;

  Product({required this.name, required this.price, required this.category});
}

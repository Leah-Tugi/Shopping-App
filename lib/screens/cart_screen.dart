import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/services/api_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),

      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData){
          //return Text('success');
            List products = snapshot.data['products'];
           return  ListView.builder(
                itemCount: products.length,
               itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: ApiService().getSingleProduct(products[index]['productId']),
                          builder: (context, AsyncSnapshot asyncsnapshot){
                      if (asyncsnapshot.hasData){
                        return ListTile(
                          title: Text(asyncsnapshot.data['title']),
                          leading: Image.network(asyncsnapshot.data['image'],height: 40),
                          subtitle: Text('Quantity -' +products[index]['quantity'].toString()),
                          trailing: IconButton(onPressed: (){},
                              icon: Icon(Icons.delete_outline,
                              color: Colors.red,)),

                        );
                      }
                      return LinearProgressIndicator();
                          });
               });


          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.green,
          child: Center(
            child: Text("Order Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),),
          ),
      ),
    );
  }
}

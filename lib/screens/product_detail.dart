import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/services/api_service.dart';

class ProductDetails extends StatelessWidget {
 final int id;
 ProductDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
       body: FutureBuilder(
         future: ApiService().getSingleProduct(id),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
         if (snapshot.hasData){
           return SingleChildScrollView(
             child: Container(
               margin: EdgeInsets.all(20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Image.network(snapshot.data['image'],
                   height: 200,
                     width: double.infinity,
                   ),
                   Center(
                     child: Text("\$" +snapshot.data['price'].toString(), style:TextStyle(fontSize: 25)),
                   ),
                   SizedBox(height: 10,),
                   Text(snapshot.data['title'],
                   style: TextStyle(
                     fontSize: 20,
                   ),),
                   Chip(label: Text(snapshot.data['category'].toString(),
                   style: TextStyle(fontSize: 15,
                   color: Colors.white),
                   ),
                   backgroundColor: Colors.blueGrey,),
                   SizedBox(height: 10,),
                   Text(snapshot.data['description'], style: TextStyle(
                     height: 1.5
                   ),)

                 ],
               ),
             ),
           );
         }
          return Center(
            child: CircularProgressIndicator(),
          );
         },

       ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart_outlined),
        onPressed: () {  },
        backgroundColor: Colors.green,

      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

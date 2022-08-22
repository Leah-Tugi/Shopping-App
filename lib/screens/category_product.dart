import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_detail.dart';
import 'package:shopping_app/services/api_service.dart';

class CategoryProductScreen extends StatelessWidget {
  final String categoryName;
  CategoryProductScreen(this.categoryName);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getProbuctByCategory(categoryName),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle: Text("Price - \$${snapshot.data[index]['price']}"),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(snapshot.data[index]['id'])));
                    } ,

                  );

                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },

      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/all_category.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/product_detail.dart';
import 'package:shopping_app/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory()));
          },
              icon: Icon(Icons.view_list_rounded)),

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
              icon: Icon(Icons.shopping_cart_outlined))
        ],



      ),
      body: FutureBuilder(
        future: ApiService().getAllPosts(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Center(
              child: ListView.builder(
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

                  }) ,
            );

          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

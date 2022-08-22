
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
   Future getAllPosts()  async{
     final allProductUrl = Uri.parse("https://fakestoreapi.com/products") ;
     final response = await http.get(allProductUrl);
     // print( response.statusCode);
     // print(response.body);
      return json.decode(response.body);
}

   Future getSingleProduct(int id)  async{
     final allProductUrl = Uri.parse("https://fakestoreapi.com/products/$id") ;
     final response = await http.get(allProductUrl);
     //print( response.statusCode);
     //print(response.body);
     return json.decode(response.body);
   }
   Future getAllCategory()  async{
     final allCategoryUrl = Uri.parse("https://fakestoreapi.com/products/categories") ;
     final response = await http.get(allCategoryUrl);
     //print( response.statusCode);
     //print(response.body);
     return json.decode(response.body);
   }

   Future getProbuctByCategory( String catName)  async{
     final fetchproductByCategoryUrl = Uri.parse("https://fakestoreapi.com/products/category/$catName") ;
     final response = await http.get(fetchproductByCategoryUrl);
     print( response.statusCode);
     print(response.body);
     return json.decode(response.body);
   }

   Future getCart( String userId)  async{
     final fetchCartProducts = Uri.parse("https://fakestoreapi.com/carts/$userId") ;
     final response = await http.get(fetchCartProducts);
     print( response.statusCode);
     print(response.body);
     return json.decode(response.body);
   }


   //POST REQUEST
Future userLogin(String username, String password) async // strings it will accept
{
 final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
 final response = await http.post(loginUrl, body: {
   'username':username,
   'password':password,
 });
 print( response.statusCode);
 print(response.body);
 return json.decode(response.body);
}
}
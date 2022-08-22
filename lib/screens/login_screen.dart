import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/services/api_service.dart';

class LoginScreen extends StatelessWidget {

   TextEditingController nameController =TextEditingController(text: "mor_2314" );
  TextEditingController passwordController =TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(

              )
            ),
          ),
            SizedBox(height: 30,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(


                  )
              ),
            ),
            SizedBox(height: 30,),

            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton( onPressed: () async{
               final getToken = await ApiService().userLogin(nameController.text, passwordController.text);

               if(getToken['token']!= null){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("SUCCESS! your Token id is ${getToken['token']})"),
                 backgroundColor: Colors.green,
                 ));
                 Future.delayed(Duration(seconds:2),(){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                 });

               } else{
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Username or Password Incorrect"), backgroundColor: Colors.red));
               }
              },
              child: Text("Login",
              style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

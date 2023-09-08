import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String photoUrl;
  final String email;
  final String lastname;
  const DetailScreen({super.key, required this.name, required this.photoUrl, required this.email, required this.lastname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Center(child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(photoUrl),
            ),),
            SizedBox(height: 20,),
            Text('$name $lastname' ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
            Text(email,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      )
    );
  }
}

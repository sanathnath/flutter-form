import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_sample/model/ApiResponse.dart';
import 'package:http/http.dart' as http;

class ScreenHome extends StatefulWidget {
  String firstName;
  String lastName;

  ScreenHome({Key? key, required this.firstName, required this.lastName})
      : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${widget.firstName} ${widget.lastName}"),
      ),
      body: Center(
        child: FutureBuilder<ApiResponse>(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data!.title ?? "no data",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold

              ),);
            }else if (snapshot.hasError) {
            return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
    );
  }

  @override
  void initState(){
    // getData();
  }

  Future<ApiResponse> getData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if(response.statusCode == 200){
      return ApiResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load post');
    }
  }
}

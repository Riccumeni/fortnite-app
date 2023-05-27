import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/Skin.dart';
import 'model/Skins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fortnite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Skins> fetchSkins () async {

    var response = await http.get(Uri.parse("https://fortnite-api.com/v2/cosmetics/br"));

    var body = jsonDecode(response.body);

    return Skins.fromJson(body);
  }

  Future<Skins>? skinsFuture;

  @override
  void initState(){
    super.initState();

    skinsFuture = fetchSkins();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: skinsFuture,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Skin> skins = snapshot.data!.data;
            return ListView.builder(itemCount: skins.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    GestureDetector(
                        onTap: () => {

                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(skins[index].name),
                              Image.network(skins[index].images.icon, width: 100, height: 100,)
                            ],
                          ),
                        )
                    )
                  ],
                );
              },
            );
          }else{
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      )
    );
  }
}

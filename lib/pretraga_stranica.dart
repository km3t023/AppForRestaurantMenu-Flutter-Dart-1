// ignore_for_file: unused_import, depend_on_referenced_packages, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class PretragaStranica extends StatelessWidget {
  const PretragaStranica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pretraga',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          // ignore: deprecated_member_use
          accentColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: const PretraziStranica(),
    );
  }
}

class PretraziStranica extends StatefulWidget {
  const PretraziStranica({Key? key}) : super(key: key);

  @override
  State<PretraziStranica> createState() => _PretraziStranicaState();
}

class _PretraziStranicaState extends State<PretraziStranica> {
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('products')
        .where('makeArr', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  void filter(String value) async {
    final int? number = int.tryParse(value);
    final result = await FirebaseFirestore.instance
        .collection('products')
        .where('price', isGreaterThan: number)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      appBar: AppBar(
          toolbarHeight:MediaQuery.of(context).size.height/12,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
          ),
          ),
          backgroundColor: Colors.pink.shade200,
          title: const Text(
            "Pretraga",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        color: Colors.purple.shade700,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 50,
                right: 50,
              ),
              child: Card(
                color: Colors.pink.shade200,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Pretraži proizvode koji su skuplji od:",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.pink.shade200,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.pink.shade200,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  onChanged: (value) {
                    filter(value);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 50,
                right: 50,
                bottom: 25,
              ),
              child: Card(
                color: Colors.pink.shade200,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Pretraži",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.pink.shade200,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.pink.shade200,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  onChanged: (query) {
                    searchFromFirebase(query);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.pink.shade200,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: ListTile(
                      textColor: Colors.black,
                      title: Text(
                        searchResult[index]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black.withOpacity(.7)),),
                      subtitle: Text(searchResult[index]['make'] +
                          '\n' +
                          'Cena: ' +
                          searchResult[index]['price'].toString() +
                          ' rsd',  style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black.withOpacity(.7)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
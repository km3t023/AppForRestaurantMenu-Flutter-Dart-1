// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, unused_import, depend_on_referenced_packages, use_build_context_synchronously, unused_element, sort_child_properties_last, avoid_web_libraries_in_flutter

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pretraga_stranica.dart';

class PocetnaStranica extends StatefulWidget {
  const PocetnaStranica({super.key});

  @override
  State<PocetnaStranica> createState() => _PocetnaStranicaState();
}

class _PocetnaStranicaState extends State<PocetnaStranica> {

  bool _sortAscending = true;
  late Query _query;

  @override
  void initState() {
    super.initState();
    _query = _products.orderBy('price', descending: !_sortAscending);
  }

  final korisnik = FirebaseAuth.instance.currentUser!;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _makeController = TextEditingController();
  final CollectionReference _products =
  FirebaseFirestore.instance.collection('products');

  final Query _productss =
  FirebaseFirestore.instance.collection("products").orderBy('price');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    _nameController.text = '';
    _priceController.text = '';
    _makeController.text = '';
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Colors.pink.shade200,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'NAZIV PROIZVODA',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: _makeController,
                    decoration: InputDecoration(
                      labelText: 'SASTAV PROIZVODA',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'CENA PROIZVODA',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),

                  ),
                  const SizedBox(
                    height: 50,
                  ),
                 Center(
                          child: SizedBox(
                          height:50, //height of button
                          width:150,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.purple.shade700,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 15.0,
                          ),
                    child: const Text(
                      'DODAJ',
                        style: TextStyle(fontSize: 18,color: Colors.black),
                      ),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final int? price = int.tryParse(_priceController.text);
                      final String make = _makeController.text;
                      List searchList = [];
                      for (var i = 1; i <= make.length; i++) {
                        var nextEl = make.substring(0, i).toLowerCase();
                        searchList.add(nextEl);
                        nextEl = make.substring(0, i);
                        searchList.add(nextEl);
                      }

                      if (price != null) {
                        await _products.add({
                          "name": name,
                          "price": price,
                          "make": make,
                          'makeArr': searchList,
                        });

                        _nameController.text = '';
                        _priceController.text = '';
                        _makeController.text = '';

                        Navigator.of(context).pop();
                      }
                    },
          ),
          ),
                 )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
      _makeController.text = documentSnapshot['make'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Colors.pink.shade200,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 50,
                  right: 50,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'NAZIV PROIZVODA',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: _makeController,
                    decoration: InputDecoration(
                      labelText: 'NAZIV PROIZVODA',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'NAZIV PROIZVODA',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                  child: SizedBox(
                  height:50, //height of button
                  width:150,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.purple.shade700,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                  ),
                    child: const Text(
                      'IZMENI',
                      style: TextStyle(fontSize: 18,color: Colors.black),
                    ),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final int? price = int.tryParse(_priceController.text);
                      final String make = _makeController.text;
                      List searchList = [];
                      for (var i = 1; i <= make.length; i++) {
                        var nextEl = make.substring(0, i).toLowerCase();
                        searchList.add(nextEl);
                        nextEl = make.substring(0, i);
                        searchList.add(nextEl);
                      }

                      if (price != null) {
                        await _products.doc(documentSnapshot!.id).update({
                          "name": name,
                          "price": price,
                          "make": make,
                          "makeArr": searchList,
                        });
                        _nameController.text = '';
                        _priceController.text = '';
                        _makeController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Uspešno ste obrisali ovaj proizvod')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade700,
        appBar: AppBar(
          toolbarHeight:MediaQuery.of(context).size.height/12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink.shade200,
          foregroundColor: Colors.pink.shade200,
          actions: <Widget>[
            IconButton(
              icon: _sortAscending ? Icon(Icons.arrow_upward) : Icon(Icons.arrow_downward),
              color: Colors.black,
              onPressed: (){
                setState(() {
                  _sortAscending = !_sortAscending;
                  _query = _products.orderBy('price', descending: !_sortAscending);
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PretraziStranica()),
                );
              },
            ),
          ],
          title:   new Image.asset(
            'img/logocake.png',
            width: 100.0,
            height: 90.0,
          ),
          leading: GestureDetector(
            onTap: (() {
              FirebaseAuth.instance.signOut();
            }),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Izloguj se',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.purple.shade700,
          child: StreamBuilder(
            stream: _query.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return Card(
                      color: Colors.pink.shade200,
                      margin: const EdgeInsets.all(11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: ListTile(
                        title: Text(documentSnapshot['name'],style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black.withOpacity(.7)),),
                        subtitle: Text(documentSnapshot['make'] +
                            '\n' +
                            'Cena: ' +
                            documentSnapshot['price'].toString() +
                            ' din',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black.withOpacity(.7)),
                        ),
                        leading: SizedBox(
                            width: 48,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                            IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.purple.shade700,
                            onPressed: () => _update(documentSnapshot)),
                                ],
                            ),
                        ),
                        trailing: SizedBox(
                          width: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.purple.shade700,
                                  onPressed: () =>
                                      _delete(documentSnapshot.id)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.purple.shade700,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat);
  }
}
// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poslasticarnica/welcome_page.dart';
import 'package:flutter/material.dart';

class RegistracijaStranica extends StatefulWidget {
  final VoidCallback prikaziLoginStranicu;
  const RegistracijaStranica({
    Key? key,
    required this.prikaziLoginStranicu,
  }) : super(key: key);

  @override
  State<RegistracijaStranica> createState() => _RegistracijaStranicaState();
}

class _RegistracijaStranicaState extends State<RegistracijaStranica> {
  final _emailKontroler = TextEditingController();
  final _lozinkaKontroler = TextEditingController();
  final _lozinkaKontroler2 = TextEditingController();
  @override
  void dispose() {
    _emailKontroler.dispose();
    _lozinkaKontroler.dispose();
    _lozinkaKontroler2.dispose();
    super.dispose();
  }

  Future registrujSe() async {
    if (potvrdjivacLozinke()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailKontroler.text.trim(),
          password: _lozinkaKontroler.text.trim());
    }
  }

  bool potvrdjivacLozinke() {
    if (_lozinkaKontroler.text.trim() == _lozinkaKontroler2.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              new Image.asset(
                'img/logocake.png',
                width: 600.0,
                height: 220.0,
              ),
              SizedBox(height: 10),
              Text(
                'Registracija',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.pink.shade200,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Molimo vas unesite tačne podatke.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink.shade200,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade200,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.black.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextField(
                      style: TextStyle(color: Colors.purple.shade700),
                      controller: _emailKontroler,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.purple.shade700),
                          prefixIcon: Icon(Icons.email, color:Colors.purple.shade700),
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade200,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.black.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextField(
                      style: TextStyle(color: Colors.purple.shade700),
                      controller: _lozinkaKontroler,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.purple.shade700),
                          prefixIcon: Icon(Icons.password_outlined, color:Colors.purple.shade700),
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade200,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.black.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextField(
                      style: TextStyle(color: Colors.purple.shade700),
                      controller: _lozinkaKontroler2,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Ponovite password",
                          hintStyle: TextStyle(color: Colors.purple.shade700),
                          prefixIcon: Icon(Icons.password_outlined, color:Colors.purple.shade700),
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: registrujSe,
                  child: Container(
                    width: w*0.5,
                    height: h*0.082,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                          'Registrujte se',
                          style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Već ste se registrovali?',
                    style: TextStyle(
                        color: Colors.pink.shade200,
                        fontSize: 20
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.prikaziLoginStranicu,
                    child: Text(
                      ' Prijavite se',
                      style: TextStyle(
                          color: Colors.amber.shade900,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
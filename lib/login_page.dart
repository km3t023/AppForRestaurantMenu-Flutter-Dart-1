// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, annotate_overrides, unused_import, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poslasticarnica/welcome_page.dart';
import 'package:flutter/material.dart';

class LoginStranica extends StatefulWidget {
  final VoidCallback prikaziStranicuZaRegistraciju;
  const LoginStranica({Key? key, required this.prikaziStranicuZaRegistraciju})
      : super(key: key);

  @override
  State<LoginStranica> createState() => _LoginStranicaState();
}

class _LoginStranicaState extends State<LoginStranica> {
  final _emailKontroler = TextEditingController();
  final _lozinkaKontroler = TextEditingController();
  Future prijava() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailKontroler.text.trim(),
      password: _lozinkaKontroler.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailKontroler.dispose();
    _lozinkaKontroler.dispose();
    super.dispose();
  }

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
              SizedBox(height: 20),
              Text(
                'Dobrodošli!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color:Colors.pink.shade200,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Molimo vas da se prijavite',
                style: TextStyle(
                  fontSize: 22,
                  color:Colors.pink.shade200,
                ),
              ),
              SizedBox(height: 30),
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
              SizedBox(height: 30,),
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
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: prijava,
                  child: Container(
                    width: w*0.5,
                    height: h*0.072,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                          'Prijavite se',
                          style: TextStyle(
                              color: Colors.purple.shade700,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Novi ste korisnik?',
                    style: TextStyle(
                        color: Colors.pink.shade200,
                        fontSize: 20
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.prikaziStranicuZaRegistraciju,
                    child: Text(
                      ' Napravite nalog',
                      style: TextStyle(
                          color:Colors.pink.shade400,
                          fontSize: 20
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

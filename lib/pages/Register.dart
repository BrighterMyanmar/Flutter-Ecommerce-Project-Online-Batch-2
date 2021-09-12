import 'package:commerce/helper/TrianglePainter.dart';
import 'package:commerce/utils/Api.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var msize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: TrianglePainter(msize),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(child: Image.asset("assets/images/fm.png")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Register",
                      style: TextStyle(
                          fontSize: 35,
                          color: Constants.normal,
                          fontFamily: "English",
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: "Name",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal))),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal))),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        decoration: InputDecoration(
                            labelText: "Phone",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal))),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: "Password",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Constants.normal))),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Text("Already member ? \nLogin Here",
                                    style: TextStyle(
                                        fontFamily: "English",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Constants.normal)),
                              ),
                              SizedBox(height: 5),
                              Container(
                                  height: 5, width: 50, color: Constants.accent)
                            ],
                          ),
                          FlatButton(
                              color: Constants.secondary,
                              onPressed: () async {
                                var name = _nameController.text;
                                var email = _emailController.text;
                                var phone = _phoneController.text;
                                var pwrod = _passwordController.text;
                                var bol = await Api.register(
                                    name: name,
                                    email: email,
                                    phone: phone,
                                    password: pwrod);
                                if (bol) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12),
                                child: Row(
                                  children: [
                                    Icon(Icons.lock, color: Constants.primary),
                                    SizedBox(width: 10),
                                    Text("Register",
                                        style: TextStyle(
                                            color: Constants.primary,
                                            fontFamily: "English",
                                            fontSize: 18))
                                  ],
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

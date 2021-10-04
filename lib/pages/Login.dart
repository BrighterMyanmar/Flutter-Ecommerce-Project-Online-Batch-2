import 'package:commerce/helper/TrianglePainter.dart';
import 'package:commerce/pages/Register.dart';
import 'package:commerce/utils/Api.dart';
import 'package:commerce/utils/Components.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _phoneController = TextEditingController(text: "09200200200");
  var _passwordController = TextEditingController(text: "123123123");

  @override
  Widget build(BuildContext context) {
    var msize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: TrianglePainter(msize),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(child: Image.asset("assets/images/fm.png")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 45,
                          color: Constants.normal,
                          fontFamily: "English",
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register())),
                                child: Text("Not a member yet! \nRegister Here",
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
                                var phone = _phoneController.text;
                                var pwrod = _passwordController.text;
                                bool bol = await Api.login(
                                    phone: phone, password: pwrod);
                                if (bol) {
                                  Components.getSocket();
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
                                    Text("Login",
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

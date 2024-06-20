import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasklist/pages/registerpage.dart';
import 'package:tasklist/pages/taskspage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login to Proceed",
            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 28, 95, 107),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Email"),
                    validator: (value) {
                      if (value == null || 
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
                  child: Center(
                    child: SizedBox(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 27, 133, 151))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigate the user to the Home page
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TasksPage()),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill input')),
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Row(
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                OutlinedButton(  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  }, 
                  child: Text(
                    "Sign-up",
                    style: TextStyle(color: Color.fromARGB(255, 18, 156, 180)),
                  ),
                  style: OutlinedButton.styleFrom( side: BorderSide.none,),
                ),
              ],
            ),
          ),
                
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
                  child: Center(
                    child: Text("- - - - - - - - - - - - OR - - - - - - - - - - - -"),
                  ),
                ),

                Padding(
                  
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  child: Center(
                    child: SizedBox(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 27, 133, 151))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigate the user to the Home page
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TasksPage()),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill input')),
                            );
                          }
                        },
                        child: Center(
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: new Icon(MdiIcons.google),
                                style: const ButtonStyle( ),
                                onPressed: () {},
                              ),
                              const Text(
                                "Google",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
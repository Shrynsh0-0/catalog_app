import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> moveToHome(BuildContext context) async {
    setState(() => isLoading = true);
    final ctx = context;
    await Future.delayed(Duration(seconds: 1));
    if (!ctx.mounted) return;
    await Navigator.pushNamed(
      ctx,
      MyRoutes.homeRoute,
      arguments: {"username": name},
    );
    if (mounted) setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Welcome $name :)",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Username";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        }
                        else if (value.length < 8) {
                          return "Password Must have 8 Characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: isLoading ? 50 : 85,
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              isLoading ? 20 : 5,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            moveToHome(context);
                          }
                        },
                        child: isLoading
                            ? Icon(Icons.done, size: 25)
                            : Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

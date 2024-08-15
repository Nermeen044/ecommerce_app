import 'package:ecommerce_app/pages/home.dart';
import 'package:flutter/material.dart';
// Assuming you have a Signup page defined

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Added padding to avoid edge cases
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35), // Fixed SizedBox usage
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontFamily: 'fontyy',
                  color: Color.fromARGB(255, 9, 9, 9),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Login To Your Existing Account :)",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'fontyy',
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    "assets/images/loggooo-removebg-preview.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        Text('Remember Me'),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Implement your forgot password logic here
                            print('Forgot password pressed');
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          primary: Colors.purple, // background color
                          onPrimary: Colors.white, // text color
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            // Assuming login is successful, navigate to the home page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );

                            // Show a success message or perform further actions
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login successful!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Implement your Google login logic here
                            print('Google login pressed');
                          },
                          child: Image.asset(
                            'assets/images/google.jpg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            // Implement your Facebook login logic here
                            print('Facebook login pressed');
                          },
                          child: Image.asset(
                            'assets/images/face.jpg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "Signup");
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
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

import 'package:flutter/material.dart';
import 'package:team-maverickss/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _options = [
    "Child",
    "Parent",
  ];

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  const Text(
                    "Sign-In",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //1.image
                  Image.asset(
                    "assets/images/get1.png",
                    fit: BoxFit.cover,
                    height: 300,
                  ),

//2.sizedbox
//for spacing use Sizedbox
                  const SizedBox(
                    height: 24,
                  ),
                  //3.text widget
                  Text(
                    "Welcome $name",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //3.sizedbox
                  const SizedBox(
                    height: 24,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    child: Column(
                      children: [
                        FormField<String>(
                          builder: (FormFieldState<String> state) {
                            // ignore: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables
                            var _currentSelectedValue;
                            return InputDecorator(
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  labelText: 'Enter details',
                                  hintText: 'Choose an option',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              isEmpty: _currentSelectedValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _currentSelectedValue = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _options.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),

//username

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Username",
                            hintText: "Enter your username",
                          ),

                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username cannot be empty';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),

                        //password
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password must contain atleast 6 characters";
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  //Button
                  Material(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        alignment: Alignment.center,
                        height: 50,
                        width: changebutton ? 50 : 150,
                        child: changebutton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 37,
                              )
                            : const Text(
                                "Sign-In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

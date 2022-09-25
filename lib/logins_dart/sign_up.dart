import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _firstnameJK, _lastnameJK, _addressJK, _emailJK;

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confamPassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // //get User's info from filling of the forms....
  getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final getFirstname = prefs.getString("Write your First Name",);
    final getLastname = prefs.getString("Write your Last Name");
    final getAddress = prefs.getString("Write Your Address");
    final getEmail = prefs.getString('example@gmail.com');
    final getPassword = prefs.getString('password');
    final getconfamPassAJK = prefs.getString("Confirm Your password");


    setState(() {
      _firstnameJK = getFirstname!;
      _lastnameJK = getLastname!;
      _addressJK = getAddress!;
      _emailJK = getEmail!;
      _password.text = getPassword!;
      _confamPassword.text = getconfamPassAJK!;
    });
    if (kDebugMode) {
      print(getFirstname);
    }
    if (kDebugMode) {
      print(getLastname);
    }
    if (kDebugMode) {
      print(getAddress);
    }
    if (kDebugMode) {
      print(getEmail);
    }
    if (kDebugMode) {
      print(getPassword);
    }
    if (kDebugMode) {
      print(getconfamPassAJK);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  // toggle reveal password or not
  bool _isObscure = true;
  //Loader...
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading? const Center(
        child: CircularProgressIndicator(
          color: Colors.cyan,
        ),
      ):CustomScrollView(
        slivers: [
          //App Bar......
          SliverAppBar.medium(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.arrow_left),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xffE6CFE2),
            elevation: 0,
            title: const Text(
              "Sign Up",
              style: TextStyle(
                color: Color(0xff72567A),
                fontFamily: "Rubik",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          //rest of ui.....
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffE6CFE2),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Form(
                            key: _formkey,
                            child: Column(children: <Widget>[
                              //First name text form field......
                              Row(
                                //First name text....
                                children: const [
                                  Padding(padding: EdgeInsets.only(left: 13)),
                                  Text(
                                    "First name",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                // controller: firstnameJK,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter first name";
                                  }
                                  return null;
                                },
                                onSaved: (String? firstname) {
                                  _firstnameJK = firstname!;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  hintText: "Write your First Name",
                                  hintStyle: TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  suffixIcon:
                                  Icon(CupertinoIcons.person_crop_circle),
                                ),
                              ),

                              const SizedBox(
                                height: 13,
                              ),
                              //Last name text form field....
                              Row(
                                //Last name text....
                                children: const [
                                  Padding(padding: EdgeInsets.only(left: 13)),
                                  Text(
                                    "Last name",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                // controller: lastnameJK,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter last name";
                                  }
                                  return null;
                                },
                                onSaved: (String? lastname) {
                                  _lastnameJK = lastname!;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  hintText: "Write your Last Name",
                                  hintStyle: TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  suffixIcon:
                                  Icon(CupertinoIcons.person_crop_circle),
                                ),
                              ),

                              const SizedBox(
                                height: 13,
                              ),
                              //Address text form field....
                              Row(
                                // Address text....
                                children: const [
                                  Padding(padding: EdgeInsets.only(left: 13)),
                                  //Email Address Text
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                // controller: addressJK,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter valid address";
                                  }
                                  return null;
                                },
                                onSaved: (String? address) {
                                  _addressJK = address!;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  hintText: "Write Your Address",
                                  hintStyle: TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  suffixIcon: Icon(CupertinoIcons.map),
                                ),
                              ),

                              //Email Address text form field....
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                // Email address text....
                                children: const [
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  //Email Address Text
                                  Text(
                                    "Email Address",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                // controller: emailJK,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter email address";
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please enter valid email address";
                                  }
                                  return null;
                                },
                                onSaved: (String? email) {
                                  _emailJK = email!;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  hintText: "example@gmail.com",
                                  hintStyle: TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  suffixIcon: Icon(CupertinoIcons.mail_solid),
                                ),
                              ),

                              //Password field
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                //Password text....
                                children: const [
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _password,
                                obscureText: _isObscure,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  hintText: "password",
                                  hintStyle: const TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  helperStyle: const TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  suffixIcon: CupertinoButton(
                                      child: Icon(
                                        _isObscure
                                            ? CupertinoIcons.eye_slash
                                            : CupertinoIcons.eye,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                ),
                              ),

                              //Confirm Password text...
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: const [
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  Text(
                                    "Confirm Password",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              //Confirm Password field.....
                              TextFormField(
                                controller: _confamPassword,
                                obscureText: _isObscure,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please re-enter password";
                                  }
                                  if (_password.text != _confamPassword.text) {
                                    return "Password does not match";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  hintText: "Confirm Your password",
                                  hintStyle: const TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  helperStyle: const TextStyle(
                                    fontFamily: "Rubik",
                                  ),
                                  suffixIcon: CupertinoButton(
                                      child: Icon(
                                        _isObscure
                                            ? CupertinoIcons.eye_slash
                                            : CupertinoIcons.eye,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                ),
                              ),

                              //Sign Up button....
                              const SizedBox(height: 45),
                              Column(
                                children: [
                                  GestureDetector(
                                    //On Tap validate....
                                    onTap: () async {
                                      if (_formkey.currentState!.validate()) {
                                        showCupertinoDialog(context: context, builder: (BuildContext ctx){
                                          return CupertinoAlertDialog(
                                            title: const Text("Done",style: TextStyle(
                                              fontFamily: "Rubik",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),),
                                            content: const Text("Validation is passed",style: TextStyle(
                                              fontFamily: "Rubik",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),),
                                            actions: [
                                              CupertinoButton(child: const Text("cancel", style: TextStyle(
                                                fontFamily: "Rubik",
                                                fontSize: 18,
                                                color: Colors.pink,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                                onPressed: (){ Navigator.pop(context);},
                                              ),
                                              CupertinoButton(child: const Text("Proceed", style: TextStyle(
                                                fontFamily: "Rubik",
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                                  onPressed: () async {

                                                    Navigator.push(context, MaterialPageRoute(builder: (contxt)
                                                    {return const HomePage(title: 'HomePage', name: '',);}));
                                                  }),
                                            ],
                                          );
                                        });
                                      } else {
                                        print("unsuccessful");
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      width: 411,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xffA97798),
                                      ),
                                      child: const Text(
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// onPressed: () async {
// Navigator.push(context, MaterialPageRoute(builder: (context){
//   return const SignUpPage();
// }));
// },
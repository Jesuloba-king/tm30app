import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_project/logins_dart/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController? emailJK = TextEditingController();
  //get User's info from filling of the forms....
  getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final getEmail = prefs.getString('example@gmail.com');


    setState(() {
      emailJK!.text= getEmail!;
    });

    if (kDebugMode) {
      print(getEmail);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  get passwordJK => null;
  // toggle to reveal password....
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
            leading: IconButton(onPressed: (){},
              icon: const Icon(CupertinoIcons.arrow_left),),
              centerTitle: true,
              backgroundColor: const Color(0xffE6CFE2),
              elevation: 0,
              title: const Text("Log In",
              style:TextStyle(color: Color(0xff72567A), fontFamily: "Rubik",
              fontSize: 20, fontWeight: FontWeight.w700,),),
      ),
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
                    const SizedBox(height: 100,),
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: Form(
                          key: formKey,
                          child: Column(
                              children: <Widget>[
                                Row(
                                  // Email address text....
                                  children: const [
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text("Email Address",
                                      style:TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                  ],
                                ),
                                //Email text form field....
                                TextFormField(
                                  controller: emailJK,
                                  validator: (String? val){
                                    if(val!.isEmpty){
                                      return "email is empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (String? email) {
                                    emailJK = email! as TextEditingController?;
                                  },
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    hintText: "example@gmail.com",
                                    hintStyle: TextStyle(
                                      fontFamily: "Rubik",
                                    ),
                                    suffixIcon: Icon(CupertinoIcons.mail_solid),
                                  ),
                                ),

                                //Password field
                                const SizedBox(height: 30,),
                                Row(
                                  //Password text....
                                  children: const [
                                    Padding(padding: EdgeInsets.only(left: 15)),
                                    Text("Password",
                                      style:TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                  ],
                                ),
                                TextFormField(
                                  obscureText: _isObscure,
                                  controller: passwordJK,
                                  validator: (String? val){
                                    if(val!.isEmpty){
                                      return "password is empty";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    hintText: "password",
                                    hintStyle: const TextStyle(
                                      fontFamily: "Rubik",
                                    ),
                                    helperText: "Forgotten Password ?",
                                    helperStyle: const TextStyle(
                                      fontFamily: "Rubik",
                                    ),
                                    suffixIcon: CupertinoButton(
                                        child: Icon( _isObscure ? CupertinoIcons.eye_slash:CupertinoIcons.eye, color: Colors.black,),
                                        onPressed:(){
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                  ),
                                ),

                                //LogIn button....
                                const SizedBox(height: 30),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        if (formKey.currentState!.validate()) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return const HomePage(title: '', name: '',);
                                          }));
                                        }
                                        else {
                                          print("unsuccessful");
                                        }

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        width: 411, height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color(0xffA97798),
                                        ),
                                        child: const Text('Log in',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Rubik",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: const [
                                    Expanded(child:
                                    Divider(
                                      indent: 10,
                                      color: Colors.black,
                                    ),),
                                    SizedBox(width: 10,),
                                    Text("Or continue with",
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Divider(
                                        indent: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20,),
                                Row(
                                  //Images- Fb, Google and IG..
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("images/Google.png"),
                                    const SizedBox(width: 15,),
                                    Image.asset("images/Facebook.png"),
                                    const SizedBox(width: 15,),
                                    Image.asset("images/Instagram.png"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(padding: EdgeInsets.all(40)),
                                    const Text("Don’t have an account?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),),

                                    //Sign Up Button....
                                    CupertinoButton(
                                      onPressed: () async {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return const SignUpPage();
                                        }));
                                      },
                                      child: const Text("Sign Up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff72567A),
                                        ),),
                                    ),

                                  ],
                                ),
                              ]
                          ),
                        )
                    ),
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

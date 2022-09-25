import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_project/logins_dart/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
 const HomePage({super.key, required this.title, required this.name});
  final String title;
  final String name;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _firstnameJK;

  //get User's info from filling of the forms....
  getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final getFirstname = prefs.getString("Write your First Name");

    setState(() {
      _firstnameJK = getFirstname!;

    });
    if (kDebugMode) {
      print(getFirstname);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: IconButton(onPressed: (){},
                icon: const Icon(CupertinoIcons.arrow_left)),
            centerTitle: true,
            backgroundColor: const Color(0xffE6CFE2),
            elevation: 0,
            title: const Text("Home Page",
              style:TextStyle(color: Color(0xff72567A), fontFamily: "Rubik",
                fontSize: 20, fontWeight: FontWeight.w700,),),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffE6CFE2),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 200)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Hello ",
                          style:TextStyle(color: Color(0xff72567A), fontFamily: "Rubik",
                            fontSize: 30, fontWeight: FontWeight.w700,),),
                        const Padding(padding: EdgeInsets.all(5)),
                        Image.asset("images/img.png",
                        height: 50, width: 50,),
                      ],
                    ),
                    const SizedBox(height: 300),
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            showCupertinoDialog(context: context, builder: (BuildContext context){
                              return CupertinoAlertDialog(
                                        title: const Text(
                                          "Log Out",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Rubik',
                                              color: Colors.black),
                                        ),
                                        content: const Text(
                                          "Do you wish to logout?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Rubik',
                                              color: Colors.black),
                                        ),
                                actions: [
                                  CupertinoButton(child: const Text("cancel", style: TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 18,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                    onPressed: (){ Navigator.pop(context);},
                                  ),
                                  CupertinoButton(child: const Text("Log Out", style: TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                    onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (cntxt) {
                                      return const LoginPage(title: 'Login',);}));},
                                  ),
                                ],
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            width: 411, height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffA97798),
                            ),
                            child: const Text('Log Out',
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
                  ],
                ),
          ),
            ),
          ),
        ],
      ),
    );
  }
}
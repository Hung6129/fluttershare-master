import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttershare/constrants.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;

  // @override
  // void initState() {
  //   super.initState();
  //   googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
  //     handleSigIn(account);
  //     }, onError: (err) {
  //     print('Error singing in: $err');
  //   });
  //   //re-authentication
  //   googleSignIn.signInSilently(suppressErrors: false)
  //   .then((account){
  //     handleSigIn(account);
  //   }).catchError((err){
  //       print('Error singing in: $err');
  //   });
  // }
  // handleSigIn(GoogleSignInAccount account){
  //   if (account != null) {
  //       print('User sign in!: $account');
  //       setState(() {
  //         isAuth = true;
  //       });
  //     } else {
  //       setState(() {
  //         isAuth = false;
  //       });
  //     }
  //   }
  // }

  // login() {
  //   googleSignIn.signIn();
  // }

  // logout() {
  //   googleSignIn.signOut();
  // }

  Scaffold buildAuthScreen() {
    return Scaffold(
        // appBar: AppBar(
        //   titleTextStyle: TextStyle(
        //     fontFamily: 'Festive',
        //     fontSize: 50.0,
        //     color: color2,
        //   ),
        //   backgroundColor: color4,
        //   bottomOpacity: 50.0,
        // ),
        body: TextField(
      decoration: InputDecoration(
          icon: Icon(
        Icons.search,
        color: color3,
      )),
    ));
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: color4,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color5, color3]),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                // Text(
                //   'Chào mừng bạn đến với',
                //   style: TextStyle(color: colorBlack, fontSize: 20.0),
                // ),
                Text(
                  "Thuốc Me",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xFF5db075),
                      fontFamily: "Signatra"),
                ),
                // Text(
                //   "Chạm để tiếp tục",
                //   style: TextStyle(fontSize: 15.0, color: color1),
                // ),
                GestureDetector(
                  onTap: () {},
                  // login
                  child: Container(
                    width: 260.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/google_signin_button.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

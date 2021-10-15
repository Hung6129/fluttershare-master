import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttershare/constrants.dart';
import 'package:fluttershare/pages/activity_feed.dart';
import 'package:fluttershare/pages/profile.dart';
import 'package:fluttershare/pages/search.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = true;
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  //drawer
  // Scaffold openDrawer() {
  //   return Scaffold(
  //     drawer: Drawer(
  //       child: ListView(
  //         children: [
  //           DrawerHeader(
  //             child: null,
  //           ),
  //           ListTile()
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //google sign in
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
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          ActivityFeed(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex = 1,
        onTap: onTap,
        activeColor: color3,
        items: [
          BottomNavigationBarItem(
            backgroundColor: color4,
            icon: Icon(Icons.featured_play_list),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: color4,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [color5, color3],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Thuốc Me",
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Color(0xFF5db075),
                    fontFamily: "Signatra",
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  // login
                  child: Container(
                    width: 260.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/google_signin_button.png',
                        ),
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

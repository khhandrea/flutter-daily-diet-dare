import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MainPage(), // Set the main page as the home
        SignInPage.routeName: (context) => SignInPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to Sign In Page'),
              onPressed: () {
                Navigator.pushNamed(context, SignInPage.routeName);
              },
            ),
            SizedBox(height: 16), // Add some spacing between the buttons
            ElevatedButton(
              child: Text('Go to Profile Page'),
              onPressed: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {

    Widget getInfoSection = Card(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      elevation: 0,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 60,
                      child: const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 80,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Please enter your details",
                        style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 20,
                        ),
                      )
                  )
                ],
              )
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _personalDetailInfo("Name"),
                _personalDetailInfo("User Name"),
                _personalDetailInfo("Password"),
                _personalDetailInfo("Age"),
                _personalDetailInfo("Email"),
                _personalDataInfoButton(),
              ],
            ),
          )
        ],
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ Colors.white, Colors.green.shade200 ]
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/robot-lookDown.png'),
                              fit: BoxFit.cover
                          )
                      )
                  )
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        )
                      ]
                  ),
                  child: getInfoSection,
                ),
              )
            ],
          )
      ),
    );
  }


  TextField _personalDetailInfo(String label) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, color: Colors.lightGreen,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, color: Colors.green,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        labelText: label,
      ),
    );
  }

  ElevatedButton _personalDataInfoButton() {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor: MaterialStatePropertyAll(Colors.green.shade300),
          fixedSize: const MaterialStatePropertyAll(Size(160, 50)),
          elevation: const MaterialStatePropertyAll(3)
      ),
      onPressed: null, // TODO have to be implemented 'onPressed'
      child: const Text(
        "Sign Up",
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  @override
  @override
  Widget build(BuildContext context) {

    Widget getInfoSection = Card(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      elevation: 0,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar1.png'),
                      radius: 60,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Please enter your details",
                        style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 20,
                        ),
                      )
                  )
                ],
              )
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _personalDetailInfo("David Kim","assets/Icon awesome.png"),
                  _personalDetailInfo("24 Oct 2000", "assets/cake.png"),
                  _personalDetailInfo("010-7426-3239", "assets/phone.png"),
                  _personalDetailInfo("@DavidKim42", "assets/instagram.png"),
                  _personalDetailInfo("davidkim@gmail.com", "assets/mail.png"),
                  _personalDataInfoButton(),
                ],
              )
            ),
          )
        ],
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ Colors.white, Colors.green.shade200 ]
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/robot-lookDown.png'),
                              fit: BoxFit.cover
                          )
                      )
                  )
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        )
                      ]
                  ),
                  child: getInfoSection,
                ),
              )
            ],
          )
      ),
    );
  }


  Widget _personalDetailInfo(String value, String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 10), // Add margin of 8 pixels at the bottom
      child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              child : Image.asset(imagePath), // Image widget
            ),
            SizedBox(width: 8),
            Expanded(
              child : TextFormField(// Add a space between the image and the TextFormField
              readOnly: true,
              initialValue: value,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.lightGreen,
                    ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.green,
                    ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

  ElevatedButton _personalDataInfoButton() {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor: MaterialStatePropertyAll(Colors.green.shade300),
          fixedSize: const MaterialStatePropertyAll(Size(160, 50)),
          elevation: const MaterialStatePropertyAll(3)
      ),
      onPressed: null, // TODO have to be implemented 'onPressed'
      child: const Text(
        "SAVE",
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
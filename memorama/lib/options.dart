import 'package:flutter/material.dart';
import 'levels/easy_level.dart';
import 'levels/medium_level.dart';
import 'levels/hard_level.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: OptionScreen(),
    );
  }

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }
}

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  _OptionScreen createState() => _OptionScreen();
}

class _OptionScreen extends State<OptionScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Easy()),
                );
              },
              child: Container(
                height: 80.0,
                width: 320.0,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 40.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [BoxShadow(
                    blurRadius: 4,
                    color: Colors.black45,
                    spreadRadius: 0.5,
                    offset: Offset(3,4),
                  )],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Fácil',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: const EdgeInsets.only(left: 40.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/happy.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Medium()),
                );
              },
              child: Container(
                height: 80.0,
                width: 320.0,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 40.0),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [BoxShadow(
                    blurRadius: 4,
                    color: Colors.black45,
                    spreadRadius: 0.5,
                    offset: Offset(3,4),
                  )],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Medio',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: const EdgeInsets.only(left: 40.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/serious.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Hard()),
                );
              },
              child: Container(
                height: 80.0,
                width: 320.0,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 120.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [BoxShadow(
                    blurRadius: 4,
                    color: Colors.black45,
                    spreadRadius: 0.5,
                    offset: Offset(3,4),
                  )],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Difícil',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: const EdgeInsets.only(left: 40.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/angry.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,40),
                  primary: Colors.purple,
                ),
                child: SizedBox(
                  width: 150.0,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Regresar',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
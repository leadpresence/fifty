import 'package:flutter/material.dart';
import './utils/layout.dart';
import 'pages/details_page.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '50 Whys To Ditch Porn',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Orkney',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: DitchPorn(title: '50 Whys To Ditch Porn'),
      home: DitchPorn(),
    );
  }
}


class DitchPorn extends StatefulWidget {
  DitchPorn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DitchPornState createState() => _DitchPornState();
}

class _DitchPornState extends State<DitchPorn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 260,
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Image(
                image: NetworkImage(
                    'https://image.freepik.com/free-vector/doctor-counseling-people-group-therapy_74855-5492.jpg')),
          ),
          const YMargin(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: "Get Started".text.xl.bold.make().shimmer(
                primaryColor: Colors.red, secondaryColor: Colors.purple),
          ),
          const YMargin(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              'Fifty is platform that provides you 50 good reasons for you to ditch your porn habit. Start the new  year with your health in mind and see why you should add ditching porn to your list of resolutions. We trust you will by every means find reasons to see to the end to get all you need to know!.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                height: 1.6,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const YMargin(40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            height: 50,
            child: FlatButton(
              color: Colors.purpleAccent[700],
              textColor: Colors.white,
              child: Text('Lets Go'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomPageRoute(DetailsPage()),
                );
              },
            ),
          ),
          const YMargin(150),
        ],
      ),
    );
  }
}

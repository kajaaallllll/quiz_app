import 'package:flutter/material.dart';
import 'package:quizzie_app/drawer.dart';
import 'package:quizzie_app/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


import 'package:quizzie_app/drawer.dart';


// void main()=>runApp( Front_Page());
//
//
// class Front_Page extends StatefulWidget {
//
//
//   @override
//   State<Front_Page> createState() => _Front_PageState();
// }
//
// class _Front_PageState extends State<Front_Page> {
//   int _selectedindex=0;
//   void _navigateBottomBar(int index){
//     setState(() {
//       _selectedindex = index;
//     });
//   }
//   final List<Widget> _pages =[
//     Home(),
//     Notifications(),
//     Profile(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//          currentIndex: _selectedindex,
//           onTap: _navigateBottomBar,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.contacts),label: 'Profile'),
//             BottomNavigationBarItem(icon: Icon(Icons.messenger_outline),label: 'Notifications'),
//           ],
//         ),
//           appBar: AppBar(
//           title:Text('Quiz App') ,
//           backgroundColor: Colors.grey,
//           centerTitle: true,
//         ),
//         drawer: MainDrawer(),
//         _pages[_selectedindex],
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 40.0,),
//                   Text('Digital Study Material',style: TextStyle(fontSize: 25),),
//                   SizedBox(height: 40.0,),
//                   SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                                 onTap:(){
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//                                 },
//
//                                 child: Image.asset('images/physics_logo.png',height: 150,width: 150)),
//                           ),
//                           SizedBox(height: 100.0,),
//                           Image.asset('images/chemistry_logo.jpg',height: 150,width: 150),
//                           SizedBox(height: 100.0,),
//                           Image.asset('images/maths_logo.jpg',height: 150,width: 150),
//                           SizedBox(height: 100.0,),
//                             ],
//                           ),
//                       ),
//                       SizedBox(height: 40,),
//                       Text('Test your Knowledge ->',style: TextStyle(fontSize: 25),),
//                       SizedBox(height: 20,),
//                       Text('  Practice Pevious Year Questions',style: TextStyle(fontSize: 15),),
//                       SizedBox(height: 40,),
//                       SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: [
//                               Image.asset('images/jee_logo.png',height: 150,width: 150),
//                               SizedBox(height: 100,),
//                               Image.asset('images/neet_logo.png',height:150,width: 150),
//                               SizedBox(height: 40,),
//                               Image.asset('images/punjab_logo.jpg',height: 150,width: 150),
//                             ],
//                           ),
//                       ),
//                             SizedBox(height: 40,),
//                             Text('Your Scheduled Exams',style: TextStyle(fontSize: 25),),
//                             SizedBox(height: 40,),
//                             GestureDetector(onTap: (){},
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: InkWell(child: Container(
//                                       color: Colors.deepOrange,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text('Show My Exams',style: TextStyle(fontSize: 20),),
//                                       ),
//                                       height: 40,
//                           )),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ) ,
//           );
//         }
//       }

void main(){
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex=0;

  final pages =[
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }


    Container  buildMyNavBar(BuildContext context) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.work_rounded,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.work_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.widgets_rounded,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.widgets_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      );
    }
}


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey,
        centerTitle: true,

        title: Text('Quiz App',style: TextStyle(fontSize: 30),),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.0,),
              Text('Digital Study Material',style: TextStyle(fontSize: 25),),
              SizedBox(height: 40.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          },

                          child: Image.asset('images/physics_logo.png',height: 150,width: 150)),
                    ),
                    SizedBox(height: 100.0,),
                    Image.asset('images/chemistry_logo.jpg',height: 150,width: 150),
                    SizedBox(height: 100.0,),
                    Image.asset('images/maths_logo.jpg',height: 150,width: 150),
                    SizedBox(height: 100.0,),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Text('Test your Knowledge ->',style: TextStyle(fontSize: 25),),
              SizedBox(height: 20,),
              Text('  Practice Pevious Year Questions',style: TextStyle(fontSize: 15),),
              SizedBox(height: 40,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('images/jee_logo.png',height: 150,width: 150),
                    SizedBox(height: 100,),
                    Image.asset('images/neet_logo.png',height:150,width: 150),
                    SizedBox(height: 40,),
                    Image.asset('images/punjab_logo.jpg',height: 150,width: 150),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Text('Your Scheduled Exams',style: TextStyle(fontSize: 25),),
              SizedBox(height: 40,),
              GestureDetector(onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(child: Container(
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Show My Exams',style: TextStyle(fontSize: 20),),
                    ),
                    height: 40,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('Profile',style: TextStyle(
        color: Colors.white,fontSize: 25),)
      ),
      body:  SafeArea(
    child: Padding(
    padding: const EdgeInsets.all(32.0),
    child: Container(
    color: Colors.grey,
    width: 500.0,

    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text('I am Kajal Gera',
    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),



    Text(''
    'I have made this app ',
    style: TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: 30.0,

    ),),


    Text('using Flutter',
    style: TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: 30.0,

    ),),


    Text('I am persuing', style: TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: 30.0,

    ),),


    Text('Btech from', style: TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: 30.0,

    ),),

    Text('Ajay Kumar Garg ', style: TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: 30.0,

    ),),


    Text('Engineering College,', style: TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: 30.0,

    ),),
      Text('Ghaziabad', style: TextStyle(
        fontWeight: FontWeight.bold,

        fontSize: 30.0
        ,

      ),),


    ],
    ),


    ),
    ),),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Text('Notifications',style: TextStyle(
              color: Colors.white,fontSize: 25
          ),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
              Image.asset('images/search_.jpg',height: 250,width: 250,),

            ),

            Text('No New Notifications ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),)
          ],
        ),

      ),
    );
  }
}







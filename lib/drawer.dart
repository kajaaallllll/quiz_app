import 'package:flutter/material.dart';
import 'main.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child:Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30,bottom: 10),
                    child: CircleAvatar( radius: 80.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage('https://tse1.mm.bing.net/th?id=OIP.lHYa8kOGYDjel_IieX54qQHaHa&pid=Api&P=0'),

                    ),
                  ),
                  Text('Kajal Gera',style: TextStyle(fontSize: 20,
                      color: Colors.black87),),

                ],
              ),
            ),


            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('Home',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){  }
            ),
            ListTile(
              leading: Icon(Icons.grid_view),
              title: Text('My Orders',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){ },
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('Refer To A Friend',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){},
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('About Us',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){},
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate This App',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){},
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('LogOut',
                style: TextStyle(
                    fontSize: 20,

                    color: Colors.black87
                ),),
              onTap:(){},
            ),

          ],
        )
    );

  }}

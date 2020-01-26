import 'package:flutter/material.dart';

class Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = 'SHIVAM AHUJA';
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(child: Text('CONFIRMATION')),
      content: Container(
          height: 180,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(height: .1,),
              SizedBox(height: 5,),
              new Container(
                  width: 100,
                  height: 100,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png")
                      )
                  )),
              SizedBox(height: 10,),
              Center(child: Text('SEND MONEY TO:\n $name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
            ],
          ),

      ),
      elevation: 20,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'CONFIRM',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

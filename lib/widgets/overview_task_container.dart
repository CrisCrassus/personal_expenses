import 'package:flutter/material.dart';

class OverviewTaskContainer extends StatelessWidget {
  const OverviewTaskContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          height: 80,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.black38,),
                    child: ClipRRect(
                      child: Icon(Icons.phone),),), 
  
                  SizedBox(width: 20),
                  Text('Title',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20))
                ],
              ),
              Row(children: [
                Text('10',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
                SizedBox(width: 20),
                Icon(Icons.chevron_right, color: Colors.white, size: 30)
              ])
            ],
          )),
    );
  }
}
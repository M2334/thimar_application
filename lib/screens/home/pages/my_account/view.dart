import 'package:flutter/material.dart';
class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: 375,
                // color: Colors.green,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 157,top: 43,end: 161),
                child: Column(
                  children: [
                    const Text("حسابي",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: Image.asset("assets/images/imageprofile.jpeg",height: 71,width: 76,)),
                    Text("محمد سعيد",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("010147363",style: TextStyle(fontSize: 14,color: Colors.grey),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class _Item  extends StatelessWidget {
  Item() {
    // TODO: implement Item
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Image.asset("name"),
        Text("data"),
        Icon(Icons.arrow_back_ios_new_sharp),
      ],
    );
  }
}


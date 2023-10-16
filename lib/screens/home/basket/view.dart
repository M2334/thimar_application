import 'package:flutter/material.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/home/home.dart';
class BasketView extends StatelessWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("السلة",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF4C8613)),)),
        actions: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Color(0xFF4C8613),
              ),
              onPressed: () {
                navigatorTo(HomeScreen());
              },
            ),
          )
        ],
        // leading: Icon(Icons.arrow_back_ios,),
      ),
      body: ListView.builder(itemBuilder:(context, index) =>  _Item(),itemCount: 1,)
    );
  }
}
class _Item extends StatelessWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network("https://www.agroserv.gr/wp-content/uploads/2019/02/%CE%A4%CE%BF%CE%BC%CE%AC%CF%84%CE%B1-Belladona.jpg",height: 70,width: 70,)),
      ],
    );
  }
}


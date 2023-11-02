import 'package:flutter/material.dart';
import 'package:thimarr/core/design/custom_button.dart';
import 'package:thimarr/core/design/custom_text_button_order.dart';
import 'package:thimarr/screens/home/cart/view.dart';
import '../../core/logic/helper_navgat.dart';

class CompleteOrderView extends StatelessWidget {
  const CompleteOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "إتمام الطلب",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C8613)),
        )),
        actions: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffF3F8EE),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF4C8613),
              ),
              onPressed: () {
                navigatorTo(const CartView());
              },
            ),
          )
        ],
        // leading: Icon(Icons.arrow_back_ios,),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "الإسم : محمد",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xFF4C8613)),
                    )),
                const SizedBox(
                  height: 11,
                ),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "الجوال : 05068285914",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xFF4C8613)),
                    )),
                const SizedBox(
                  height: 36,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "اختر عنوان التوصيل",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xFF4C8613)),
                          )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF3F8EE),
                            ),
                            child: IconButton(
                              color: const Color(0xFF4C8613),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.all(3),
                        padding: const EdgeInsetsDirectional.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F8EE),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const ExpansionTile(
                          maintainState: true,
                          iconColor: Color(0xFF4C8613),
                          childrenPadding: EdgeInsetsDirectional.all(1),
                          title: Text(
                            'المنزل : 119 طريق الملك عبدالعزيز',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF4C8613),
                            ),
                          ),
                          // children: <Widget>[
                          //   // Container(
                          //   //   alignment: Alignment.center,
                          //   //   padding: const EdgeInsets.all(24),
                          //   //   child: const Text('Choose The Title'),
                          //   // ),
                          // ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text("تحديد وقت التوصيل",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF4C8613)))),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text("Date")),
                    const SizedBox(width: 200,),
                    ElevatedButton(onPressed: (){}, child: const Text("Time")),
                  ],
                ),
                const SizedBox(height: 16,),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text("ملاحظات وتعليمات",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF4C8613)))),
                TextField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  // clipBehavior: Clip.antiAlias,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFE5E9E0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 25.5,),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text("اختر طريقة الدفع",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF4C8613)))),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    CustomTextButtonOrder(onPress: (){}, image: "assets/images/cash.png",),
                    CustomTextButtonOrder(onPress: (){}, image: "assets/images/visa.png",),
                    CustomTextButtonOrder(onPress: (){}, image: "assets/images/masterd.png",),
                  ],
                ),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text("ملخص الطلب",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF4C8613)))),
                Container(
                  padding: const EdgeInsetsDirectional.only(bottom: 15),
                  height: 174 ,
                  width: 342.5,
                  color: const Color(0xFFF3F8EE),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(text: "إنهاء الطلب ", onPress: (){}, style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF4C8613)),
                      )),
                      const Divider(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Expanded(child: Text("الخصم",style: TextStyle(fontSize: 15,color: Color(0xFF4C8613)),)),
                          Text("40-ر.س",style: TextStyle(fontSize: 15,color: Color(0xFF4C8613)),),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: const [
                          Expanded(child: Text("المجموع",style: TextStyle(fontSize: 15,color: Color(0xFF4C8613)),)),
                          Text("180ر.س",style: TextStyle(fontSize: 15,color: Color(0xFF4C8613)),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

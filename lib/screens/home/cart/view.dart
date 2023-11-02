import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/core/design/custom_button.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/complete_order/view.dart';
import 'package:thimarr/screens/home/cart/cart_cubit.dart';
import 'package:thimarr/screens/home/home.dart';

import 'cart_states.dart';
import 'mdel.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "السلة",
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
                navigatorTo(const HomeScreen());
              },
            ),
          )
        ],
        // leading: Icon(Icons.arrow_back_ios,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider<CartCubit>(
              create: (context) => CartCubit()..getAllCarts(),
              child: BlocBuilder<CartCubit, CartStates>(
                builder: (context, state) {
                  return state is LoadingCartState
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is SuccessCartState
                          ? SizedBox(
                              height: 406,
                              child: ListView.builder(
                                itemBuilder: (context, index) =>
                                    _Item(state.carts, index),
                                itemCount: state.carts.length,
                              ))
                          : FlutterLogo();
                },
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              height: 55,
              width: 342,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFFE2E2E2)),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "عندك كوبون ؟ ادخل رقم الكوبون",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 39,
                      width: 79,
                      margin: const EdgeInsetsDirectional.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "تطبيق",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsetsDirectional.only(end: 77),
                child: const Text(
                  "جميع الأسعار تشمل قيمة الضريبة المضافة 15 %",
                  style: TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                )),
            Container(
              margin: const EdgeInsetsDirectional.all(10),
              padding: const EdgeInsetsDirectional.all(5),
              decoration: BoxDecoration(
                color: const Color(0xffF3F8EE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "إجمالي المنتجات",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                      ),
                      SizedBox(
                        width: 167,
                      ),
                      Text(
                        "180ر.س",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "الخصم ",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        "-40ر.س",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                      ),
                    ],
                  ),
                  const Divider(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "المجموع ",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                      ),
                      SizedBox(
                        width: 205,
                      ),
                      Text(
                        "140ر.س",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF4C8613)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "الانتقال لإتمام الطلب",
              onPress: () {
                navigatorTo(const CompleteOrderView());
              },
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  List<CartData>? carts;
  int index;
  _Item(this.carts, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(2),
      // padding: EdgeInsetsDirectional.all(1),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Row(
        children: [
          Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                carts![index].image,
                height: 75,
                width: 75,
              )),
          const SizedBox(
            width: 9,
          ),
          Column(
            children: [
              Text(
                carts![index].title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C8613)),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "${carts![index].price} ر.س",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF4C8613)),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                padding: const EdgeInsetsDirectional.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xffF3F8EE),
                ),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFF4C8613),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "5",
                      style: TextStyle(color: Color(0xFF4C8613), fontSize: 11),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:
                            const Icon(Icons.remove, color: Color(0xFF4C8613))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 150,
          ),
          const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("طلباتى")),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const _Item(),
        itemCount: 10,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.02),
            offset: const Offset(0, 6),
            blurRadius: 17,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "طلب #4587",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4C8613)),
                  ),
                  const Text(
                    "25 سبتمبر 2023",
                    style: TextStyle(
                        color: Color(0xff9C9C9C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      // دة كدا عملت اسبريد اوبريتور شبيه الليست فيو كدا بياخد منى الديزاين والطول العدد اللى عايز اكررو
                      ...List.generate(3, (index) => Container(
                          margin: const EdgeInsetsDirectional.only(end: 3),
                          width: 25,
                          height: 25,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Image.network(
                              "https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/avatars/ad/adef0c822947803d9b19f31af0f0abe38709f47b.jpg")),),
                      Container(
                          width: 25,
                          height: 25,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.green.withOpacity(.13),
                          ),
                          child: const Center(
                              child: Text(
                            "+2",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ))),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.green.withOpacity(.13),
                    ),
                    child: const Center(
                        child: Text(
                      "بإنتظار الموافقة",
                      style: TextStyle(
                        color: Color(0xff4C8613),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ))),
                const Text(" 180ر.س",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff4C8613)),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

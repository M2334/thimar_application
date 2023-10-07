import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("الإشعارات")),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك وجارى تحضيره الأن",
              body:
                  "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعتان",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك رقم 2 وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعة",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ نصف ساعة",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعتان ونصف",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعتان",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك رقم 5 وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعتان",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعتان",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ساعتان",
            ),
            _Item(
              image: "assets/images/message.png",
              title: "تم قبول طلبك رقم 6 وجارى تحضيره الأن",
              body:
              "هذا النص هو مثال لنص ممكن أن يستبدل فى نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى",
              time: "منذ ربع ساعة",
            ),
          ],
        ),
      ),
    );
  }
}

// بكستمها لى نفس الشاشة فقط مش محتاج اعملها كلاس لى وحدها لان ايتم واحد فقط عندى فى شاشة واحده فقط
// Custom Widget on This Screen Only

class _Item extends StatelessWidget {
  const _Item(
      {Key? key,
      required this.image,
      required this.title,
      required this.body,
      required this.time})
      : super(key: key);
  final String image, title, body, time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 33,
            width: 33,
            padding: const EdgeInsetsDirectional.all(6.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.green.withOpacity(.13),
            ),
            child: Image.asset(
              image,
              // height: 20,
              // width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
                Text(
                  body,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xff989898)),
                ),
                Text(
                  time,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

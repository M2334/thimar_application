import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/screens/home/home_cubit.dart';
import 'package:thimarr/screens/home/pages/favourites/view.dart';
import 'package:thimarr/screens/home/pages/main/view.dart';
import 'package:thimarr/screens/home/pages/my_account/view.dart';
import 'package:thimarr/screens/home/pages/my_orders/view.dart';
import 'package:thimarr/screens/home/pages/notifications/view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curentIndex = 0;
  List<Widget> pages = [
    const MainPage(),
    const MyOrderPage(),
    const NotificationsPage(),
    const FavouritesPage(),
    const MyAccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..homeGetData(),
      child: Scaffold(
        // اعرضلى المكان الانديكس اللى انا واقف عليه حاليا واروح احط الديزاين فى الماين فيو عندى
        body:pages[curentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: curentIndex,
          onTap: (value){
            curentIndex = value;
            setState(() {
            });
          },
          // fixedColor:Colors.green ,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.home_filled),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.sticky_note_2_rounded),
              label: 'طلباتى',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.notifications_none),
              label: 'الإشعارات ',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.favorite_outline),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.account_circle_outlined),
              label: 'حسابى',
            ),
          ],
        ),
      ),
    );
  }
}

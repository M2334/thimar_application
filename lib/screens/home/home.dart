import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/core/design/custom_text_field.dart';
import 'package:thimarr/screens/home/home_cubit.dart';
import 'package:thimarr/screens/home/pages/favourites/view.dart';
import 'package:thimarr/screens/home/pages/main/view.dart';
import 'package:thimarr/screens/home/pages/my_account/view.dart';
import 'package:thimarr/screens/home/pages/my_orders/view.dart';
import 'package:thimarr/screens/home/pages/notifications/view.dart';

import 'home_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curentIndex = 0;
  List<Widget> pages = [
    MainPage(),
    NotificationsPage(),
    MyAccountPage(),
    MyOrderPage(),
    FavouritesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..homeGetData()..categoireGetData(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsetsDirectional.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      const Text(
                        'سلة ثمار',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'التوصيل إلى',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal'),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'شارع الملك فهد - جدة',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.lock_open),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      controller: TextEditingController(),
                      labelText: 'إبحث عن ما تريد ',
                      prefixIcon: const Icon(Icons.search)),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
                    return state is HomeLoadingState
                        ? const CircularProgressIndicator()
                        : HomeCubit.sliderData!.isNotEmpty
                            ? CarouselSlider.builder(
                                itemCount:HomeCubit.sliderData!.length,
                                itemBuilder: (c, i, x) {
                                  return Image.network(HomeCubit.sliderData![i].media);
                                },
                                options: CarouselOptions(
                                  height: 150,
                                  autoPlay: true,
                                  pauseAutoPlayOnManualNavigate: true,
                                  aspectRatio: 16 / 9,
                                  animateToClosest: true,
                                ),)
                            : Container();
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                    child: Row(
                      children:  const [
                        Expanded(
                            child: Text(
                          "الأقسام ",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                        Text(
                          "عرض الكل",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                     ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  BlocBuilder<HomeCubit, HomeStates>(
                    builder: (context, state) {
                      return state is CategorieSuccessState?SizedBox(height: 150,child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c,i){return Column(children: [
                        Image.network(state.categoriedata[i].media),
                        const SizedBox(height: 16,),
                        Text(state.categoriedata[i].name)
                      ],);},itemCount: state.categoriedata.length,),):state is CategorieLoadingState? const Center(child: CircularProgressIndicator(),):const FlutterLogo();
                    },
                  )

                ],
              ),
            ),
          ),
        ),
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

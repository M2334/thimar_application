import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/home/product_categoire_model.dart';

import '../../../../core/design/custom_text_field.dart';
import '../../basket/view.dart';
import '../../home_cubit.dart';
import '../../home_states.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsetsDirectional.all(10),
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
                  GestureDetector(
                    onTap: (){
                      navigatorTo(const BasketView());
                    },
                      child: const Icon(Icons.lock_open)
                  ),
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
                return state is HomeSuccessState
                    ? CarouselSlider.builder(
                        itemCount: state.sliderdata.length,
                        itemBuilder: (c, i, x) {
                          return Image.network(state.sliderdata[i].media);
                        },
                        options: CarouselOptions(
                          height: 150,
                          autoPlay: true,
                          pauseAutoPlayOnManualNavigate: true,
                          aspectRatio: 16 / 9,
                          animateToClosest: true,
                        ),
                      )
                    : const CircularProgressIndicator();
              }),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Row(
                  children: const [
                    Expanded(
                        child: Text(
                      "الأقسام ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
              const SizedBox(
                height: 20,
              ),
              BlocProvider<HomeCubit>(
                create: (context) => HomeCubit()..categoireGetData(),
                child: BlocBuilder<HomeCubit, HomeStates>(
                  builder: (context, state) {
                    return state is CategorieSuccessState
                        ? SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (c, i) {
                                return Column(
                                  children: [
                                    Image.network(
                                      state.categoriedata[i].media,
                                      width: 120,
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(state.categoriedata[i].name)
                                  ],
                                );
                              },
                              itemCount: state.categoriedata.length,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
              SizedBox(
                height: 300,
                child: BlocProvider(
                  // انشئلى الكيبوت ومن خلاله نستدعى داله ال api
                  create: (context) => HomeCubit()..categoireGetProductData(),
                  child: BlocBuilder<HomeCubit, HomeStates>(
                    builder: (context, state) {
                      // بيشوف لو بتحمل اظهر الدائرة
                      return state is CategoireProductLoadingState
                          ? CircularProgressIndicator()
                      //لو التحميل تم اظهر الويدجيت
                          : state is CategoireProductSuccessState
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 300,
                                          crossAxisSpacing: 20,
                                          crossAxisCount: 2),
                                  itemBuilder: (c, i) {
                                    return _Item(state.productData!, i);
                                  },
                                  itemCount: state.productData?.length,
                                )
                              : Container();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  // عرفت ليست من الموديل علشان من خلالها اقدر اكسس ع البيانات
  final List<DataModel> categories;
  int index;
  _Item(this.categories, this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Image.network(
              categories[index].mainImage,
            ),
            Container(
              height: 19,
              width: 54,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(8))),
              child: Text(
                // النسبة المئوية
                categories[index].discount.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(
            //العنوان الرئيسى
            categories[index].title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C8613),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(
            // السعر بالكيلو جرام خافط
            categories[index].unit.name.toString(),
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // السعر بعد التخفيض
              categories[index].price.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C8613)),
            ),
            Text(
              // السعر قبل التخفيض
              categories[index].priceBeforeDiscount.toString(),
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                  color: Color(0xFF4C8613)),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            navigatorTo(BasketView());
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff61B80C)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          child: const Text(
            "أضف للسلة",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

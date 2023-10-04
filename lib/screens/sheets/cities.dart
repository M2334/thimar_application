import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thimarr/models/cities.dart';

class CitiesSheets extends StatefulWidget {
  const CitiesSheets({Key? key}) : super(key: key);

  @override
  State<CitiesSheets> createState() => _CitiesSheetsState();
}

class _CitiesSheetsState extends State<CitiesSheets> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;
  late GetCitiesData model;
  void getData() async {
    final response =
        await Dio().get("https://thimar.amr.aait-d.com/api/cities/1");
    print(response.data);
    isLoading = false;
    model = GetCitiesData.fromJson(response.data);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          const SizedBox(height: 16,),
          const Text("إختر مدينتك من القائمة",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
          isLoading
              ? const Expanded(
                child: Center(
            child: CircularProgressIndicator(),
          ),
              )
              : Expanded(
                child: ListView.builder(
            itemBuilder: (context, index) => _ItemCity(
                model: model.list[index],
            ),
            itemCount: model.list.length,
            padding: const EdgeInsets.all(16),
          ),
              ),
        ],
      ),
    );
  }
}

class _ItemCity extends StatelessWidget {
  final CityModel model;
  const _ItemCity({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model.name);
        print(model.name);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.grey.withOpacity(.2),
        ),
        child: Center(child: Text(model.name)),
      ),
    );
  }
}

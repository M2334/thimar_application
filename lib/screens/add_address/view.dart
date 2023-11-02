import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimarr/core/design/custom_text_field.dart';

import '../../core/design/custom_button.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  Set<Marker> muMarkers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(
        30.7070485,
        31.2844864,
      ),
    ),
  };

  bool isSelected = false;
  final _controller = Completer<GoogleMapController>();

  get location => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();
  }

  String? myAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("إضافة عنوان")),
        leading: Container(
          height: 32,
          width: 32,
          padding: const EdgeInsetsDirectional.only(start: 7),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsetsDirectional.all(17),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const GoogleMap(
                      //  markers: muMarkers,

                      // onTap: (argument) {
                      //   muMarkers.add(
                      //     Marker(
                      //       markerId:
                      //           MarkerId("${30.7070485},${30.7070485}"),
                      //       position: LatLng(
                      //         30.7070485,
                      //         30.7070485,
                      //       ),
                      //     ),
                      //   );
                      //   setState(() {});
                      //   print(argument.longitude);
                      //   print(argument.latitude);
                      // },
                      // mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        zoom: 7,
                        target: LatLng(30.7070485, 31.7070485),
                      ),
                      // circles: {
                      //   Circle(circleId: CircleId("1"),
                      //     center: LatLng(
                      //       30.7070485,
                      //       31.2844864,
                      //     ),
                      //     radius: 20000,
                      //     strokeColor: Colors.red,
                      //   ),
                      // },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: 5, end: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xFF8B8B8B),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "نوع العنوان",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF8B8B8B)),
                          ),
                          const Spacer(),
                          ToggleButtons(
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (ind) {
                                ind = 1;
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                              selectedColor: Colors.white,
                              fillColor: Colors.green,
                              isSelected: [
                                isSelected,
                                !isSelected
                              ],
                              children: const [
                                Text("المنزل"),
                                Text("العمل"),
                              ]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomTextField(
                        labelText: 'أدخل رقم الجوال',
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomTextField(
                        labelText: 'الوصف',
                        controller: TextEditingController()),
                    CustomButton(
                      text: 'إضافة العنوان',
                      onPress: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF558B2F)),
                      ),
                    ),
                  ],
                ),
                // if(myAddress == null)
                // Text(myAddress!),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     goToLocation(location: LatLng(
      //       37.42796133580664,
      //       -122.085749655962,
      //     ),);
      //   },
      // ),
    );
  }

  Future<void> goToLocation({required LatLng location}) async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 8,
    )));
    muMarkers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: location,
      ),
    );
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    var element = placemarks.first;
    print(element.name);
    print(element.country);
    print(element.administrativeArea);
    print(element.locality);
    print(element.street);
    print(element.subLocality);
    myAddress = "${element.country} / ${element.street} / ${element.locality}";
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    // Test if location services are enabled.
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      const ScaffoldMessenger(
        child: Text("Location services are disabled"),
      );
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var myPosation = await Geolocator.getCurrentPosition();
    print(myPosation.longitude);
    print(myPosation.latitude);
    goToLocation(location: LatLng(myPosation.longitude, myPosation.latitude));
    return myPosation;
  }
}

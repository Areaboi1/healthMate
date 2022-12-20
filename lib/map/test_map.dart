import 'package:custom_info_window/custom_info_window.dart';
import "package:flutter/material.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

String text = "";

class _MapState extends State<Map> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLng = [
    LatLng(1.344819, 103.966844),
    LatLng(1.345910, 103.958734),
    LatLng(1.336126, 103.964115),
    LatLng(1.339245, 103.959865)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() {
    for (int i = 0; i < _latLng.length; i++) {
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _latLng[i],
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBPHY6WoM3sF3uoHTcE79-Gz2Mpm1i47yDgw&usqp=CAU'),
                                fit: BoxFit.fitWidth,
                                filterQuality: FilterQuality.high),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Clinic near you",
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              const Spacer(),
                              Text("0.3 kms"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Text(
                            "4.0 ⭐️⭐️⭐️⭐️ (894)\n"
                            "Health Clinic\n"
                            "Closes 10PM",
                          ),
                        )
                      ],
                    ),
                  ),
                  _latLng[i]);
            }),
      );

      setState(() {});
    }
  }

  Widget _singleItem(String searchText) {
    return ElevatedButton(
      child: Text(
        searchText,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          text = searchText;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(3, 60),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search for places",
                      hintStyle: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                color: Colors.white.withOpacity(0.7),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 10),
                      _singleItem("Clinic"),
                      SizedBox(width: 10),
                      _singleItem("Pharmacy"),
                      SizedBox(width: 10),
                      _singleItem("Insurance"),
                      SizedBox(width: 10),
                      _singleItem("Banks"),
                      SizedBox(width: 10),
                      _singleItem("Food Courts"),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(1.3403, 103.9632),
              zoom: 15,
            ),
            markers: Set<Marker>.of(_markers),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          )
        ],
      ),
    );
  }
}

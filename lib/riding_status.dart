




import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RidingStatus extends StatefulWidget {

  const RidingStatus({Key? key}) : super(key: key);

  @override
  State<RidingStatus> createState() => _HomePageState();
}

class _HomePageState extends State<RidingStatus> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  Completer<GoogleMapController> _controller = Completer();
  PanelController panelController = PanelController();
  late TabController _promoController;

  bool _isExpand=false;
  bool _invisible = true;
  bool expand = true;



  CameraPosition _kGoogle = CameraPosition(
    target: LatLng(23.8103, 90.4125),
    zoom: 10,
  );












  @override
  void initState(){
    _promoController=TabController(length: 2, vsync: this);
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 1.0),
      // begin: 0.0,
      //end: 1.0
    ).animate(_animationController) ;







  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }














  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){


    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });





    return await Geolocator.getCurrentPosition();
  }


  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.8103, 90.4125),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(30, 110),
        infoWindow: InfoWindow(
          title: 'My current Position',
        )
    ),

  ];











  // static final _code=TextEditingController();
  // static final _destination=TextEditingController();
  //
  // late TabController _promoController;



  // bool _isExpand=false;
  // bool _invisible = true;
  // bool expand = true;










  bool Expand=false;

  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 200;


  //PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .99;

    Show_marker();

    return

      Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container  (
              child: SafeArea(
                child: Stack(
                  children: [

















                    GoogleMap(
                      initialCameraPosition: _kGoogle,
                      markers: Set<Marker>.of(_markers),
                      mapType: MapType.hybrid,
                      myLocationEnabled: true,
                      compassEnabled: true,
                      onMapCreated: (GoogleMapController controller){
                        _controller.complete(controller);
                      },
                    ),





                    ////////////////////////////////////////////////////////////

                    SlidingUpPanel(
                      controller: panelController,
                      maxHeight: _panelHeightOpen,
                      minHeight: _panelHeightClosed,
                      parallaxEnabled: true,
                      parallaxOffset: .5,
                      panelBuilder: (sc) => _panel(sc),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0)),
                      onPanelSlide: (double pos) =>
                          setState(() {
                            _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                                _initFabHeight;
                            _isExpand=(pos>=1.0);
                            _animationController.value = pos;
                            _invisible=(pos==1.0);
                            expand=(pos==1.0);

                          }),
                    ),







                  ],
                ),
              ),
            ),






          ],

        ),

      );
  }


  void Show_marker(){
    getUserCurrentLocation().then((value) {

      _kGoogle= CameraPosition(
        target: LatLng(value.latitude,value.longitude),
        zoom: 10,
      );

    });
  }



  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Row(
              children: [

                IconButton(onPressed: (){
                  panelController.close();
                }, icon: Icon(Icons.arrow_back)),

                Text("Dropping code",

                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                )
              ],
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:  Container(
                    height: 70,width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1.0),
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8,left: 10),
                      child: TextFormField(
                        //controller: _controller,
                        //maxLength: 11,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: (){

                            },
                              child: Icon(Icons.arrow_forward_ios)),
                          border: InputBorder.none,
                          labelText: "Enter dropping code",
                          labelStyle: TextStyle(color: Colors.grey),
                          // counterText: '$_characterCount / 11',
                        ),

                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red,
                        //onChanged: (input) => _validatePhoneNumber(input),
                      ),
                    ),
                  ),
                ),
              ],
            ),




          ],
        ));
  }






}


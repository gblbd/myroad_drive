


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  final String SearchDestination;
  const HomePage({Key? key, required this.SearchDestination}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

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


  // @override
  // void initState() {
  //
  //   Show_marker();
  //   // TODO: implement initState
  //   super.initState();
  // }




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
                 
                 Text("Accept Requests")
               ],
             ),




             Container(
               child: ListView.builder(
                 shrinkWrap: true,
                itemCount: 3,
                // controller: sc,
                 itemBuilder: (context,index){

                   return Container(
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       color: Colors.red.shade100,
                       borderRadius: BorderRadius.circular(10)
                     ),
                     child: ListTile(
                       title: Text("Name"),
                       subtitle: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("20 Gareeb e newaz Avenue, Uttara, Dhaka-1230"),
                           Text("To"),
                           Text("Khilkhet Bus Stop"),
                           Text("Contact No: +8801797609439")
                         ],
                       ),
                     ),
                   );


                 },
                 // children: <Widget>[
                 //   Padding(
                 //     padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                 //     child: _isExpand ?
                 //     Column(
                 //       crossAxisAlignment: CrossAxisAlignment.start,
                 //       children: [
                 //         IconButton(
                 //             padding: EdgeInsets.only(right: 350),
                 //             onPressed: (){
                 //               panelController.close();
                 //             },
                 //             icon: Icon(Icons.arrow_back_sharp)),
                 //         SizedBox(height: 10,),
                 //         Container(
                 //           height: 50,width: 322,
                 //           decoration: BoxDecoration(
                 //               border: Border.all(color: Colors.grey.shade400,width: 1),
                 //               borderRadius: BorderRadius.circular(10.0),
                 //               color: Colors.white
                 //           ),
                 //           child: Row(
                 //             children: [
                 //               const SizedBox(width: 10,),
                 //               Icon(Icons.person,size: 20,color: Colors.grey.shade600,),
                 //               const SizedBox(width: 10,),
                 //               Container(
                 //                 child: Column(
                 //                   mainAxisAlignment: MainAxisAlignment.start,
                 //                   crossAxisAlignment: CrossAxisAlignment.start,
                 //                   children: [
                 //                     const SizedBox(height: 10,),
                 //                     Text('Pickup',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.grey.shade700)),
                 //                     const Text('29, Shah Magdum Avenue, Sector 12',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black)),
                 //                   ],
                 //                 ),
                 //               )
                 //             ],
                 //           ),
                 //         ),
                 //       ],
                 //     )
                 //         : Container(
                 //       height: 30,width: 324,
                 //       decoration: BoxDecoration(
                 //         border: Border.all(color: Colors.white,width: 1),
                 //         borderRadius: BorderRadius.circular(8.0),
                 //         color: Colors.green.shade50,
                 //       ),
                 //       child: TextButton(
                 //         onPressed: (){
                 //           showModalBottomSheet(
                 //               isScrollControlled: false,
                 //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                 //               isDismissible: false,
                 //               enableDrag: false,
                 //               context: context,
                 //               builder: (BuildContext context){
                 //                 return Padding(
                 //                   padding: EdgeInsets.only(
                 //                     top: 10,
                 //                     bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                 //                   ),
                 //                   child: Container(
                 //                     height: 400,
                 //                     child: Column(
                 //                       children: [
                 //                         Image.asset('assets/images/Fares.png'),const SizedBox(height: 15,),
                 //                         const Text('Fares are comparatively lower now',
                 //                           style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                 //                         SizedBox(height: 15,),
                 //                         const Text('  Fares are lower at this moment Request your rides as soon as possible.',
                 //                           style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                 //                         const SizedBox(height: 15,),
                 //                         Container(
                 //                             height: 50,width: 320,
                 //                             decoration: BoxDecoration(
                 //                               border: Border.all(color: Colors.red,width: 1),
                 //                               borderRadius: BorderRadius.circular(8.0),
                 //                               color: Colors.red,
                 //                             ),
                 //                             child: TextButton(
                 //                               onPressed: (){
                 //                                 Navigator.pop(context);
                 //                               },
                 //                               child: const Text('Awesome!',
                 //                                 style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),)
                 //                         )
                 //                       ],
                 //                     ),
                 //                   ),
                 //                 );
                 //               });
                 //         },
                 //
                 //
                 //
                 //         child: Row(
                 //           children: [
                 //             CircleAvatar(
                 //                 backgroundColor: Colors.white,
                 //                 child: Icon(Icons.arrow_forward, size: 10,color: Colors.green.shade900,)
                 //             ),
                 //             Text('Fares are comparatively lower now for Bike',
                 //               style: TextStyle(color: Colors.green.shade900,fontSize: 12),),Spacer(),
                 //             Icon(Icons.info_outline,color: Colors.green.shade900,size: 10,)
                 //           ],
                 //         ),
                 //       ),
                 //     ),
                 //   ),
                 //   Padding(
                 //     padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                 //     child: Row(
                 //       children: [
                 //         Container(
                 //           height: 50,width: 260,
                 //           margin: const EdgeInsets.all(10),
                 //           decoration:  BoxDecoration(
                 //               border: Border.all(color: Colors.grey.shade700,width: 1),
                 //               borderRadius: BorderRadius.circular(10.0),
                 //               color: Colors.white
                 //           ),
                 //           child: TextField(
                 //             //controller: _destination,
                 //             cursorColor: Colors.red.shade900,
                 //             decoration: InputDecoration(
                 //                 border: InputBorder.none,
                 //                 hintText: 'Search Destination',
                 //                 hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 //                 prefixIcon: Icon(Icons.location_on,color: Colors.red,),
                 //                 suffixIcon: IconButton(
                 //                   onPressed: (){
                 //                     // Navigator.push(
                 //                     //     context,
                 //                     //     MaterialPageRoute(builder: (context) {
                 //                     //       return SetOnMap(SearchDestinations: _destination.text.toString(),);
                 //                     //     })
                 //                     // );
                 //                   },
                 //                   icon: Icon(Icons.arrow_forward_ios_sharp,size: 14,color: Colors.red,),)
                 //             ),
                 //
                 //           ),
                 //         ),
                 //         Container(
                 //           height: 50,width: 50,
                 //           margin: const EdgeInsets.all(7),
                 //           decoration: _invisible ? null : BoxDecoration(
                 //               border: Border.all(color: Colors.grey.shade700,width: 1),
                 //               borderRadius: BorderRadius.circular(10.0),
                 //               color: Colors.white
                 //           ),
                 //           child: TextButton(
                 //               style: TextButton.styleFrom(primary: Colors.white,),
                 //               onPressed: (){
                 //                 // Navigator.push(
                 //                 //     context,
                 //                 //     MaterialPageRoute(builder: (context) {
                 //                 //       return const YourTripPage();
                 //                 //     })
                 //                 // );
                 //               },
                 //               child: const Icon(Icons.add,color: Colors.red,size: 30,)),
                 //         ),
                 //
                 //       ],
                 //     ),
                 //   ),
                 //
                 //
                 //   Stack(
                 //     children: [
                 //       expand ? Positioned(child: Column(
                 //         children: [
                 //           Divider(thickness: 8,color: Colors.blueGrey.shade50,),
                 //           Padding(
                 //             padding: const EdgeInsets.only(left: 6,right: 8),
                 //             child: Container(
                 //               height: 60,
                 //               child: ListTile(
                 //                 leading:   CircleAvatar(
                 //                     radius: 17,
                 //                     backgroundColor: Colors.grey.shade200,
                 //                     child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                 //                 ),
                 //                 title: Text('Set On Map',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                 //                 onTap: (){
                 //
                 //
                 //                   // Navigator.push(
                 //                   //     context,
                 //                   //     MaterialPageRoute(builder: (context) {
                 //                   //       return SetOnMap(SearchDestinations: _destination.text.toString(),);
                 //                   //     })
                 //                   // );
                 //
                 //                 },
                 //               ),
                 //               // TextButton(
                 //               //   onPressed: (){},
                 //               //   child: Row(
                 //               //     children: [
                 //               //       CircleAvatar(
                 //               //         radius: 16,
                 //               //           backgroundColor: Colors.grey.shade200,
                 //               //           child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                 //               //       ),
                 //               //       const SizedBox(width: 16,),
                 //               //       const Text('Set On Map',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.normal),),Spacer(),
                 //               //       const SizedBox(width: 6,),
                 //               //     ],
                 //               //   ),
                 //               // ),
                 //             ),
                 //           ),
                 //         ],
                 //       ))
                 //           : Positioned(
                 //         child: Padding(
                 //           padding: const EdgeInsets.only(left: 6,right: 8),
                 //           child: Container(
                 //             height: 60,
                 //             child: ListTile(
                 //               leading:   CircleAvatar(
                 //                   radius: 17,
                 //                   backgroundColor: Colors.grey.shade200,
                 //                   child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                 //               ),
                 //               title: Text('Set On Map',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                 //               onTap: (){
                 //
                 //
                 //                 // Navigator.push(
                 //                 //     context,
                 //                 //     MaterialPageRoute(builder: (context) {
                 //                 //       return  SetOnMap(SearchDestinations: '',);
                 //                 //     })
                 //                 // );
                 //
                 //               },
                 //             ),
                 //           ),
                 //         ),
                 //       )
                 //     ],
                 //   ),
                 //   Divider(thickness: 8,color: Colors.blueGrey.shade50,),
                 //   Container(
                 //     height: 60,
                 //     child: ListTile(
                 //       leading:  CircleAvatar(
                 //           radius: 19,
                 //           backgroundColor: Colors.red.shade50,
                 //           child: Stack(
                 //             children: [
                 //               Align(
                 //                 alignment: Alignment.center,
                 //                 child: Icon(Icons.map,size: 18,color: Colors.red,),
                 //               ),
                 //               Align(
                 //                 alignment: Alignment.topRight,
                 //                 child: Icon(Icons.add_location,size: 17,color: Colors.red,),
                 //               ),
                 //             ],
                 //           )
                 //       ),
                 //       title: Text('Add missing place to the My Road Map',style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
                 //       trailing: Icon(Icons.arrow_forward_ios_sharp,size: 16,),
                 //       onTap: (){
                 //         // Navigator.push(
                 //         //     context,
                 //         //     MaterialPageRoute(builder: (context) {
                 //         //       return const AddMissingPlacePage();
                 //         //     })
                 //         // );
                 //       },
                 //
                 //     ),
                 //   ),
                 //   Divider(thickness: 8,color: Colors.blueGrey.shade50,),
                 //
                 // ],
               ),
             ),
           ],
         ));
   }






}














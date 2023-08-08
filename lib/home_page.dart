


import 'dart:async';

import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myroad_drive/about_us.dart';
import 'package:myroad_drive/profile_page.dart';
import 'package:myroad_drive/request_detail.dart';
import 'package:myroad_drive/settings.dart';
import 'package:myroad_drive/support_page.dart';
import 'package:myroad_drive/tour_request.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


import 'document_page.dart';

class HomePage extends StatefulWidget {
  final String SearchDestination;

  final String phnNumber;
  final String password;
  final String full_name;
  final String address;
  final String nid;
  final String nid_number;
  final String gender;
  final String date_of_birth;
  final String vehicleType;
  final String vehicleModel;
  final String vehicleRegNum;
  final String licenceNum;






  const HomePage({Key? key, required this.SearchDestination, required this.phnNumber, required this.password, required this.full_name, required this.address, required this.gender, required this.vehicleType, required this.vehicleModel, required this.vehicleRegNum, required this.licenceNum,  required this.date_of_birth, required this.nid, required this.nid_number}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  String Vtype="";








  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Driver_profile");





  late AnimationController _animationController;
   late Animation<Offset> _animation;

   double poslat=0.00;
   double poslong=0.00;

   LatLng currentpos=LatLng(0.00, 0.00);

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

    getPosition();






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


  // final List<Marker> _markers = <Marker>[
  //   Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(23.8103, 90.4125),
  //       infoWindow: InfoWindow(
  //         title: 'My Position',
  //       )
  //   ),
  //   Marker(
  //       markerId: MarkerId('2'),
  //       position: LatLng(30, 110),
  //       infoWindow: InfoWindow(
  //         title: 'My current Position',
  //       )
  //   ),
  //
  // ];











  // static final _code=TextEditingController();
  // static final _destination=TextEditingController();
  //
  // late TabController _promoController;



  // bool _isExpand=false;
  // bool _invisible = true;
 // bool expand = true;


   Future<void> getPosition() async {

     Position position = await GeolocatorPlatform.instance.getCurrentPosition();

     setState(() {

       poslat=position.longitude;
       poslong=position.longitude;

       currentpos=LatLng(position.latitude, position.longitude);
       uploadPos(poslat, poslong);

     });

   }



   Future<void> uploadPos(double latitude, double longitude) async {

     await ref.child("${widget.phnNumber}").child("Dprofile").update({

       "Latitude":latitude,
       "Longitude":longitude,

     });
   }








   static const LatLng SourceLocation=LatLng(37.3305, -122.03272);
   static const LatLng DestinationLocation=LatLng(37.3342, -122.06672);




   bool Expand=false;

  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 200;


  //PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {


    if(widget.vehicleType=="Car"){

      Vtype="carRequest";

    }
    else if(widget.vehicleType=="Bike"){

      Vtype="Bike_Request";

    }
    else{

      Vtype="Bike_Request";
    }


    Query dbref=FirebaseDatabase.instance.ref("${Vtype}").child("ride_request");




    _panelHeightOpen = MediaQuery.of(context).size.height * .99;

    // Timer.periodic(Duration(seconds: 60), (timer){
    //
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (BuildContext context) => HomePage(SearchDestination: "",
    //               phnNumber: widget.phnNumber,
    //               password: widget.password, full_name: widget.full_name,
    //               address: widget.address, gender: widget.gender,
    //               vehicleType: widget.vehicleType, vehicleModel: widget.vehicleModel,
    //               vehicleRegNum: widget.vehicleRegNum, licenceNum: widget.licenceNum,
    //               date_of_birth: widget.date_of_birth, nid: widget.nid,
    //               nid_number: widget.nid_number)));
    //
    //
    // },);


    // Timer.periodic(Duration(seconds: 5), (timer){
    //
    //   getPosition();
    //
    //
    // },);

    //Position position=getUserCurrentLocation() as Position;

    return

      Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container  (
              child: SafeArea(
                child: Stack(
                  children: [



                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(90.3840626, 90.3840626),//LatLng(currentLocation.latitude!,currentLocation.longitude!),
                          zoom: 0.0),
                      markers: {
                        Marker(
                            markerId: MarkerId("Source"),
                            position: currentpos,


                          //LatLng(currentLocation!.latitude!,currentLocation!.longitude!)
                        ),
                        // Marker(
                        //     markerId: MarkerId("Destination"),
                        //     position: LatLng(37.3342, -122.06672)
                        // )
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


        drawer: Drawer(
          child: ListView(
            children: [

               UserAccountsDrawerHeader(

                accountName: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text("${widget.full_name}",
                    style: GoogleFonts.openSans(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),

                  ),
                ),
                accountEmail: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text("${widget.phnNumber}",
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),


                  ),
                ),
                currentAccountPicture: GestureDetector(
                    child: InkWell(
                      onTap: (){
                        //getImage();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: Icon(Icons.person,color: Colors.blueGrey,),//img!=null?Image.file(img!,width:50,height: 50,):Icon(Icons.person,size: 50,),
                        radius: 30,


                      ),
                    )

                ),
                decoration: new BoxDecoration(
                    color: Colors.red.shade50
                ),



              ),

              ListTile(
                leading: Icon(Icons.manage_accounts_outlined,

                  size: 30,

                ),
                title: Text("Profile"),
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage(
                          DfullName: widget.full_name,
                          DphoneNum: widget.phnNumber,
                          Daddress: widget.address,
                          DdateOfBirth: widget.date_of_birth,
                          Dgender: widget.gender,
                          DnidNum: widget.nid_number,
                          DvehicleType: widget.vehicleType,
                          DvehicleModel: widget.vehicleModel,
                          DvehicleRegNum: widget.vehicleRegNum,
                          DdrivingLicenceNum: widget.licenceNum,);
                      },
                    ),
                  );

                },
              ),

              ListTile(
                leading: Image.asset("assets/destination.png",
                  width: 30,
                  height: 30,
                ),//Icon(Icons.trave, size: 30,),
                title: Text("Tourist Ride"),
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TourRequest();
                      },
                    ),
                  );

                },
              ),

              ListTile(
                leading: Icon(Icons.receipt_long),
                title: Text("Documents"),

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DocumentPage();
                      },
                    ),
                  );
                },

              ),

              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Settings();
                      },
                    ),
                  );
                },
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),


              Divider(
                thickness: 1.5,
                color: Colors.red.shade200,
              ),

              ListTile(

                onTap: (){
                  Share.share('check out our app https://play.google.com/store/apps/details?id=com.myroaddriver.app');
                },
                leading: Icon(Icons.share),
                title: Text("Share this app"),

              ),

              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SupportPage();
                      },
                    ),
                  );
                },
                leading: Icon(Icons.support_agent,

                  size: 30,
                ),
                title: Text("Support"),
              ),

              ListTile(
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AboutUS();
                      },
                    ),
                  );

                },
                leading: Icon(Icons.info_outline),
                title: Text("About Us"),
              ),


              Divider(
                thickness: 1.5,
                color: Colors.red.shade200,
              ),

              ListTile(
                leading: Icon(Icons.logout,

                  size: 30,

                ),
                title: Text("Logout"),
                onTap: (){

                },
              ),



            ],
          ),
        ),

      );
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
         child: SingleChildScrollView(
           child: Padding(

             padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [



                 Row(
                   children: [

                     IconButton(onPressed: (){
                     panelController.close();
                   }, icon: Icon(Icons.arrow_back)),

                     Text("Ride Requests",

                       style: GoogleFonts.openSans(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                       ),

                     )
                   ],
                 ),



                 Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: FirebaseAnimatedList(

                     physics: ScrollPhysics(),
                     shrinkWrap: true,
                     query: FirebaseDatabase.instance.ref("${Vtype}").child("ride_request"),
                     reverse: true,
                     itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {



                       return Container(
                                   margin: EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                     color: Colors.red.shade100,
                                     borderRadius: BorderRadius.circular(10)
                                   ),
                                   child: ListTile(
                                     onTap: (){
                                       Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                           builder: (context) {
                                             return RequestDetail(
                                               Name: "${snapshot.child("Name").value.toString()}",
                                               phoneNumb: "${snapshot.child("Phone_number").value.toString()}",
                                               destination: "${snapshot.child("Destination").value.toString()}",
                                               pickUp: "${snapshot.child("PickUp").value.toString()}",
                                               Estimated_distance: "${snapshot.child("Distance").value.toString()}",
                                               Estimated_fare: "${snapshot.child("Fare").value.toString()}",
                                               id: "${snapshot.key}",
                                               vehicleType: "${Vtype}",
                                               DriverNumb: "${widget.phnNumber}",
                                               PickUpCode: "${snapshot.child("pickupCode").value.toString()}",
                                               DropdownCode: "${snapshot.child("droppingCode").value.toString()}",
                                               drivingLicense: '${widget.licenceNum}',
                                               driversName: '${widget.full_name}',
                                               Vehiclereg: '${widget.vehicleRegNum}',

                                             );
                                           },
                                         ),
                                       );
                                     },
                                     title: Text("${snapshot.child("Name").value.toString()}"),
                                     subtitle: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("${snapshot.child("PickUp").value.toString()}"),//
                                         Text("To"),
                                         Text("${snapshot.child("Destination").value.toString()}"),
                                         Text("${snapshot.child("Phone_number").value.toString()}")
                                       ],
                                     ),
                                   ),
                                 );

                     },

                   ),
                 )











               ],
             ),
           ),
         ));
   }





}














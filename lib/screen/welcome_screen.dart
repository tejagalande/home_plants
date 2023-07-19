import 'package:custom_clippers/custom_clippers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:home_plant/screen/home_screen.dart';
import 'package:home_plant/slide_to_action.dart';
import 'package:logger/logger.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var logger = Logger(filter: null, output: null, printer: PrettyPrinter());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceInfo = DeviceInfoPlugin();
    var androidInfo = await deviceInfo.androidInfo;
    var sdkVersion = androidInfo.version.sdkInt;
    debugPrint("device sdk version -> $sdkVersion");
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    logger.i(" screenHeight: $screenHeight and screenWidth: $screenWidth");

    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
              children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.7,
                  ),
                  Text(
                    "Discover And Find Your House Plants",
                    style: GoogleFonts.londrinaSolid(
                        fontWeight: FontWeight.w500, fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting.",
                    style: GoogleFonts.londrinaSolid(
                        fontWeight: FontWeight.w300, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // SimpleExample(
                  //   callback: () {
                  //     Navigator.pushNamed( context, "/home"  );
                  //     logger.i("Swipe for shop now");
                  //   },
                  // )
                  GradientSlideToAct(
                    text: "Shop Now",
                    textStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    
                    height: 70,
                    width: screenWidth,
                    dragableIconBackgroundColor: Colors.cyan[300],
                    onSubmit: () {
                      Navigator.pushNamed(context, "/home");
                      logger.i("Swipe for shop now");
                    },
                    backgroundColor: Colors.brown.shade300,
                  ),
                  const SizedBox(height: 20,)
                  
                ],
              ),
            ),
          ),
          Positioned(
            child: ClipPath(
              clipper: SinCosineWaveClipper(
                  horizontalPosition: HorizontalPosition.right),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/cover_image.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70.0,
            left: 20.0,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(
                "asset/icons/left-arrow.svg",
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
              ],
            ),
        ));
  }
}

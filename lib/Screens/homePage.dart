import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallpaper/Constants/Uihelper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart' as carousel_slider;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> wallpaperImages = [
    "assets/images/img1.jpg",
    //
    "assets/images/img2.jpg",
    //
    "assets/images/img3.jpg",
    //
    "assets/images/img4.jpg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/images/person.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(width: 70),
                Uihelper.CustomText(
                  text: "Wallpaperia",
                  color: Colors.black,
                  fontweight: FontWeight.bold,
                  fontsize: 28,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: wallpaperImages.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      wallpaperImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  // height: MediaQuery.of(context).size.height * 1 / 2,
                  height: 400,
                  // viewportFraction: 1,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    // if (reason == CarouselPageChangedReason.manual) {
                    //   print("User manually swiped to page $index");
                    // }
                    setState(() {
                      activeIndex = index;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: wallpaperImages.length,
              effect: WormEffect(
                  dotHeight: 10, dotWidth: 10, activeDotColor: Colors.blue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              width: 200,
              // color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "Scroll ...",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

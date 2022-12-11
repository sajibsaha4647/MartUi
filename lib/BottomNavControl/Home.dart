import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:martui/Const/AppColors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../Ui/Search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final List<String> _carouselImages = [
    "Assets/photo_slideshow.png",
    "Assets/photo_slideshow.png",
    "Assets/photo_slideshow.png",
    "Assets/photo_slideshow.png",
  ];

  // ignore: non_constant_identifier_names
  final List _Topproduct = [
    {"image": "Assets/top1.jpeg", "title": "this is title", "price": 35},
    {"image": "Assets/top2.jpeg", "title": "this is title", "price": 35},
    {"image": "Assets/top1.jpeg", "title": "this is title", "price": 35},
    {"image": "Assets/top3.png", "title": "this is title", "price": 35},
    {"image": "Assets/top2.jpeg", "title": "this is title", "price": 35},
    {"image": "Assets/top1.jpeg", "title": "this is title", "price": 35},
  ];

  final List _acceories = [
    {"image": "Assets/acess1.jpeg", "title": "this is title", "price": 35},
    {"image": "Assets/acess2.jpeg", "title": "this is title", "price": 35},
    {"image": "Assets/acess3.jpeg", "title": "this is title", "price": 35},
  ];


  var _dotPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: const Drawer(),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Appcolors.deep_orange.withOpacity(0.0),
            centerTitle: true,
            title: Text("Ui Mart",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: Appcolors.deep_orange)),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Appcolors.deep_orange,
              ),
              onPressed: () {
                _globalKey.currentState!.openDrawer();
              },
            ),
            actions: const []),
        body: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  controller: search,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Appcolors.deep_orange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r))),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(Icons.search)),
                      ),
                    ),
                    // contentPadding: ,
                    border: InputBorder.none,
                    hintText: "Search here",
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF414041),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AspectRatio(
                aspectRatio: 3.5.h,
                child: CarouselSlider(
                    items: _carouselImages
                        .map((item) => Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(item),
                                        fit: BoxFit.cover)),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carouselPageChangedReason) {
                          setState(() {
                            _dotPosition = val;
                          });
                        })),
              ),
              SizedBox(
                height: 10.h,
              ),
              DotsIndicator(
                dotsCount: _carouselImages.isEmpty ? 1 : _carouselImages.length,
                position: _dotPosition.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Appcolors.deep_orange,
                  color: Appcolors.deep_orange.withOpacity(0.5),
                  spacing: const EdgeInsets.all(2),
                  activeSize: const Size(8, 8),
                  size: const Size(6, 6),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Top products',
                      style: TextStyle(
                          color: Appcolors.deep_orange,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Search()));
                          },
                          child: const Text(
                            'View All',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Appcolors.deep_orange,
                                fontWeight: FontWeight.w800),
                          ))),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                  height: 150.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _Topproduct.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            crossAxisCount: 1,
                            mainAxisSpacing: 10),
                    itemBuilder: ((context, index) {
                      // ignore: prefer_const_constructors
                      return InkWell(
                        child: Card(
                          elevation: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 80.h,
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.yellow,
                                  child: Image.asset(
                                      fit: BoxFit.fill,
                                      _Topproduct[index]["image"].toString())),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text(
                                  _Topproduct[index]["title"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text(
                                  _Topproduct[index]["price"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  )),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: const Text(
                          "Acceories",
                          style: TextStyle(
                              color: Appcolors.deep_orange,
                              fontWeight: FontWeight.w800),
                        ),
                      )),
                  // ignore: prefer_const_constructors
                  Expanded(
                      child: const Text(
                    "ViewAll",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Appcolors.deep_orange,
                        fontWeight: FontWeight.w800),
                  ))
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 150.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _acceories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      crossAxisCount: 1,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() {}),
                      child: Card(
                        elevation: 1,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 80.h,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.yellow,
                                child: Image.asset(
                                    fit: BoxFit.fill,
                                    _acceories[index]["image"].toString())),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text(
                                    _Topproduct[index]["price"].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: _acceories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() {}),
                    child: Card(
                      elevation: 1,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 80.h,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.yellow,
                              child: Image.asset(
                                  fit: BoxFit.fill,
                                  _acceories[index]["image"].toString())),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                  _Topproduct[index]["title"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1)),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                  _Topproduct[index]["price"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}

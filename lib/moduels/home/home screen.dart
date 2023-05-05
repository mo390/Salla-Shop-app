import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../read data for home/get Decription.dart';
import '../../read data for home/get image for home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> docIds = [];
  List<String> swiperImages = [
    'https://media.timeout.com/images/103399519/750/422/image.jpg',
    'https://i.insider.com/5c12b7f3a9054809970046d2?width=700',
    'https://i0.wp.com/cms.babbel.news/wp-content/uploads/2018/09/ClothesShopping.png',
    'https://www.jetsetter.com//uploads/sites/7/2018/10/J1A0923-1.jpg',
    'https://threadcurve.com/wp-content/uploads/2020/07/online-secondhand-clothing-stores-July152020-1-min.jpg.webp',
    'https://media.istockphoto.com/photos/clothes-shop-costume-dress-fashion-store-style-concept-picture-id955641488?k=20&m=955641488&s=170667a&w=0&h=Cs6SHZx9mRVhTw0EDb6Xh-UmvjybPXye_rRVmbvtrQA='
        'https://images.pexels.com/photos/1148957/pexels-photo-1148957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('home')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  void iniState() {
    getDocIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 400,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 1.0),
              items: [
                'https://images.pexels.com/photos/1148957/pexels-photo-1148957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5zz_aJgBP1QPNFmouTtwltptjAEFOSJo-hw&usqp=CAU'
                    'https://threadcurve.com/wp-content/uploads/2020/07/online-secondhand-clothing-stores-July152020-1-min.jpg.webp'
                    'https://media.istockphoto.com/photos/two-cheerful-girls-shopping-for-clothes-picture-id670741276?k=20&m=670741276&s=612x612&w=0&h=8oL9e45Zo90MxAoQ2sPXBuA_J5r4_LgC3uT2bU2nUbE='
                    'https://toronto.citynews.ca/wp-content/blogs.dir/sites/10/2020/05/21/rack-clothing-shopping-unsplash.jpg'
                    'https://thumbs.dreamstime.com/b/clothes-shop-sale-cartoon-vector-illustration-sales-assistant-customer-couple-shopping-characters-mall-fitting-room-special-145424866.jpg',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcpCTQnV0ao0_asquRC3cLXpKjLhVYW2ANxA&usqp=CAU',
                'https://thumbs.dreamstime.com/z/clothing-store-man-woman-clothes-shop-boutique-shopping-fashion-bags-accessories-flat-style-vector-illustration-55724073.jpg'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image(fit: BoxFit.cover, image: NetworkImage(i));
                  },
                );
              }).toList(),
            ),
          ),
          const Divider(color: Colors.grey),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  'New Arrival',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            width: 140,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: getDocIds(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: docIds.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 300,
                                    child: GetImageHome(
                                        documentid: docIds[index])),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GetDecription(documentid: docIds[index]),
                              )
                            ],
                          );
                        });
                  },
                )),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: Swiper(
              autoplayDelay: 6000,
              layout: SwiperLayout.STACK,
              autoplay: true,
              pagination: const SwiperPagination(),
              itemCount: swiperImages.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: double.infinity,
                    child: Image.network(swiperImages[index]));
              },
            ),
          )
        ],
      ),
    );
  }
}

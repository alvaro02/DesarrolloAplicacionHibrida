import 'package:carousel_slider/carousel_slider.dart';
import 'package:dah2021_guajardo/auto.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:math';

class Autos extends StatelessWidget {
  const Autos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RENT A CAR',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'RENT A CAR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _paginActual = 0;
  int activeIndex = 0;
  final urlImages = [
    'https://1000marcas.net/wp-content/uploads/2020/01/logo-Nissan-1.png',
    'https://assets.stickpng.com/images/580b57fcd9996e24bc43c4a3.png',
    'https://www.diariomotor.com/imagenes/picscache/750x/kia-nuevo-logo-0121-01_750x.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Icon(Icons.person),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.settings),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 12.0),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reaseon) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];

                  return buildImage(urlImage, index);
                },
              ),
              const SizedBox(height: 32),
              buildIndicator(),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              'Elige tu marca de auto',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 19.0),
              child: Image.network(
                'https://res.cloudinary.com/wpchile/image/upload//c_crop,f_auto,h_357,q_auto:good,w_935,x_362,y_73/c_scale,w_600/kovacsecrm/bms_producto/122/modelos_rav4hfinal.png',
                width: 350,
              )),
          const Align(
            alignment: Alignment(-0.6, 0),
            child: Padding(
              padding: EdgeInsets.only(top: 19.0),
              child: Text(
                'Autos más elegidos',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                   buildCard(context),
                   buildCard(context),
                   buildCard(context),
                  ],
                )),
          ),
        ],
      ),
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.star_outlined),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginActual = index;
          });
        },
        currentIndex: _paginActual,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        color: Colors.transparent,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
      );
}

Card buildCard(BuildContext context) {
  var ran = Random();
  var heading = '\$${(ran.nextInt(20) + 1).toString()}0.000 por mes';
  var subheading =
      '${(ran.nextInt(60) + 30).toString()} HP, ${(ran.nextInt(40) + 19).toString()} KM/L ciudad, ${(ran.nextInt(60) + 30).toString()}KM/L carretera';
  var cardImage = NetworkImage(
      'https://source.unsplash.com/user/alvaro753/likes/800x600?vehicle&' +
          ran.nextInt(50).toString());
  var supportingText =
      'Tenemos promociones y descuentos durante todo el año, para que puedas disfrutar de nuestro servicio.';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Text(subheading),
            trailing: Icon(Icons.favorite_outline),
          ),
          Container(
            height: 200.0,
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('CONTACTANOS'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('SABER MÁS'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => autoZoom()));
                },
              )
            ],
          ),
        ],
      ));
}

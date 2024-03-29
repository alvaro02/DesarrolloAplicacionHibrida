import 'package:dah2021_guajardo/contacto.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:math';

/* class autoZoom extends StatefulWidget {
  const autoZoom({Key? key}) : super(key: key);

  @override
  State<autoZoom> createState() => _autoZoomState();
}

class _autoZoomState extends State<autoZoom> {
  double _scale = 1.0;
  double _scaleAnterior = 1.0;

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
          title: Text('Descripción del Automovil'),
        ),
        body: ListView(padding: const EdgeInsets.all(9), children: [
          GestureDetector(
            onScaleStart: (ScaleStartDetails details) {
              print(details);
              _scaleAnterior = _scale;
              setState(() {});
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              print(details);
              _scale = _scaleAnterior * details.scale;
              setState(() {});
            },
            onScaleEnd: (ScaleEndDetails details) {
              print(details);
              _scaleAnterior = 1.0;
              setState(() {});
            },
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
              child: Column(
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
                ],
              ),
            ),
          )
        ]));
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        color: Colors.transparent,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
 */
class autoZoom extends StatefulWidget {
  autoZoom({Key? key}) : super(key: key);

  @override
  _autoZoomState createState() => _autoZoomState();
}

class _autoZoomState extends State<autoZoom>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  final double minscale = 1;
  final double maxscale = 4;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() => controller.value = animation!.value);
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Descripción del Automovil'),
        ),
        body: ListView(
          padding: EdgeInsets.all(9),
          children: [
            Container(
                child: InteractiveViewer(
              transformationController: controller,
              clipBehavior: Clip.none,
              panEnabled: false,
              minScale: minscale,
              maxScale: maxscale,
              onInteractionEnd: (details) {
                resetAnimation();
              },
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://toyota.cl/media/images/Fotos_modelos_desktop_Mesa_de_trabajo_1-10_.max-1200x425.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.black,
                        ),
                        Text('5 Asientos |'),
                        Icon(
                          Icons.savings,
                          color: Colors.black,
                        ),
                        Text('Economico |'),
                        Icon(
                          Icons.settings_remote,
                          color: Colors.black,
                        ),
                        Text('Sistema a distancia'),
                      ],
                      /*  ,
                  */
                    ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Diseño Inspirador",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Toyota ALL NEW RAV4 fue rediseñada para presentar un estilo llamativo y robusto que proyecta fuerza y te inspira a desafiar cada parte de tu día. Su audaz delantera e imponente postura exhiben su lado agresivo característico de una todo terreno, mientras que sus líneas aerodinámicas y silueta elegante acentúan su sofisticación. Ya sea que te encuentres disfrutando de la ciudad o explorando el campo, ALL NEW RAV4 fortalece tus ambiciones y te abre un camino lleno de posibilidades.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    )
                  ],
                )),
            ButtonBar(
              children: [
                ElevatedButton(
                  child: const Text('CONTACTANOS'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => formularioContacto()));
                  },
                ),
              ],
            )
          ],
        ));
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
    animationController.forward(from: 0);
  }
}

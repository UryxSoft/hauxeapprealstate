import 'package:flutter/material.dart';

class HauseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Listings'),
      ),
      body: Column(
        children: [
          // CardView horizontal
          Container(
            height: 250, // Altura del card horizontal
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PropertyCard(
                  title: 'Dreamsville House',
                  address: 'JL Sultan Iskandar Muda',
                  distance: '1.8 km',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
                SizedBox(width: 8), // Espacio entre tarjetas
                PropertyCard(
                  title: 'Ascot House',
                  address: 'JL Cilandak Tengah',
                  distance: '2.0 km',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
                SizedBox(width: 8), // Espacio entre tarjetas
                PropertyCard(
                  title: 'Modern Villa',
                  address: 'JL Dago',
                  distance: '1.2 km',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
                SizedBox(width: 8), // Espacio entre tarjetas
                PropertyCard(
                  title: 'Cozy Cottage',
                  address: 'JL Merdeka',
                  distance: '3.5 km',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
              ],
            ),
          ),

          // CardView vertical
          Expanded(
            child: ListView(
              children: [
                PropertyListCard(
                  title: 'Orchard House',
                  price: 'Rp. 2.500.000.000 / Year',
                  bedrooms: '6 Bedroom',
                  bathrooms: '4 Bathroom',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
                PropertyListCard(
                  title: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  bedrooms: '5 Bedroom',
                  bathrooms: '2 Bathroom',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
                PropertyListCard(
                  title: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  bedrooms: '5 Bedroom',
                  bathrooms: '2 Bathroom',
                  imageUrl: 'assets/house.jpg', // Cambia esto a tu imagen
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String title;
  final String address;
  final String distance;
  final String imageUrl;

  PropertyCard(
      {required this.title,
      required this.address,
      required this.distance,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ancho del card
      margin: EdgeInsets.only(left: 8.0, right: 8.0), // Margen para el card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.white.withOpacity(0.7),
                child: Text(distance, style: TextStyle(fontSize: 14)),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.white.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(address, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyListCard extends StatelessWidget {
  final String title;
  final String price;
  final String bedrooms;
  final String bathrooms;
  final String imageUrl;

  PropertyListCard(
      {required this.title,
      required this.price,
      required this.bedrooms,
      required this.bathrooms,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                imageUrl,
                width: 60, // Ancho de la imagen
                height: 60, // Altura de la imagen
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16), // Espacio entre la imagen y el texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(price,
                      style: TextStyle(fontSize: 16, color: Colors.blue)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bedrooms, style: TextStyle(fontSize: 14)),
                      Text(bathrooms, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

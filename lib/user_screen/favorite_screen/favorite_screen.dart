import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<PropertyCard> propertyCards = [
    PropertyCard(
      title: "Dreamsville House",
      address: "JL. Sultan Iskandar Muda, Jakarta selatan",
      distance: "1.8 km",
      bedrooms: "6 Bedroom",
      bathrooms: "4 Bathroom",
      image: "assets/house.jpg",
      description:
          "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.",
      owner: "Garry Allen",
      price: "Rp. 2.500.000.000 / Year",
      gallery: [
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
      ],
    ),
    PropertyCard(
      title: "Dreamsville House",
      address: "JL. Sultan Iskandar Muda, Jakarta selatan",
      distance: "1.8 km",
      bedrooms: "6 Bedroom",
      bathrooms: "4 Bathroom",
      image: "assets/house.jpg",
      description:
          "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.",
      owner: "Garry Allen",
      price: "Rp. 2.500.000.000 / Year",
      gallery: [
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
      ],
    ),
    PropertyCard(
      title: "Dreamsville House",
      address: "JL. Sultan Iskandar Muda, Jakarta selatan",
      distance: "1.8 km",
      bedrooms: "6 Bedroom",
      bathrooms: "4 Bathroom",
      image: "assets/house.jpg",
      description:
          "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.",
      owner: "Garry Allen",
      price: "Rp. 2.500.000.000 / Year",
      gallery: [
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
      ],
    ),
    PropertyCard(
      title: "Dreamsville House",
      address: "JL. Sultan Iskandar Muda, Jakarta selatan",
      distance: "1.8 km",
      bedrooms: "6 Bedroom",
      bathrooms: "4 Bathroom",
      image: "assets/house.jpg",
      description:
          "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.",
      owner: "Garry Allen",
      price: "Rp. 2.500.000.000 / Year",
      gallery: [
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
        "assets/house.jpg",
      ],
    ),
    // Agrega más PropertyCard si es necesario
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: propertyCards.length,
      itemBuilder: (context, index) {
        return PropertyCardWidget(propertyCard: propertyCards[index]);
      },
    );
  }
}

class PropertyCard {
  final String title;
  final String address;
  final String distance;
  final String bedrooms;
  final String bathrooms;
  final String image;
  final String description;
  final String owner;
  final String price;
  final List<String> gallery;
  bool isBookmarked; // Estado del marcador

  PropertyCard({
    required this.title,
    required this.address,
    required this.distance,
    required this.bedrooms,
    required this.bathrooms,
    required this.image,
    required this.description,
    required this.owner,
    required this.price,
    required this.gallery,
    this.isBookmarked = false, // Inicialmente no está marcado
  });
}

class PropertyCardWidget extends StatefulWidget {
  final PropertyCard propertyCard;

  PropertyCardWidget({required this.propertyCard});

  @override
  _PropertyCardWidgetState createState() => _PropertyCardWidgetState();
}

class _PropertyCardWidgetState extends State<PropertyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PropertyDetailsScreen(propertyCard: widget.propertyCard),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.propertyCard.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  widget.propertyCard.isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    widget.propertyCard.isBookmarked =
                        !widget.propertyCard.isBookmarked;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.propertyCard.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.propertyCard.address,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.propertyCard.distance,
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(Icons.bed, color: Colors.white, size: 16),
                            SizedBox(width: 5),
                            Text(widget.propertyCard.bedrooms,
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Icon(Icons.bathroom, color: Colors.white, size: 16),
                            SizedBox(width: 5),
                            Text(widget.propertyCard.bathrooms,
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
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

// Nueva clase para la pantalla de detalles
class PropertyDetailsScreen extends StatelessWidget {
  final PropertyCard propertyCard;

  PropertyDetailsScreen({required this.propertyCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(propertyCard.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding agregado
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      propertyCard.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.bed, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(propertyCard.bedrooms,
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.bathroom, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(propertyCard.bathrooms,
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    propertyCard.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    propertyCard.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Owner: ${propertyCard.owner}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Gallery",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: propertyCard.gallery.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () => _showGallery(context, index),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                propertyCard.gallery[index],
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  // Mover el precio aquí, debajo de la galería
                  Text(
                    propertyCard.price,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para rentar la propiedad
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Rent Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGallery(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GalleryDialog(
            propertyCard: propertyCard, initialIndex: initialIndex);
      },
    );
  }
}

class GalleryDialog extends StatefulWidget {
  final PropertyCard propertyCard;
  final int initialIndex;

  GalleryDialog({required this.propertyCard, required this.initialIndex});

  @override
  _GalleryDialogState createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<GalleryDialog> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)), // Bordes curvos
      child: Container(
        height: 450, // Altura del modal
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.propertyCard.gallery.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                      16.0), // Bordes curvos para la imagen
                  child: Image.asset(
                    widget.propertyCard.gallery[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
            Positioned(
              left: 10,
              top: 170, // Ajusta la posición vertical de los botones
              child: IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.white, size: 32),
                onPressed: () {
                  if (_controller.page!.round() > 0) {
                    _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
              ),
            ),
            Positioned(
              right: 10,
              top: 170, // Ajusta la posición vertical de los botones
              child: IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white, size: 32),
                onPressed: () {
                  if (_controller.page!.round() <
                      widget.propertyCard.gallery.length - 1) {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

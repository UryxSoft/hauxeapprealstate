class VirtualModel {
  final String img;
  final String title;

  VirtualModel({
    required this.img,
    required this.title,
  });

  static List<VirtualModel> virtualModel = [
    VirtualModel(
      img: 'assets/images/house.jpg',
      title: "Outside House",
    ),
    VirtualModel(
      img: 'assets/images/bedroom.jpg',
      title: "Bedroom",
    ),
    VirtualModel(
      img: 'assets/images/kitchen.jpg',
      title: "Kitchen",
    ),
    VirtualModel(
      img: 'assets/images/living_room.jpg',
      title: "Living Room",
    ),
  ];
}

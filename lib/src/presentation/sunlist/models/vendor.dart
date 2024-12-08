class Vendor {
  final int id;
  final String name, location, description;
  final double rating;
  List<String> imageUrls, services, products;

  Vendor({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rating,
    required this.imageUrls,
    required this.services,
    required this.products,
  });
}



var vendorList = [
  Vendor(
      id: 1,
      name: 'Amantha Power Connect',
      location: 'Bandung, Jawa Barat',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-1.jpg',
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-4.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 2,
      name: 'PT Surya Pelita',
      location: 'Surabaya, Jawa Timur',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-1.jpg',
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-5.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 3,
      name: 'CV Solaris Cahaya Terang',
      location: 'Bogor, Jawa Barat',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-5.jpg',
        'assets/images/vendor/vendor-4.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 4,
      name: 'PT Sun Power',
      location: 'Jakarta, DKI Jakarta',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-4.jpg',
        'assets/images/vendor/vendor-5.jpg',
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-3.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 5,
      name: 'CV Sanjaya Cahaya Bumi',
      location: 'Malang, Jawa Timur',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-5.jpg',
        'assets/images/vendor/vendor-4.jpg',
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-2.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 6,
      name: 'SunPower Corporation',
      location: 'Bandung, Jawa Barat',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-1.jpg',
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-4.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 7,
      name: 'Canadian Solar',
      location: 'Surabaya, Jawa Timur',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-1.jpg',
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-5.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 8,
      name: 'Jinko Solar',
      location: 'Bogor, Jawa Barat',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-5.jpg',
        'assets/images/vendor/vendor-4.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 9,
      name: 'First Solar',
      location: 'Jakarta, DKI Jakarta',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-4.jpg',
        'assets/images/vendor/vendor-5.jpg',
        'assets/images/vendor/vendor-2.jpg',
        'assets/images/vendor/vendor-3.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
  Vendor(
      id: 10,
      name: 'Trina Solar',
      location: 'Malang, Jawa Timur',
      description:
          'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
      rating: 4.9,
      imageUrls: [
        'assets/images/vendor/vendor-5.jpg',
        'assets/images/vendor/vendor-4.jpg',
        'assets/images/vendor/vendor-3.jpg',
        'assets/images/vendor/vendor-2.jpg',
      ],
      services: [
        'Instalasi panel surya',
        'Pembersihan panel surya',
        'Perbaikan panel surya',
      ],
      products: [
        'Produk A',
        'Produk B',
        'Produk C',
      ]),
];

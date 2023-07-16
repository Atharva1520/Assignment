import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({super.key});

  @override
  State<SwiperScreen> createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  final List<Map<String, dynamic>> items = [
    {
      'imageUrl':
          'https://cdn.dribbble.com/users/76502/screenshots/15122251/media/cb0aa104c3991019970a3e19e867ecb6.png?compress=1&resize=400x300&vertical=center',
      'heading': 'Create Your Own Plate',
      'text':
          'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
    },
    {
      'imageUrl': 'https://fitpage.in/wp-content/uploads/2021/11/Article2.png',
      'heading': 'Exquisite Catering',
      'text':
          'Experience culinary artistry like never before with our innovative and exquisite cuisine creations.',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/hand-drawn-people-talking-phone-illustration_23-2149826997.jpg?w=2000',
      'heading': 'Personal Order Executive',
      'text':
          'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
    },
  ];

  SwiperController _swiperController = SwiperController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 192, 254),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              SizedBox(
                height:
                    constraints.maxHeight * 0.7, // Adjust the height as needed
                child: Swiper(
                  loop: false,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.4,
                          child: Image.network(
                            items[index]['imageUrl'],
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          items[index]['heading'],
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            items[index]['text'],
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  pagination: const SwiperPagination(),
                  controller: _swiperController,
                  onIndexChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              if (_currentIndex == items.length - 1)
                Container(
                  width: constraints.maxWidth * 0.5,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 244, 192, 254),
                      borderRadius: BorderRadius.circular(40)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 45,
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ),
                )
              else
                IconButton(
                  onPressed: () {
                    _swiperController.next();
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_rounded,
                    size: 50,
                    color: Colors.deepPurple,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

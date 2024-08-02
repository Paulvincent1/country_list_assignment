import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

var countries = [
  CountryItem(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/1024px-Flag_of_the_Philippines.svg.png",
    countryName: "Philippines",
    continent: "Asia",
    language: "Filipino",
  ),
  CountryItem(
    url: "https://images5.alphacoders.com/687/687027.png",
    countryName: "Japan",
    continent: "Asia",
    language: "Japanese",
  ),
  CountryItem(
    url:
        "https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg",
    countryName: "USA",
    continent: "North America",
    language: "English",
  ),
  CountryItem(
    url: "https://cdn.britannica.com/49/1949-050-39ED83BA/Flag-South-Korea.jpg",
    countryName: "South Korea",
    continent: "North America",
    language: "Korean",
  ),
  CountryItem(
    url: "https://cdn.britannica.com/48/1648-050-9C1F365D/Flag-Indonesia.jpg",
    countryName: "Indonesia",
    continent: "Asia",
    language: "Indonesian",
  ),
  CountryItem(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_Russia.png",
    countryName: "Russia",
    continent: "Asia/Europe",
    language: "Russian",
  ),
  CountryItem(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Flag_of_Malaysia.png/1200px-Flag_of_Malaysia.png",
    countryName: "Malaysia",
    continent: "Asia",
    language: "Malay",
  ),
  CountryItem(
    url: "https://cdn.britannica.com/90/7490-050-5D33348F/Flag-China.jpg",
    countryName: "China",
    continent: "Asia",
    language: "Mandarin",
  ),
  CountryItem(
    url:
        "https://www.iconarchive.com/download/i109087/wikipedia/flags/CA-Canada-Flag.1024.png",
    countryName: "Canada",
    continent: "North America",
    language: "English",
  ),
  CountryItem(
    url: "https://cdn.britannica.com/82/682-050-8AA3D6A6/Flag-France.jpg",
    countryName: "France",
    continent: "Europe",
    language: "French",
  ),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'Country List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return countries[index];
        },
      ),
    );
  }
}

class CountryItem extends StatelessWidget {
  const CountryItem({
    required this.url,
    required this.countryName,
    required this.continent,
    required this.language,
    super.key,
  });

  final String url;
  final String countryName;
  final String continent;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.deepPurple,
        height: 200,
        child: Row(
          children: [
            Container(
              color: Colors.deepPurple[400],
              height: 150,
              width: 150,
              child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.error,
                      size: 40,
                      color: Colors.red,
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                        color: Colors.deepPurple[400],
                        width: 2,
                        height: 2,
                        child: CircularProgressIndicator());
                  },
                  fit: BoxFit.fill,
                  imageUrl: '$url'),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                // color: Colors.amber,
                // width: 10,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Description(
                      title: 'Country',
                      content: '$countryName',
                    ),
                    Description(
                      title: 'Continent',
                      content: '$continent',
                    ),
                    Description(
                      title: 'Language',
                      content: '$language',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title: ',
        style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: '$content',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

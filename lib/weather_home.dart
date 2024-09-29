import 'package:flutter/material.dart';
import 'weather_model.dart'; 

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  Future<Weather>? futureWeather; 
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  void _getWeather() {
    setState(() {
      futureWeather = fetchWeather(_controller.text); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Colors.black, 
        elevation: 0, 
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/2.jpeg', 
              fit: BoxFit.cover, 
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded( 
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true, 
                          fillColor: Colors.white, 
                          labelText: 'Search City',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none, 
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), 

                 
                    ElevatedButton(
                      onPressed: _getWeather, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, 
                        foregroundColor: const Color.fromARGB(255, 102, 6, 119),   
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), 
                        ),
                      ),
                      child: const Text('Get Weather'),
                    ),
                  ],
                ),

                const SizedBox(height: 20), 

                
                Align(
                  alignment: Alignment.center, 
                  child: Image.asset(
                    'assets/images/0.png', 
                    width: 120, 
                    height: 120, 
                  ),
                ),

                const SizedBox(height: 40), 

             
                FutureBuilder<Weather>(
                  future: futureWeather,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(); 
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.white)); 
                    } else if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Transparent background
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text('City: ${snapshot.data!.cityName}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            Text('Temperature: ${snapshot.data!.temperature.toStringAsFixed(1)}°C',
                                style: const TextStyle(fontSize: 18, color: Colors.white)),
                            Text('Description: ${snapshot.data!.description}',
                                style: const TextStyle(fontSize: 18, color: Colors.white)),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

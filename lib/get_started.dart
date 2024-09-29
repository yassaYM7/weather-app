import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/1.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
              
                SizedBox(height: 50), 
              
                Image.asset(
                  'assets/images/0.png', 
                  width: 400, 
                  height: 400, 
                ),
                SizedBox(height: 40), 
              
                Text(
                  'Welcome to Weather App!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
                SizedBox(height: 20), 
             
                ElevatedButton(
                  onPressed: () {
              
                    Navigator.pushNamed(context, '/weather');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,  
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  ),
                  child: Text(
                    'Get Start',
                    style: TextStyle(color: const Color.fromARGB(255, 102, 6, 119), fontSize: 24), 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

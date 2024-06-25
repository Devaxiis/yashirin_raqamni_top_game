import 'package:find_number/src/initial_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: const Text("Bosh sahifa",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const InitialScreen()));
            },
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              height: 120,
              width: width,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 110,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        )
                    ),
                  ),
                  const Text('Boshlash',style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

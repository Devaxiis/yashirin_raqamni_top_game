import 'package:find_number/src/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  TextEditingController firstUser = TextEditingController();
  TextEditingController secondUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Testni boshlash",style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.deepPurple
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller:firstUser,
              decoration: const InputDecoration(
                labelText: 'Birinchi userning ismi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondUser,
              decoration: const InputDecoration(
                labelText: 'Ikkinchi userning ismi',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                if(firstUser.text != "" && secondUser.text != ""){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> GameScreen(firstUser: firstUser.text,secondUser: secondUser.text,)));
                }else{
                  toastification.show(
                    context: context,
                    type: ToastificationType.error,
                    style: ToastificationStyle.flat,
                    alignment: Alignment.bottomCenter,
                    title: const Text('Iltimos o\'zingiz uchun ism kriting!',style: TextStyle(
                      color: Colors.deepPurple
                    ),),
                    autoCloseDuration: const Duration(seconds: 5),
                  );
                }
              },
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 70,
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
                      height: 60,
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
            )
          ],
        ),
      ),
    );
  }
}

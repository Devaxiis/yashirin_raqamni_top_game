import 'dart:math';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class GameScreen extends StatefulWidget {
  final String firstUser;
  final String secondUser;
  const GameScreen({super.key, required this.firstUser, required this.secondUser});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController firstUser = TextEditingController();
  TextEditingController secondUser = TextEditingController();
  FocusNode node = FocusNode();
  FocusNode node2 = FocusNode();
  int number = 0;
  bool asd = false;
  bool text = false;


  @override
  void initState() {
    super.initState();
    randomFun();
  }

  void randomFun(){
    Random random = Random();
    number = random.nextInt(100) + 1;
     print("----------------");
    print('Random number: $number');
     print("----------------");

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    firstUser.text = "";
    secondUser.text = "";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Yashirin raqamni toping?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.deepPurple
          ),
        ),
        actions: [
          text?IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.exit_to_app_outlined,color: Colors.deepPurple,)):const SizedBox()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${asd ?widget.secondUser:widget.firstUser} iltimos raqamni toping.".toUpperCase()),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child:asd ? TextField(
                  controller:secondUser,
                  // focusNode: node,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration:  InputDecoration(
                    labelText: widget.secondUser,
                    border: OutlineInputBorder(),
                  )):
              TextField(
                controller:firstUser,
                // focusNode: node2,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration:  InputDecoration(
                  labelText: widget.firstUser,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                    if(text == false){
                      if(int.tryParse(firstUser.text) is int || int.tryParse(secondUser.text) is int){
                        if(firstUser.text == "$number" || secondUser.text == "$number"){
                          if(asd){
                            toastification.show(
                              context: context,
                              type: ToastificationType.success,
                              style: ToastificationStyle.fillColored,
                              primaryColor: Colors.greenAccent,
                              foregroundColor: Colors.white,
                              title:  Text('${widget.secondUser} sizni tabriklaymiz',style: const TextStyle(
                                  color: Colors.deepPurple
                              ),),
                              autoCloseDuration: const Duration(seconds: 5),
                            );
                            text = true;
                          }else{
                            toastification.show(
                              context: context,
                              type: ToastificationType.success,
                              style: ToastificationStyle.fillColored,
                              primaryColor: Colors.greenAccent,
                              foregroundColor: Colors.white,
                              title:  Text('${widget.firstUser} sizni tabriklaymiz',style: const TextStyle(
                                  color: Colors.deepPurple
                              ),),
                              autoCloseDuration: const Duration(seconds: 5),
                            );
                            text = true;
                          }
                        }else{
                          if(asd){
                            if(int.tryParse(secondUser.text)! <= number){
                              toastification.show(
                                context: context,
                                type: ToastificationType.error,
                                style: ToastificationStyle.flat,

                                title: const Text('Kiritilgan qiymat kichik son',style: TextStyle(
                                    color: Colors.deepPurple
                                ),),
                                autoCloseDuration: const Duration(seconds: 5),
                              );
                            }else{
                              toastification.show(
                                context: context,
                                type: ToastificationType.error,
                                style: ToastificationStyle.flat,

                                title: const Text('Kiritilgan qiymat katta son!',style: TextStyle(
                                    color: Colors.deepPurple
                                ),),
                                autoCloseDuration: const Duration(seconds: 5),
                              );
                            }
                          }else{
                            if(int.tryParse(firstUser.text)! <= number){
                              toastification.show(
                                context: context,
                                type: ToastificationType.error,
                                style: ToastificationStyle.flat,
                                title: const Text('Kiritilgan qiymat kichik son!',style: TextStyle(
                                    color: Colors.deepPurple
                                ),),
                                autoCloseDuration: const Duration(seconds: 5),
                              );
                            }else{
                              toastification.show(
                                context: context,
                                type: ToastificationType.error,
                                style: ToastificationStyle.flat,
                                title: const Text('Kiritilgan qiymat katta son!',style: TextStyle(
                                    color: Colors.deepPurple
                                ),),
                                autoCloseDuration: const Duration(seconds: 5),
                              );
                            }
                          }
                        }
                      }
                      else{
                        toastification.show(
                          context: context,
                          type: ToastificationType.error,
                          style: ToastificationStyle.flat,
                          title: const Text('Xato qiymat kiritdingiz!',style: TextStyle(
                              color: Colors.deepPurple
                          ),),
                          autoCloseDuration: const Duration(seconds: 5),
                        );
                      }
                    }else{
                      randomFun();
                      text = false;
                    }
                    firstUser.text = "";
                    secondUser.text = "";
                    setState(() {
                     asd = !asd;
                    });
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
                      Text(text ?"Qayta o'ynash":"Boshlash",style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchLite extends StatefulWidget {
  const TorchLite({Key? key}) : super(key: key);

  @override
  State<TorchLite> createState() => _TorchLiteState();
}

class _TorchLiteState extends State<TorchLite> {
  final bgColor = const Color(0xff2c3333);
  final textColor = const Color(0xffe7f6f2);
  bool isActivated = false;
  var controller = TorchController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Torch Light",
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      isActivated
                          ? "assets/images/bulb_on.png"
                          : "assets/images/bulb_off.png",
                      width: 300,
                      height: 500,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 45,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        onPressed: (){
                          controller.toggle();
                          isActivated = !isActivated;
                          setState((){

                          });
                        },
                        icon: Icon(Icons.power_settings_new,color: isActivated ? Colors.redAccent:Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Text(
            "Developed By Sikander",
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}

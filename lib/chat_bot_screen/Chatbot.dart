import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),),
      body:  Stack(children: [
        WebView(
          onWebViewCreated: (controller) async{


          },
          onPageFinished: (url){
            print('/././//.');
          },

          onProgress: (prog) async{
            if(prog==100){
              await Future.delayed(const Duration(seconds: 3));
              isLoading = false;
              setState(() {

              });
            }
          },


          zoomEnabled: false,
          javascriptMode: JavascriptMode.unrestricted,backgroundColor: Colors.white,initialUrl: 'https://mediafiles.botpress.cloud/3b60e711-c58f-43bb-baec-62952aed8a53/webchat/bot.html',),
        isLoading?const Center(child:SizedBox(width: 24,height: 24,child: CircularProgressIndicator(color: Colors.black,strokeWidth: 2,),),):const SizedBox()
      ],)
    );
  }
}

//
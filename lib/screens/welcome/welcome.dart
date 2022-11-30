import 'package:flutter/material.dart';
import 'package:intro_app_custom_ui/screens/welcome/content.dart';



class Welcome extends StatefulWidget{

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome>{
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  void gotoPage(){
    print("Thankyou");
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: SafeArea(
              left: true,
              top: true,
              right: true,
              bottom: true,
              minimum: const EdgeInsets.all(16.0),
              child: Text("DevHubSpot", style: TextStyle(color: Colors.pinkAccent[700], fontSize: 40, fontWeight: FontWeight.w600),),
            ),
          ),

          Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i){
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, left: 60, right: 60, bottom: 40),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image, height: 300,
                        )
                      ],
                    ),
                  );
                },
              )
          ),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top:Radius.circular(50)),
              color: Colors.pinkAccent[700]
            ),
            child: new Column(
              children: [
                new Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top:50, left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        Text(
                          contents[currentIndex].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          contents[currentIndex].discription,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey[100]),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      left: true,
                      top: true,
                      right: true,
                      bottom: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaterialButton(
                                minWidth: 50,
                                onPressed: () {
                                  gotoPage();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Skip", style: TextStyle(color:Colors.white70, fontSize: 18.0, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              contents.length, (index) => buildDot(index, context),
                            ),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaterialButton(
                                minWidth: 50,
                                onPressed: () {
                                  if(currentIndex == contents.length-1){
                                    gotoPage();
                                  }else{
                                    _controller.animateToPage(currentIndex+1, duration: Duration(milliseconds: 250), curve: Curves.linear);
                                    setState(() {
                                      currentIndex = currentIndex+1;
                                    });
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      currentIndex == contents.length-1 ? "Done":"Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index ? 25 :10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
    );
  }
}


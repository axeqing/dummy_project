import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';

class PageOf extends StatelessWidget {
  var description = Container(
      child: Text(
    "Ostatni miesiąc wakacji otwieramy gorącą ofertą"
    "promocyjną! Suplementy diety NUTRICODE pomogą"
    "zadbać Wam o piękną skórę i idealną sylwetkę."
    "Wasze pociechy będą mogły beztrosko korzystać ze"
    "słonecznej pogody dzięki wysokim filtrom"
    "produktów do opalania."
    "\nPanie zachwycą letnim makeupem za sprawą"
    " kolorowych kosmetyków do makijażu. Nie "
    "zapomnieliśmy też o komforcie podróży na wyczekany urlop.",
    style: TextStyle(color: Colors.white),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      extendBody: true,
      appBar: AppBar(
        title: Text("Panel Showcase"),
        backgroundColor: Colors.blueGrey,
      ),

      // Lets use docked FAB for handling state of sheet
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        // Set onVerticalDrag event to drag handlers of controller for swipe effect
        onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
        onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
        child: FloatingActionButton.extended(
          label: Text("Discover"),
          elevation: 1,
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,

          //Set onPressed event to swap state of bottom bar
          onPressed: () => DefaultBottomBarController.of(context).swap(),
        ),
      ),

      // Actual expandable bottom bar
      bottomNavigationBar: BottomExpandableAppBar(
          bottomAppBarColor: Colors.blueGrey,
          expandedHeight: 450,
          horizontalMargin: 16,
          shape: AutomaticNotchedShape(
              RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
          expandedBackColor: Colors.black,
          expandedBody: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Hello world!",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: description,
              )
            ],
          ),
          bottomAppBarBody: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: '0 Iteasdasdm',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nasjasdasdasasasddjjjj',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ]),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {},
                      child: const Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}

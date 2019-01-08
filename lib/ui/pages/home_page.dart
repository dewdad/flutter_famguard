import 'package:famguard/data/values.dart';
import 'package:famguard/ui/components/circular_image.dart';
import 'package:famguard/ui/components/option_card.dart';
import 'package:famguard/ui/components/panic_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String imageUrl = "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";



  Widget buildCustomAppBar() {

    List<Widget> _navigationWidgetList = [
      IconButton(
        onPressed: (){},
        icon: Icon(Icons.add_alert, color: Colors.white,),
        padding: EdgeInsets.all(32),
      ),
      IconButton(
        onPressed: (){},
        icon: Hero(
          tag: 'app_icon',
            child: ImageIcon(AssetImage('images/app_icon.png'), color: Colors.white,)
        ),
        padding: EdgeInsets.all(32),
      ),
      IconButton(
        onPressed: () => Navigator.of(context).pushNamed('/settings'),
        icon: Icon(Icons.settings, color: Colors.white,),
        padding: EdgeInsets.all(32),
      ),
    ];

    return Container(
      height: 190,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                gradient: appGradient,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80)
                ),
            ),

          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CircularImage(NetworkImage(imageUrl), width: 90, height: 90,showBorder: true,),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _navigationWidgetList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OptionCard('Track', Icons.track_changes,(){
          Navigator.of(context).pushNamed('/tracks');
        }),
        OptionCard('Member', Icons.people,(){
          Navigator.of(context).pushNamed('/members');
        }),
        OptionCard('Public Info', Icons.question_answer,(){ }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildCustomAppBar(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Switch(value: true, onChanged: (v){}, activeColor: colorGradientTop,),
                    Text('Active Track', ),
                  ],
                ),
              ),
          Container(
            color: Colors.grey[400],
            height: 125,
            width: double.maxFinite,
            //TODO: place Google Maps here
            child: Image(image: AssetImage('images/maps.jpg',),
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: <Widget>[
                  buildOptions(),
                  GestureDetector(
                    child: Hero(
                      tag: "panic",
                      child: PanicButton(),
                    ),
                    onTap: (){
                      Navigator.of(context).pushNamed('/panic');
                    },
                  ),
                  Text("Click 3 times to send emergency message",
                  style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

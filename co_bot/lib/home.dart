import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:co_bot/color_filters.dart';
import 'package:co_bot/faqroute.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:co_bot/cobotroute.dart';


_launchURLBrowser() async {
  const url = 'https://www.cowin.gov.in/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class HomeScreen extends StatelessWidget
{

  final List<String> imagesList=
  [
    
     "assets/home1.png",
     "assets/home2.jpg",
     "assets/home3.jpg",
     "assets/home5.jpg",
     "assets/home6.png",
  ];
  
  Widget build(BuildContext context) 
  {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Stack
    (
      children:
      [
        Container
        (
          child: CarouselSlider
          (
            options: CarouselOptions
            (
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items:imagesList.map((e)=> ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack
              (
                fit:StackFit.expand,
                children:<Widget>
                [
                  Image.asset(e,
                  width:width,
                  height:height*0.36,
                  fit:BoxFit.fill
                  ),
                ],

              ),

            )).toList()
          ),
          height: height*0.40,                                
          width:width,
          color: Colors.transparent,
        ),
        DraggableScrollableSheet
        (
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 1.0,
          builder: (BuildContext context, myScrollController)
          {
            return Padding(
              padding:const EdgeInsets.all(5.0), 
              child:Container(
                child:ListView
                (
                  controller: myScrollController,
                  children:
                  [
                    Card
                    (
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),),
                      child: Stack
                      (
                        alignment: Alignment.bottomCenter,
                        children: 
                        [
                          Ink.image
                          ( 
                            image: AssetImage('assets/home7.jpg'),
                            colorFilter: ColorFilters.greyscale,
                            child:InkWell
                            (
                              onTap: _launchURLBrowser,
                            ),
                            height: 240,
                            fit:BoxFit.cover,
                            ),
                          Text
                          (
                            'Register for Vaccine',
                            style:TextStyle
                            (
                              fontWeight:FontWeight.bold,
                              color: Colors.blue ,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card
                    (   
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.amber,
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                      child:Container
                      (
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                        gradient: LinearGradient(
                        colors: [Colors.indigo,Colors.white10],
                        begin: Alignment.topLeft,
                        end:Alignment.bottomRight,)),
                        
                        child:Column
                        (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text
                            (
                              'Co-Bot',
                              style:TextStyle(fontSize: 22,fontWeight:FontWeight.bold ,color:Colors.white),
                            ),
                            const SizedBox(height: 12), 
                            Text
                            (
                              'We are here to provide info about COVID-19',
                              style :TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: -1),
                            ),
                            const SizedBox(height: 12),
                            Text
                            (
                              'Infomation about virus',
                              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Text
                            (
                              'Symptoms and Precautions',
                              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Text
                            (
                              'Vaccination Details',
                              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Text
                            (
                              'Symptom Checking',
                              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            TextButton 
                            (
                              onPressed:(){Navigator.push(context,Cobotroute());},
                              child:
                                Text
                                (
                                  'Say hello to co-bot',
                                  style:TextStyle
                                  (
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    Card
                    (
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      ),
                      child:Stack
                      (
                        children: 
                        [
                          Ink.image
                          (
                            image: AssetImage('assets/home8.png'),
                            child:InkWell
                            (
                            onTap:(){Navigator.push(context,FAQroute());},
                            ),
                            height: 250,
                            fit:BoxFit.cover,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

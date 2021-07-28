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
    'https://www.who.int/images/default-source/health-topics/coronavirus/myth-busters/mythbuster-bacteria-vs-virus.png',
    'https://cdn.who.int/media/images/default-source/vaccines-explained/vaccines-explained_topic-9_getting-vaccinated_mask_hd.jpg?sfvrsn=78d2abdc_25',
    'https://peacekeeping.un.org/sites/default/files/un75_sg_quote_twitter.jpg',
    'https://assets.thehansindia.com/h-upload/2021/01/10/1024039-frontline-warriors.webp',
    'https://pbs.twimg.com/media/E2ork4KUcAM2nOn.jpg',
    'https://i1.rgstatic.net/ii/institution.image/AS%3A267468965122053%401440780978376_l',
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
                  Image.network(e,
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
                            image: NetworkImage('https://wwwassets.rand.org/content/rand/blog/2020/08/its-going-to-be-the-vaccination-stupid/jcr:content/par/teaser.aspectfit.0x1200.jpg/1598296544648.jpg'),
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
                            image: NetworkImage('https://don16obqbay2c.cloudfront.net/wp-content/uploads/FAQ-1496222256.png'),
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

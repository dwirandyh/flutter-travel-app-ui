import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:flutter_travel_ui/screens/destination_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Top Destination",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {
                  print("See All clicked");
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                Destination destination = destinations[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DestinationScreen(
                                  destination: destination,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${destination.activities.length} activities",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                  Text(
                                    destination.description,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          bottom: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0)
                              ]),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                  child: Image(
                                      height: 180.0,
                                      width: 180.0,
                                      fit: BoxFit.cover,
                                      image: AssetImage(destination.imageUrl)),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          destination.country,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

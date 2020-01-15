import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:flutter_travel_ui/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
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
                "Exclusive Hotels",
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
                Hotel hotel = hotels[index];

                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 300.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          height: 120.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  hotel.name,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  hotel.address,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  '\$${hotel.price} / night',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0),
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
                            ClipRRect(
                              child: Image(
                                  height: 180.0,
                                  width: 290.0,
                                  fit: BoxFit.cover,
                                  image: AssetImage(hotel.imageUrl)),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}

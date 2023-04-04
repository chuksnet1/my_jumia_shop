import 'package:flutter/material.dart';
import 'package:my_jumia_shop/model/moving_data.dart';

class MovingContainer extends StatelessWidget {
  final Dummy_Muving = [
    MovingData(
      id: 'm1',
      imagePics: Image.asset('asset/image/Black.jpeg'),
      name: 'Low price',
    ),
    MovingData(
      id: 'm1',
      imagePics: Image.asset('asset/image/electronics.png'),
      name: 'Low price',
    ),
    MovingData(
      id: 'm1',
      imagePics: Image.asset('asset/image/flassales.jpeg'),
      name: 'Low price',
    ),
    MovingData(
      id: 'm1',
      imagePics: Image.asset('asset/image/fashion.png'),
      name: 'Low price',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Dummy_Muving.length,
          itemBuilder: (contex, index) {
            return Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  color: Colors.amber,
                  height: 160,
                  width: 250,
                  child: Dummy_Muving[index].imagePics,
                ),
              ],
            );
          }),
    );
  }
}

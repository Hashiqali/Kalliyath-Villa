import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List images = [
    'assets/images/house decoration mod minecraft.jpeg',
    'assets/images/Modern Villa Elevation Design.jpeg',
    'assets/images/New contemporary villa with private pool in Cortijo Blanco Beach Marbella _ Realista.jpeg',
    'assets/images/Wall decoration Room decoration Home decor Floor deco Balcony design Home entrance decor Home entran.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Kalliyath',
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_outlined),
                  suffixIcon: IconButton(
                      icon: const Icon(EvaIcons.options2), onPressed: () {}),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 240, 238, 238),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      fontFamily: 'Kalliyath1',
                      color: Color.fromARGB(210, 158, 158, 158)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Container(
                height: size.height / 3.3,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/Modern House Design.jpeg')),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 21,
                          child: IconButton(
                              icon: const Icon(
                                EvaIcons.heartOutline,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              onPressed: () {}),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: size.height / 12,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text('Dolce Vita Villa,Malappuram,Kerala',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Kalliyath2',
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                                left: 6,
                                right: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                          height: 17,
                                          width: 17,
                                          image: AssetImage(
                                              'assets/images/star (1).png')),
                                      SizedBox(
                                        width: size.width / 70,
                                      ),
                                      const Text('4.9',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontFamily: 'Kalliyath2',
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: size.width / 40,
                                      ),
                                      const Text('10k Reviews',
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(155, 0, 0, 0),
                                              fontSize: 16,
                                              fontFamily: 'Kalliyath2',
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('₹2000',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontFamily: 'Kalliyath2',
                                              fontWeight: FontWeight.w600)),
                                      Text('/night',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Kalliyath2',
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final image = images[index];
                    return GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: AssetImage(image)),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: size.height / 25,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: size.width / 7,
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                              height: 13,
                                              width: 13,
                                              image: AssetImage(
                                                  'assets/images/star (1).png')),
                                          Text(' 4.9 ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: 'Kalliyath2',
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 18,
                                    child: IconButton(
                                        icon: const Icon(
                                          EvaIcons.heartOutline,
                                          size: 20,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height / 20,
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: const Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Dolce Vita Villa',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontFamily: 'Kalliyath2',
                                                fontWeight: FontWeight.w600)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text('₹2000',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'Kalliyath2',
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

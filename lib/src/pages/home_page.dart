import 'package:flutter/material.dart';
import 'package:food_app/src/pages/details_producto.dart';
import 'package:food_app/src/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['Pizza', 'Hamburguesas', 'Tacos', 'Sushi', 'Postres', 'Bebidas'];

    List<String> images = [
      'assets/images/9.png',
      'assets/images/10.png',
      'assets/images/11.png',
      'assets/images/12.png',
      'assets/images/13.png',
      'assets/images/14.png',
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.orangeColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/images/profile.png')),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola! Gian Sandoval',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('¿Qué deseas comer hoy?', style: TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.white),
                          shape: WidgetStateProperty.all(CircleBorder()),
                        ),
                        icon: Icon(Icons.notification_add_sharp),
                        color: AppColors.orangeColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar',
                              border: InputBorder.none,
                              icon: Icon(Icons.search, color: AppColors.orangeColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.tune),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          //categorias
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RowTextWidget(
                    title: 'Categorías',
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  //Categories
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 150,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.cover),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(colors: [Colors.black.withAlpha(95), Colors.black.withAlpha(95)]),
                                  ),
                                  child: Center(
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  RowTextWidget(
                    title: 'Populares',
                    onPressed: () {},
                  ),
                  //Popular
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      final img = images[index];
                      final title = categories[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsProducto(
                              title: title,
                              img: img,
                            )));
                          },
                          child: Hero(
                            tag: img,
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [Colors.black.withAlpha(95), Colors.black.withAlpha(95)]),
                                  ),
                                  child: Stack(
                                    children: [
                                      //rating
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.star, color: AppColors.orangeColor),
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Fav
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 20, top: 10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                          child: Icon(Icons.favorite, color: AppColors.orangeColor),
                                        ),
                                      ),
                                      //Overlay
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColors.headerColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title,
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Text('35 min - Fácil', style: TextStyle(fontSize: 15)),
                                                    Spacer(),
                                                    Text('\$12.00', style: TextStyle(fontSize: 15, color: AppColors.greenColor)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //chefs
                  RowTextWidget(
                    title: 'Chefs',
                    onPressed: () {},
                  ),
                  //Chefs
                  Container(
                    height: 150,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(image: AssetImage('assets/images/chef.png'), fit: BoxFit.cover),
                              ),
                            ),
                            Text('Chef $index', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowTextWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RowTextWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: onPressed,
            child: Text('Ver todo', style: TextStyle(color: AppColors.orangeColor, fontSize: 15))),
        ],
      ),
    );
  }
}

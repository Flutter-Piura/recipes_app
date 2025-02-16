import 'package:flutter/material.dart';
import 'package:food_app/src/utils/app_colors.dart';

class DetailsProducto extends StatelessWidget {
  final String title;
  final String img;
  const DetailsProducto({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    List<String> ingredientes = ["Pasta", "Tomate", "Queso", "Carne", "Sal", "Pimienta", "Aceite de oliva"];

    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: img,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black.withAlpha(95), Colors.black.withAlpha(95)]),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                      child: Row(
                        children: [
                          IconButton(
                            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: AppColors.orangeColor,
                            icon: Icon(Icons.arrow_back),
                          ),
                          Spacer(),
                          IconButton(
                            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
                            onPressed: () {},
                            icon: Icon(Icons.favorite, size: 25),
                            color: AppColors.orangeColor,
                          ),
                          //compartir
                          IconButton(
                            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
                            onPressed: () {},
                            icon: Icon(Icons.share, size: 25),
                            color: AppColors.orangeColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.headerColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Pasta", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          Spacer(),
                          //rating
                          Row(
                            children: [
                              Icon(Icons.star, color: AppColors.orangeColor, size: 20),
                              Text('4.5', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(title, style: TextStyle(fontSize: 20, color: Colors.grey)),
                          Spacer(),
                          Text("\$15.00", style: TextStyle(fontSize: 18, color: AppColors.orangeColor)),
                        ],
                      ),
                      //chef
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(backgroundImage: AssetImage("assets/images/chef.png")),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Chef", style: TextStyle(fontSize: 18, color: Colors.grey)),
                              Text("John Doe", style: TextStyle(fontSize: 16, color: AppColors.orangeColor)),
                            ],
                          ),
                          Spacer(),
                          //mensaje
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.message, color: AppColors.orangeColor, size: 30),
                          ),
                          //llamada
                          IconButton(onPressed: () {}, icon: Icon(Icons.call, color: AppColors.orangeColor, size: 30)),
                        ],
                      ),
                      //descripcion
                      SizedBox(height: 10),
                      Text(
                        "Labore commodo ullamco est Lorem. Voluptate nulla sunt eiusmod tempor deserunt nisi aute tempor et occaecat laboris enim in. Sit id cillum anim laborum irure excepteur cupidatat. Minim consequat nisi fugiat dolor ad. Velit ad mollit mollit aliquip consequat et. Et tempor cupidatat labore voluptate et officia ipsum.Dolore magna dolor elit sint.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.headerColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    //reloj
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.access_time, color: AppColors.orangeColor, size: 30),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Preparación", style: TextStyle(fontSize: 15, color: Colors.grey)),
                                        Text("25 min", style: TextStyle(fontSize: 12, color: AppColors.orangeColor)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.headerColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    //reloj
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.restaurant, color: AppColors.orangeColor, size: 30),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Cocina", style: TextStyle(fontSize: 15, color: Colors.grey)),
                                        Text("Italiana", style: TextStyle(fontSize: 12, color: AppColors.orangeColor)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //ingredientes
                      SizedBox(height: 20),
                      Align(
                          alignment: Alignment.centerLeft,
                        child: Text("Ingredientes", style: TextStyle(fontSize: 20, color: Colors.grey))),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: ingredientes.length,
                        itemBuilder: (context, index) {
                          String ingredients = ingredientes[index];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.check_circle, color: AppColors.orangeColor, size: 20),
                                  SizedBox(width: 10),
                                  Text(ingredients, style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //ver video
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(100),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    Text("Ver video", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

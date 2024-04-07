import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bd.dart';

//Главная функция
void main() {
  runApp(const MyApp());
}

//Запук приложения
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Цветочный магазин "flowers from Luda"',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 239, 16, 247)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

//Экран регистрации
class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 16, 247),
      appBar: AppBar(
        title: const Center(
          child: Text('Регистрация'),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(height: 100),
          Container(
            width: 400,
            height: 50,
            color: Color.fromARGB(255, 239, 16, 247),
            child: const Center(
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.portrait),
                hintText: "Введите логин",
                fillColor: Colors.white,
                filled: true,
              )),
            ),
          ),
          const SizedBox(height: 45),
          Container(
            width: 400,
            height: 50,
            color: Color.fromARGB(255, 239, 16, 247),
            child: const Center(
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.priority_high),
                hintText: "Введите пароль",
                fillColor: Colors.white,
                filled: true,
              )),
            ),
          ),
          const SizedBox(height: 45),
          Container(
            width: 400,
            height: 50,
            color: Color.fromARGB(255, 239, 16, 247),
            child: const Center(
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.receipt),
                      hintText: "Введите почту",
                      fillColor: Colors.white,
                      filled: true)),
            ),
          ),
          const SizedBox(height: 45),
          Container(
            width: 400,
            height: 50,
            color: Color.fromARGB(255, 239, 16, 247),
            child: const Center(
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.add_call),
                      hintText: "Введите номер телефона",
                      fillColor: Colors.white,
                      filled: true)),
            ),
          ),
          const SizedBox(height: 45),
          Container(
            width: 300,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authorization()),
                );
              },
              child: const Text(
                'Зарегистрироваться',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
        ],
      )),
    );
  }
}

//Главный экран магазина
class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 16, 247),
      appBar: AppBar(
        title: const Text('flowers from Luda'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
        ),
        itemCount: flowersList.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 7,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFlovers(
                    name: flowersList[index].name,
                    price: flowersList[index].price,
                    description: flowersList[index].description,
                    specifications: flowersList[index].specifications,
                    id: flowersList[index].id,
                    //video: flowersList[index].video,
                    fimage: flowersList[index].fimage,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  flowersList[index].fimage[0],
                  height: 90,
                  width: 90,
                ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  '${flowersList[index].price} Руб',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.local_grocery_store,
                        size: 20,
                        color: cart.contains(flowersList[index])
                            ? Colors.green
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (!cart.contains(flowersList[index])) {
                            cart.add(flowersList[index]);
                          } else {
                            cart.remove(flowersList[index]);
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 20,
                        color: like.contains(flowersList[index])
                            ? Colors.red
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (!like.contains(flowersList[index])) {
                            like.add(flowersList[index]);
                          } else {
                            like.remove(flowersList[index]);
                          }
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_grocery_store,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cart)),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LikePage(likeItems: like)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//Подробная информация о цветах
class DescriptionFlovers extends StatefulWidget {
  final int id;
  final String name;
  final int price;
  final String description;
  final String specifications;
  //final String video;
  final List<String> fimage;

  const DescriptionFlovers({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.specifications,
    //required this.video,
    required this.fimage,
  }) : super(key: key);

  @override
  _DescriptionFloversState createState() => _DescriptionFloversState();
}

class _DescriptionFloversState extends State<DescriptionFlovers> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    //YoutubePlayerController controller = YoutubePlayerController(
    //initialVideoId: widget.video,
    //flags: const YoutubePlayerFlags(
    //autoPlay: false,
    //));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 16, 247),
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: widget.fimage.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image.network(widget.fimage[index]),
                );
              },
            ),
            const SizedBox(height: 30),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.fimage.length,
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 239, 16, 247)),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 170,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name, //Название товара
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${widget.price} Руб', //Цена товара
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 239, 16, 247),
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 200, //высота
                width: 400, //ширина
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 17),
                      const Text(
                        "Описание:",
                        style: TextStyle(
                          fontSize: 23,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.description, //Описание Товара
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 239, 16, 247),
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 670, //высота
                width: 400, //ширина
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Характеристики:",
                      style: TextStyle(
                        fontSize: 23,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.specifications, //Характеристики товара
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 239, 16, 247),
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 500, //высота
                width: 400, //ширина
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Скоро тут будет красиво... ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text('(Тут должно было быть видео, но....)',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    //YoutubePlayer(
                    //controller: controller,
                    //),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

//Экран авторизации
class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 16, 247),
      appBar: AppBar(
        title: const Center(
          child: Text('Авторизация'),
        ),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 100),
          Container(
            width: 400,
            height: 50,
            color: Color.fromARGB(255, 239, 16, 247),
            child: const Center(
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.assignment_ind),
                      hintText: "Введите логин",
                      fillColor: Colors.white,
                      filled: true)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 400,
            height: 50,
            color: Color.fromARGB(255, 239, 16, 247),
            child: const Center(
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.all_inclusive),
                      hintText: "Введите пароль",
                      fillColor: Colors.white,
                      filled: true)),
            ),
          ),
          const SizedBox(height: 100),
          Container(
            width: 300,
            height: 70,
            child: ElevatedButton(
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Нет аккаунта?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      )),
                  Text(' Зарегистрироваться!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Registration()),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 300,
            height: 70,
            child: ElevatedButton(
              child: const Text(
                'Войти',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}

//Экран Корзины
class CartPage extends StatefulWidget {
  final List<Flowers> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int getTotalCost() {
    int totalCost = 0;
    for (var item in widget.cartItems) {
      totalCost += item.price * item.quantity;
    }
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Корзина'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    setState(() {
                      widget.cartItems.removeAt(index);
                    });
                  },
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    leading:
                        Image.network(item.fimage[0], width: 50, height: 50),
                    title: Text(
                      item.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(
                          '${item.quantity} x ${item.price} Руб',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (item.quantity > 1) {
                                item.quantity--;
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50, //высота
                  width: 250, //ширина
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 184, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Перейти к оформлению',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                ),
                Text(
                  '${getTotalCost()} руб.',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_grocery_store, //Корзина
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border, //Избранное
                color: Colors.red,
                size: 25,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.home, //Гл.Экран
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person, //Личный кабинет
                color: Colors.green,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

//Экран Избранного
class LikePage extends StatelessWidget {
  final List<Flowers> likeItems;

  LikePage({required this.likeItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: likeItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              like.removeAt(index);
            },
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Image.network(
                likeItems[index].fimage[0],
                width: 50,
                height: 50,
              ),
              title: Text(
                likeItems[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${likeItems[index].price} Руб',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DescriptionFlovers(
                            name: likeItems[index].name,
                            price: likeItems[index].price,
                            description: likeItems[index].description,
                            specifications: likeItems[index].specifications,
                            id: flowersList[index].id,
                            //video: likeItems[index].video,
                            fimage: flowersList[index].fimage,
                          )),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_grocery_store, //Корзина
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cart)),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border, //Избранное
                color: Colors.red,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

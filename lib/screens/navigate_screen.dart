import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: const _FloatingButton(),
        bottomNavigationBar: const _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationNumber = Provider.of<_NotificationModel>(context).number;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                  right: 0,
                  child: BounceInDown(
                    from: 10,
                    animate: notificationNumber > 0,
                    child: Bounce(
                      from: 10,
                      controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                      child: Container(
                        width: 15,
                        height: 15,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        child: Text(
                          '$notificationNumber',
                          style: const TextStyle(color: Colors.white, fontSize: 7),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);
        notiModel.incrementNumber();
        final controller = notiModel.bounceController;
        controller!.forward(from: 0.0);
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel with ChangeNotifier {
  AnimationController? _bounceController;

  AnimationController? get bounceController => _bounceController;

  set bounceController(AnimationController? controller) {
    _bounceController = controller;
    //notifyListeners();
  }

  int _number = 0;

  int get number => _number;

  set numer(int n) {
    _number = n;
    notifyListeners();
  }

  void incrementNumber() {
    if (_number < 99) {
      _number++;
    } else {
      _number = 0;
    }
    notifyListeners();
  }
}

import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  /// The [Scaffold] provided by the Flutter SDK
  ///
  /// [Scaffold] `body` will be ignored and replaced by `children.first`
  final Scaffold scaffold;

  /// The pages that will be shown by every click
  ///
  /// They should placed in order such as:
  /// `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
  final List<Widget> children;

  /// Called when one of the [items] is tapped.
  ///
  /// The stateful widget handles your page navigation by default,
  /// so no need to keep track of the index
  final Function(int) onItemTap;

  CustomScaffold(
      // Can't be constant because of assertions :(
      {Key key,
      this.scaffold,
      this.children,
      this.onItemTap})
      : assert(scaffold != null),
        assert(children != null),
        assert(scaffold.bottomNavigationBar != null),
        assert(scaffold.bottomNavigationBar is BottomNavigationBar,
            '[CustomScaffold] require an instance of [BottomNavigationBar]'),
        assert(
            (scaffold.bottomNavigationBar as BottomNavigationBar)
                    .items
                    .length ==
                children.length,
            '[BottomNavigationBar] and `children` should be the same size'),
        super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _index = 0;
  GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffold.key,
      //appBar: widget.scaffold.appBar,
      appBar: _appCustomBar(),
      bottomNavigationBar: _bottomNavBar(),
      backgroundColor: widget.scaffold.backgroundColor,
      bottomSheet: widget.scaffold.bottomSheet,
      body: CustomNavigator(
        navigatorKey: _key,
        home: widget.children[_index],
        pageRoute: PageRoutes.materialPageRoute,
      ),
      drawer: widget.scaffold.drawer,
      drawerDragStartBehavior: widget.scaffold.drawerDragStartBehavior,
      drawerScrimColor: widget.scaffold.drawerScrimColor,
      endDrawer: widget.scaffold.endDrawer,
      extendBody: widget.scaffold.extendBody,
      floatingActionButton: widget.scaffold.floatingActionButton,
      floatingActionButtonAnimator:
          widget.scaffold.floatingActionButtonAnimator,
      floatingActionButtonLocation:
          widget.scaffold.floatingActionButtonLocation,
      persistentFooterButtons: widget.scaffold.persistentFooterButtons,
      primary: widget.scaffold.primary,
      resizeToAvoidBottomInset: widget.scaffold.resizeToAvoidBottomInset,
    );
  }

  _appCustomBar(){
    assert(widget.scaffold.appBar != null);
    AppBar b = widget.scaffold.appBar;
    return AppBar(
      key: b.key,
      backgroundColor: b.backgroundColor,
      elevation: b.elevation,
      centerTitle: b.centerTitle,
      bottom: b.bottom,
      title: b.title,
      leading: b.leading,
      iconTheme: b.iconTheme,
      brightness: b.brightness,
      actionsIconTheme: b.actionsIconTheme,
      actions: b.actions,
      automaticallyImplyLeading: b.automaticallyImplyLeading,
      bottomOpacity: b.bottomOpacity,
      flexibleSpace: b.flexibleSpace,
      primary: b.primary,
      shape: b.shape,
      textTheme: b.textTheme,
      titleSpacing: b.titleSpacing,
      toolbarOpacity: b.toolbarOpacity,
    );
  }

  _bottomNavBar() {
    assert(widget.scaffold.bottomNavigationBar != null);

    BottomNavigationBar b = widget.scaffold.bottomNavigationBar;
    return BottomNavigationBar(
      key: b.key,
      items: b.items,
      currentIndex: _index,
      onTap: (index) {
        setState(() => _index = index);
        _key.currentState.maybePop();
        widget.onItemTap(index);
      },
      backgroundColor: b.backgroundColor,
      elevation: b.elevation,
      fixedColor: b.selectedItemColor == null ? b.fixedColor : null,
      iconSize: b.iconSize,
      selectedFontSize: b.selectedFontSize,
      selectedIconTheme: b.selectedIconTheme,
      selectedItemColor: b.selectedItemColor,
      selectedLabelStyle: b.selectedLabelStyle,
      showSelectedLabels: b.showSelectedLabels,
      showUnselectedLabels: b.showUnselectedLabels,
      type: b.type,
      unselectedFontSize: b.unselectedFontSize,
      unselectedIconTheme: b.unselectedIconTheme,
      unselectedItemColor: b.unselectedItemColor,
      unselectedLabelStyle: b.unselectedLabelStyle,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key key}) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {

  Future<T> showFloatingModalBottomSheet<T>({
    BuildContext context,
    WidgetBuilder builder,
    Color backgroundColor,
  }) async {
    final result = await showCustomModalBottomSheet(
        context: context,
        builder: builder,
        containerWidget: (_, animation, child) => FloatingModal(
          child: child,
        ),
        expand: false);

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
              title: Text('Float Modal'),
              onTap: () => showFloatingModalBottomSheet(
                context: context,
                builder: (context) => ModalFit(),
              )),
          ListTile(
              title: Text('Bar Modal'),
              onTap: () => showBarModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalInsideModal(),
              )),
          ListTile(
              title: Text('Avatar Modal'),
              onTap: () => showAvatarModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalInsideModal(),
              )),

          ListTile(
              title: Text('Float Modal'),
              onTap: () => showFloatingModalBottomSheet(
                context: context,
                builder: (context) => ModalFit(),
              )),

          ListTile(
              title: Text('Cupertino Modal fit'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalFit(),
              )),

          ListTile(
              title: Text('Cupertino Small Modal forced to expand'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalFit(),
              )),

          ListTile(
              title: Text('Reverse list'),
              onTap: () => showBarModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) =>
                    ModalInsideModal(reverse: true),
              )),

          ListTile(
              title: Text('Cupertino Modal inside modal'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalInsideModal(),
              )),
          ListTile(
              title: Text('Cupertino Modal with inside navigation'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalWithNavigator(),
              )),
          ListTile(
              title:
              Text('Cupertino Navigator + Scroll + WillPopScope'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ComplexModal(),
              )),

          ListTile(
              title: Text('Modal with WillPopScope'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalWillScope(),
              )),

          ListTile(
              title: Text('Modal with Nested Scroll'),
              onTap: () => showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                builder: (context) => NestedScrollModal(),
              )),
          ListTile(
              title: Text('Modal with PageView'),
              onTap: () => showBarModalBottomSheet(
                expand: true,
                context: context,
                builder: (context) => ModalWithPageView(),
              )),

        ],
      ),
    );
  }
}

class ModalWithPageView extends StatelessWidget {
  const ModalWithPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar:
        AppBar(leading: Container(), title: Text('Modal With Page View')),
        body: SafeArea(
          bottom: false,
          child: PageView(
            children: List.generate(
                2,
                    (index) => ListView(
                  shrinkWrap: true,
                  controller: ModalScrollController.of(context),
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: List.generate(
                        7,
                            (index) => ListTile(
                          title: Text('Item'),
                        )),
                  ).toList(),
                )),
          ),
        ),
      ),
    );
  }
}

class NestedScrollModal extends StatelessWidget {
  const NestedScrollModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(),
      physics: ScrollPhysics(parent: PageScrollPhysics()),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(height: 300, color: Colors.blue),
              ],
            ),
          ),
        ];
      },
      body: ListView.builder(
        controller: ModalScrollController.of(context),
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: index.isOdd ? Colors.green : Colors.orange,
          );
        },
        itemCount: 12,
      ),
    );
  }
}

class ModalWillScope extends StatelessWidget {
  const ModalWillScope({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
          onWillPop: () async {
            bool shouldClose = true;
            await showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Should Close?'),
                  actions: <Widget>[
                    CupertinoButton(
                      child: Text('Yes'),
                      onPressed: () {
                        shouldClose = true;
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('No'),
                      onPressed: () {
                        shouldClose = false;
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
            return shouldClose;
          },
          child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                leading: Container(), middle: Text('Modal Page')),
            child: Center(),
          ),
        ));
  }
}
class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const FloatingModal({Key key,  this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}

class ModalFit extends StatelessWidget {
  const ModalFit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Edit'),
                leading: Icon(Icons.edit),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Copy'),
                leading: Icon(Icons.content_copy),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Cut'),
                leading: Icon(Icons.content_cut),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Move'),
                leading: Icon(Icons.folder_open),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Delete'),
                leading: Icon(Icons.delete),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ));
  }
}

class ModalInsideModal extends StatelessWidget {
  final bool reverse;

  const ModalInsideModal({Key key, this.reverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
          // navigationBar: CupertinoNavigationBar(
          //     leading: Container(), middle: Text('Modal Page')),
          child: SafeArea(
            bottom: false,
            child: Container(
              height: 400,
              child: ListView(
                reverse: reverse,
                shrinkWrap: true,
                controller: ModalScrollController.of(context),
                physics: ClampingScrollPhysics(),
                children: ListTile.divideTiles(
                    context: context,
                    tiles: List.generate(
                      8,
                          (index) => ListTile(
                          title: Text('Item $index'),
                          onTap: () => showCupertinoModalBottomSheet(
                            expand: true,
                            isDismissible: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                ModalInsideModal(reverse: reverse),
                          )),
                    )).toList(),
              ),
            ),
          ),
        ));
  }
}

class AvatarBottomSheet extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const AvatarBottomSheet({Key key,   this.child,  this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            SafeArea(
                bottom: false,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(0, (1 - animation.value) * 100),
                    // child: Opacity(
                    // child: child,
                    // opacity: max(0, animation.value * 2 - 1)
                    // )
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      CircleAvatar(
                        child: Text('JB'),
                        radius: 32,
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 12),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black12,
                              spreadRadius: 5)
                        ]),
                    width: double.infinity,
                    child: MediaQuery.removePadding(
                        context: context, removeTop: true, child: child)),
              ),
            ),
          ]),
    );
  }
}

Future<T> showAvatarModalBottomSheet<T>({
  BuildContext context,
  WidgetBuilder builder,
  Color backgroundColor,
  double elevation,
  ShapeBorder shape,
  Clip clipBehavior,
  Color barrierColor = Colors.black87,
  bool bounce = true,
  bool expand = false,
  AnimationController secondAnimation,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Duration duration,
}) async {
  assert(context != null);
  assert(builder != null);
  assert(expand != null);
  assert(useRootNavigator != null);
  assert(isDismissible != null);
  assert(enableDrag != null);
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  final result = await Navigator.of(context, rootNavigator: useRootNavigator)
      .push(ModalBottomSheetRoute<T>(
    builder: builder,
    containerBuilder: (_, animation, child) => AvatarBottomSheet(
      child: child,
      animation: animation,
    ),
    bounce: bounce,
    secondAnimationController: secondAnimation,
    expanded: expand,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    isDismissible: isDismissible,
    modalBarrierColor: barrierColor,
    enableDrag: enableDrag,
    duration: duration,
  ));
  return result;
}


class ModalWithNavigator extends StatelessWidget {
  const ModalWithNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext rootContext) {
    return Material(
        child: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (context2) => Builder(
              builder: (context) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                    leading: Container(), middle: Text('Modal Page')),
                child: SafeArea(
                  bottom: false,
                  child: ListView(
                    shrinkWrap: true,
                    controller: ModalScrollController.of(context),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: List.generate(
                          100,
                              (index) => ListTile(
                            title: Text('Item'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CupertinoPageScaffold(
                                    navigationBar: CupertinoNavigationBar(
                                      middle: Text('New Page'),
                                    ),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.of(rootContext).pop(),
                                          child: Text('touch here'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class ComplexModal extends StatelessWidget {
  const ComplexModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = true;
          await showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('Should Close?'),
                actions: <Widget>[
                  CupertinoButton(
                    child: Text('Yes'),
                    onPressed: () {
                      shouldClose = true;
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text('No'),
                    onPressed: () {
                      shouldClose = false;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
          return shouldClose;
        },
        child: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (context) => Builder(
              builder: (context) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                    leading: Container(), middle: Text('Modal Page')),
                child: SafeArea(
                  bottom: false,
                  child: ListView(
                    shrinkWrap: true,
                    controller: ModalScrollController.of(context),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: List.generate(
                          100,
                              (index) => ListTile(
                            title: Text('Item'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CupertinoPageScaffold(
                                          navigationBar:
                                          CupertinoNavigationBar(
                                            middle: Text('New Page'),
                                          ),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: <Widget>[],
                                          ))));
                            },
                          )),
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



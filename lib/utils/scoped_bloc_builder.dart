import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef Create<T> = T Function(BuildContext context);
typedef ScopedBlocWidgetBuilder<S, C extends Cubit<S>> = Widget Function(
  BuildContext context,
  S state,
  C cubit,
);

class ScopedBlocBuilder<C extends Cubit<S>, S> extends StatelessWidget {
  const ScopedBlocBuilder({
    Key? key,
    required this.create,
    required this.builder,
  }) : super(key: key);

  final Create<C> create;
  final ScopedBlocWidgetBuilder<S, C> builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: BlocBuilder<C, S>(
        builder: (context, state) {
          final cubit = BlocProvider.of<C>(context);
          return builder(context, state, cubit);
        },
      ),
    );
  }
}

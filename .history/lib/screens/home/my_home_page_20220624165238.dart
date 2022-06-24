import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cat_fact/bloc/data_bloc.dart';
import 'package:flutter_application_cat_fact/repositories/cat_api.dart';
import 'package:flutter_application_cat_fact/repositories/fact_api.dart';
import 'package:flutter_application_cat_fact/screens/fact_history/fact_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final FactClient factClient = FactClient(dio);
    final CatClient catClient = CatClient(dio);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider<DataBloc>(
        create: (_) => DataBloc(catClient, factClient),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    context.read<DataBloc>().add(GetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Expanded(child: _CatImage()),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _CatFact(),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  context.read<DataBloc>().add(GetDataEvent());
                },
                child: const Text('Another fact!')),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FactHistory(
                                title: 'Amazing Fact History',
                              )));
                },
                child: const Text('Fact history')),
          )
        ],
      ),
    );
  }
}

class _CatImage extends StatelessWidget {
  const _CatImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataState>(
      builder: (context, state) {
        return _buildImage(context, state);
      },
      listener: (context, state) {},
      buildWhen: (previous, current) => _shouldBuildFor(current),
    );
  }

  bool _shouldBuildFor(DataState currentState) {
    return currentState is DataInitial ||
        currentState is CatImageUrlState ||
        currentState is ErrorImageState;
  }

  Widget _buildImage(BuildContext context, DataState state) {
    if (state is ErrorImageState) {
      return Text(state.errorMessage);
    } else {
      String url = 'https://cataas.com';
      if (state is CatImageUrlState) {
        return Image.network(url + state.imgUrl, loadingBuilder:
            (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        });
      } else {
        return const SizedBox.shrink();
      }
    }
  }
}

class _CatFact extends StatelessWidget {
  _CatFact({Key? key}) : super(key: key);
  final DateFormat formattedDate = DateFormat('dd-MM-yy – kk:mm');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataState>(
      builder: (context, state) {
        return _buildText(context, state);
      },
      listener: (context, state) {},
      buildWhen: (previous, current) => _shouldBuildFor(current),
    );
  }

  bool _shouldBuildFor(DataState currentState) {
    return currentState is DataInitial ||
        currentState is UpdateTextState ||
        currentState is ErrorFactState;
  }

  Widget _buildText(BuildContext context, DataState state) {
    if (state is ErrorFactState) {
      return Text(state.errorMessage);
    } else {
      if (state is UpdateTextState) {
        return Column(
          children: [
            Text(state.text),
            Text(formattedDate.format(DateTime.parse(state.updatedAt)))
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }
  }
}

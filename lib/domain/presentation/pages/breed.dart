import 'package:cat_directory_app/data/datasource/fact_datasource.dart';
import 'package:cat_directory_app/data/implementations/fact_impl.dart';
import 'package:cat_directory_app/domain/entities/breed_entity.dart';
import 'package:cat_directory_app/domain/presentation/bloc/fact/fact_cubit.dart';
import 'package:cat_directory_app/domain/presentation/bloc/fact/fact_state.dart';
import 'package:cat_directory_app/domain/presentation/widgets/fact_text_skeleton.dart';
import 'package:cat_directory_app/domain/usecases/fact_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({Key? key}) : super(key: key);

  Widget returnFact(BuildContext context, FactState state) {
    switch (state) {
      case FactLoadingState():
        return FactTextSkeleton();
      case FactErrorState():
        return FactTextSkeleton();
      case FactSuccessState():
        return Text(state.fact);

      default:
        return const FactTextSkeleton();
    }
  }

  @override
  Widget build(BuildContext context) {
    final breed = ModalRoute.of(context)?.settings.arguments as BreedEntity;
    return BlocProvider(
      create: (context) {
        final cubit = FactCubit(FactUsecase(FactImpl(FactDataSource())));
        cubit.getFaqct();
        return cubit;
      },
      child: BlocConsumer<FactCubit, FactState>(
        listenWhen: (previous, current) => current is FactErrorState && previous is! FactErrorState,
        listener: (context, state) {
          if (!context.mounted) return;
          if (state is FactErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: Text("Breed Details")),
          body: SizedBox(
            width: double.infinity,

            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(breed.breed, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(height: 5),
                  Text("Country", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(breed.country, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Origin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(breed.origin, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Coat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(breed.coat, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Pattern", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(breed.pattern, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Fact", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  returnFact(context, state),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

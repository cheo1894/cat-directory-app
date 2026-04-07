import 'package:cat_directory_app/core/widgets/app_tile.dart';
import 'package:cat_directory_app/core/widgets/data_tile.dart';
import 'package:cat_directory_app/domain/entities/breed_entity.dart';
import 'package:flutter/material.dart';

class ListBreedsWidgetProps {
  final List<BreedEntity> breeds;
  final Function(BreedEntity breed) onTap;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;

  const ListBreedsWidgetProps({
    required this.breeds,
    required this.onTap,
    required this.scrollController,
    required this.onRefresh,
  });
}

class ListBreedsWidget extends StatelessWidget {
  final ListBreedsWidgetProps props;
  const ListBreedsWidget({super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: props.onRefresh,

        child: ListView.builder(
          controller: props.scrollController,
          padding: EdgeInsets.all(0),
          itemCount: props.breeds.length,
          itemBuilder: (context, index) {
            final breedMap = props.breeds[index].toMap();
            return GestureDetector(
              onTap: () => props.onTap(props.breeds[index]),
              child: AppTile(
                props: AppTileProps(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        breedMap['Breed'] ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(height: 10),

                      ...breedMap.entries.map((entry) {
                        if (entry.key != 'Breed') {
                          return DataTile(
                            props: DataTileProps(title: entry.key, value: entry.value),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      }).toList(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

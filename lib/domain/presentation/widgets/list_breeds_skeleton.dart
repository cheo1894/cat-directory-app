import 'package:cat_directory_app/core/widgets/app_tile.dart';
import 'package:cat_directory_app/core/widgets/data_tile.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListBreedsSkeleton extends StatelessWidget {
  ListBreedsSkeleton({super.key});

  final List<Map<String, String>> items = [
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
    {
      "breed": "Abyssinian",
      "country": "Ethiopia",
      "origin": "Natural/Standard",
      "coat": "Short",
      "pattern": "Ticked",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ListView(
          children: [
            ...items.map(
              (item) => AppTile(
                props: AppTileProps(
                  child: Column(
                    children: [
                      ...item.entries.map(
                        (entry) => DataTile(
                          props: DataTileProps(title: entry.key, value: entry.value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:al_pazar/core/helpers/category_subcategory_constant.dart';
import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AddSubcategoryScreen extends StatelessWidget {
  final String category;

  // Accepting the selected category via the constructor
  const AddSubcategoryScreen({super.key, required this.category});

  // A method to fetch the subcategories based on the selected category
  List<String> _getSubcategories(String category) {
    switch (category) {
      case CategoryConstants.kVehicles:
        return [
          SubcategoryConstants.kCars,
          SubcategoryConstants.kMotorcycles,
          SubcategoryConstants.kTrucks,
          SubcategoryConstants.kBicycles,
          SubcategoryConstants.kVehicleParts,
        ];
      case CategoryConstants.kRealEstate:
        return [
          SubcategoryConstants.kApartments,
          SubcategoryConstants.kHouses,
          SubcategoryConstants.kCommercial,
          SubcategoryConstants.kLand,
          SubcategoryConstants.kRoomRentals,
        ];
      case CategoryConstants.kElectronics:
        return [
          SubcategoryConstants.kPhones,
          SubcategoryConstants.kLaptops,
          SubcategoryConstants.kTablets,
          SubcategoryConstants.kTVs,
          SubcategoryConstants.kCameras,
          SubcategoryConstants.kAccessories,
        ];
      case CategoryConstants.kHomeFurniture:
        return [
          SubcategoryConstants.kFurniture,
          SubcategoryConstants.kHomeDecor,
          SubcategoryConstants.kKitchenAppliances,
          SubcategoryConstants.kLighting,
          SubcategoryConstants.kStorage,
        ];
      case CategoryConstants.kClothingAccessories:
        return [
          SubcategoryConstants.kMenClothing,
          SubcategoryConstants.kWomenClothing,
          SubcategoryConstants.kKidsClothing,
          SubcategoryConstants.kShoes,
          SubcategoryConstants.kJewelry,
        ];
      case CategoryConstants.kHealthBeauty:
        return [
          SubcategoryConstants.kSkincare,
          SubcategoryConstants.kHaircare,
          SubcategoryConstants.kMakeup,
          SubcategoryConstants.kWellness,
          SubcategoryConstants.kFitnessEquipment,
        ];
      case CategoryConstants.kSportsOutdoors:
        return [
          SubcategoryConstants.kOutdoorGear,
          SubcategoryConstants.kSportsEquipment,
          SubcategoryConstants.kCamping,
          SubcategoryConstants.kFishing,
          SubcategoryConstants.kCycling,
        ];
      case CategoryConstants.kHobbiesEntertainment:
        return [
          SubcategoryConstants.kBooks,
          SubcategoryConstants.kMusicalInstruments,
          SubcategoryConstants.kBoardGames,
          SubcategoryConstants.kVideoGames,
          SubcategoryConstants.kCrafts,
        ];
      case CategoryConstants.kJobs:
        return [
          SubcategoryConstants.kFullTime,
          SubcategoryConstants.kPartTime,
          SubcategoryConstants.kFreelance,
          SubcategoryConstants.kInternships,
          SubcategoryConstants.kRemote,
        ];
      case CategoryConstants.kServices:
        return [
          SubcategoryConstants.kHomeCleaning,
          SubcategoryConstants.kRepairs,
          SubcategoryConstants.kTutoring,
          SubcategoryConstants.kCatering,
          SubcategoryConstants.kEventPlanning,
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final subcategories = _getSubcategories(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(' $category'),
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcategories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to a new screen or handle subcategory click
              context.pushNamed(
                Routes.addPostViewBody,
                arguments: {
                  'selectedCategory': category,
                  'selectedSubcategory': subcategories[index],
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:al_pazar/core/helpers/category_subcategory_constant.dart';
import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';

class SubCategoriesSeeAll extends StatelessWidget {
  final String category;

  // Accepting the selected category via the constructor
  const SubCategoriesSeeAll({super.key, required this.category});

  // A method to fetch the subcategories based on the selected category
  List<String> _getSubcategories(String category) {
    switch (category) {
      case CategoryConstants.kVehicles:
        return [
          SubcategoryConstants.kCars,
          SubcategoryConstants.kMotorcycles,
          SubcategoryConstants.kVehiclePartsAccessories,
          SubcategoryConstants.kBicycles,
          CategoryConstants.kVehicles,
        ];
      case CategoryConstants.kRealEstate:
        return [
          SubcategoryConstants.kApartments,
          SubcategoryConstants.kHouses,
          SubcategoryConstants.kLand,
          SubcategoryConstants.kRoomRentals,
        ];
      case CategoryConstants.kElectronics:
        return [
          SubcategoryConstants.kMobilePhones,
          SubcategoryConstants.kLaptops,
          SubcategoryConstants.kTablets,
          SubcategoryConstants.kGamingConsoles,
          SubcategoryConstants.kElectronicsAccessories,
          SubcategoryConstants.kOtherElectronics,
        ];
      case CategoryConstants.kHomeAppliances:
        return [
          SubcategoryConstants.kMicrowavesOvens,
          SubcategoryConstants.kBlenders,
          SubcategoryConstants.kWaterBoilers,
          SubcategoryConstants.kPansCookware,
          SubcategoryConstants.kDishesUtensils,
          SubcategoryConstants.kIrons,
          SubcategoryConstants.kVacuumCleaners,
          SubcategoryConstants.kHeaters,
          SubcategoryConstants.kFans,
          SubcategoryConstants.kRouters,
          SubcategoryConstants.kOtherAppliances,
        ];
      case CategoryConstants.kFurniture:
        return [
          SubcategoryConstants.kDesksChairs,
          SubcategoryConstants.kSofas,
          SubcategoryConstants.kBedsMattresses,
          SubcategoryConstants.kBlanketsBedding,
          SubcategoryConstants.kCurtains,
          SubcategoryConstants.kHomeDecor,
          SubcategoryConstants.kCarpets,
          SubcategoryConstants.kOtherFurniture,
        ];
      case CategoryConstants.kEducation:
        return [
          SubcategoryConstants.kCalculators,
          SubcategoryConstants.kLabCoatsMedicalSupplies,
          SubcategoryConstants.kEngineeringTools,
          SubcategoryConstants.kStationeryArtSupplies,
          SubcategoryConstants.kBooksStudyMaterials,
          SubcategoryConstants.kBagsBackpacks,
          SubcategoryConstants.kOnlineCoursesTutorials,
          SubcategoryConstants.kEbooksDigitalResources,
          SubcategoryConstants.kTutoringServices,
          SubcategoryConstants.kOtherStudySupplies,
        ];
      case CategoryConstants.kFashion:
        return [
          SubcategoryConstants.kMensClothingShoes,
          SubcategoryConstants.kWomensClothingShoes,
          SubcategoryConstants.kMensAccessories,
          SubcategoryConstants.kWomensAccessories,
        ];
      case CategoryConstants.kSelfCare:
        return [
          SubcategoryConstants.kSkincare,
          SubcategoryConstants.kHaircare,
          SubcategoryConstants.kMakeup,
        ];
      case CategoryConstants.kPets:
        return [
          SubcategoryConstants.kCats,
          SubcategoryConstants.kDogs,
          SubcategoryConstants.kOtherPetsAnimals,
          SubcategoryConstants.kAccessoriesPetCareProducts,
        ];
      case CategoryConstants.kJobs:
        return [
          SubcategoryConstants.kFullTime,
          SubcategoryConstants.kPartTime,
          SubcategoryConstants.kFreelance,
          SubcategoryConstants.kInternships,
          SubcategoryConstants.kRemote,
          SubcategoryConstants.kCampusJobs,
        ];
      case CategoryConstants.kEntertainment:
        return [
          SubcategoryConstants.kMusicalInstruments,
          SubcategoryConstants.kVideoGames,
          SubcategoryConstants.kBoardGames,
          SubcategoryConstants.kVideoGames,
          SubcategoryConstants.kArtSupplies,
          SubcategoryConstants.kPosters,
          SubcategoryConstants.kCampingGear,
        ];

      case CategoryConstants.kServices:
        return [
          SubcategoryConstants.kCookingBaking,
          SubcategoryConstants.kHomeTutoring,
          SubcategoryConstants.kPhotography,
          SubcategoryConstants.kEventAssistance,
          SubcategoryConstants.kHomeCleaning,
          SubcategoryConstants.kOtherServices,
        ];
      case CategoryConstants.kLostFound:
        return [
          SubcategoryConstants.kLostItems,
          SubcategoryConstants.kFoundItems,
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
                Routes.categoryFilterView,
                arguments: subcategories[index],
              );
            },
          );
        },
      ),
    );
  }
}

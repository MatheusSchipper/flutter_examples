//Routes
import 'package:examples/core/utils/keys.dart';

const String peopleCounterRoute = '/people_counter';
const String bmiCalculatorRoute = '/bmi_calculator';
const String currencyConverterRoute = '/currency_converter';
const String todoListRoute = '/todo_list';
const String gifFinderRoute = '/gif_finder';
const String gifDetailModuleRoute = '/detail';
const String gifDetailRoute = '/gif_finder/detail';

//Assets
const String assetsDirectory = 'assets/images/';
const String peopleCounterAssetsDirectory = '${assetsDirectory}people_counter/';
const String restauranteImage = '${peopleCounterAssetsDirectory}restaurant.jpg';

//Messages
//BmiCalculator
const String invalidInputWeightMessage = 'Peso deve ser maior que zero!';
const String invalidInputHeightMessage = 'Altura deve ser maior que zero';
const String divideByZeroMessage = 'Não é possível dividir por zero!';

//URLs
//GifFinder
const String trendingGifUrl =
    "https://api.giphy.com/v1/gifs/trending?api_key=$giphyKey&limit=25&rating=g";

///
/// "https://api.giphy.com/v1/gifs/search?api_key=$giphyKey&limit=25&offset=0&rating=g&lang=en&q="
///
const String searchGifUrl =
    "https://api.giphy.com/v1/gifs/search?api_key=$giphyKey&limit=25&rating=g&lang=en";

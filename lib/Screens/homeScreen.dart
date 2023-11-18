import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../helper/utils.dart';
import '../provider/weatherProvider.dart';
import '../widgets/WeatherInfo.dart';
import '../widgets/fadeIn.dart';

import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/searchBar.dart';

class HomeScreen extends StatefulWidget {
  final bool isLoading;
  static const routeName = '/homeScreen';

  HomeScreen({required this.isLoading});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherData(context, isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeContext = Theme.of(context);

    return Scaffold(
      
      backgroundColor: Colors.grey[900],// Color.fromRGBO(248, 248, 255, 0.9),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProv, _) {
            if (weatherProv.isRequestError) return RequestError();
            if (weatherProv.isLocationError) return LocationError();
            return Column(
              children: [
                SearchBar(),
               
                widget.isLoading || weatherProv.isLoading
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: themeContext.primaryColor,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async => _refreshData(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 80),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              width: size.width*0.8,
                              height: size.height*0.5,
                            
                              decoration: BoxDecoration(
                                image: DecorationImage(
                image: AssetImage('assets/${MapString.mapInputToPIc(context,weatherProv.weather?.currently)}'), // Replace with your image asset path
                fit: BoxFit.cover, 
              ),
                                borderRadius: BorderRadius.circular(15), 
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FadeIn(
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 250),
                                    child: MainWeather(),
                                  ),
                                  FadeIn(
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 500),
                                    child: WeatherInfo(),
                                  ),
                                 
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}

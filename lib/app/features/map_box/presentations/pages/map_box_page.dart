import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_box_app/app/config/map_config.dart';
import 'package:map_box_app/app/core/common/constants/app_string.dart';
import 'package:map_box_app/app/core/common/constants/app_style.dart';
import 'package:map_box_app/app/features/map_box/presentations/bloc/map_box_bloc.dart';
import 'package:map_box_app/app/features/map_box/presentations/widgets/custom_button.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

class MapBoxPage extends StatelessWidget {
  const MapBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    mapbox.MapboxOptions.setAccessToken(MapConfig.publicAccessKey);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primaryColor,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _buildMap(context),
            _buildSearchBar(context),
            _buildButtonTools(context),
          ],
        ),
      ),
    );
  }

  _buildMap(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: mapbox.MapWidget(
        key: const ValueKey("mapWidget"),
        onMapCreated: context.read<MapBoxBloc>().onMapCreated,
        onTapListener: (mapboxContext) {
          context.read<MapBoxBloc>().add(OnTapMap(mapboxContext));
        },
      ),
    );
  }

  _buildSearchBar(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      top: 16,
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: AppStyle.secondaryColor,
            ),
            filled: true,
            fillColor: AppStyle.primaryColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  width: 1,
                  color: AppStyle.secondaryColor,
                )),
            hintText: 'Telusuri Lokasi...',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppStyle.secondaryColor)),
      ),
    );
  }

  _buildButtonTools(BuildContext context) {
    return Positioned(
        right: 16,
        bottom: 24,
        child: Column(
          children: [
            CustomButton(
                onTap: context.read<MapBoxBloc>().resetRoute,
                icon: Icons.restart_alt),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
                onTap: context.read<MapBoxBloc>().zoomIn, icon: Icons.zoom_in),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
                onTap: context.read<MapBoxBloc>().zoomOut,
                icon: Icons.zoom_out),
            const SizedBox(
              height: 8,
            ),
            CustomButton(onTap: () {}, icon: Icons.location_searching),
          ],
        ));
  }
}

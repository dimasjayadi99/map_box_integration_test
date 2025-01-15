import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_box_app/app/config/map_config.dart';
import 'package:map_box_app/app/core/common/constants/app_string.dart';
import 'package:map_box_app/app/core/common/constants/app_style.dart';
import 'package:map_box_app/app/features/map_box/presentations/bloc/map_box_bloc.dart';
import 'package:map_box_app/app/features/map_box/presentations/widgets/custom_button.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import '../../domain/entities/suggestion_entity.dart';

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
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                context.read<MapBoxBloc>().add(OnSuggestionSearch(value));
              } else {
                context.read<MapBoxBloc>().add(OnClearSuggestion());
              }
            },
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
                ),
              ),
              hintText: 'Telusuri Lokasi...',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppStyle.secondaryColor),
            ),
          ),
          BlocBuilder<MapBoxBloc, MapBoxState>(
            builder: (context, state) {
              if (state is SearchLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SearchSuccessState &&
                  state.suggestion.isNotEmpty) {
                return _buildSuggestionsList(state.suggestion);
              } else if (state is SearchFailedState) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  _buildSuggestionsList(List<SuggestionEntity> suggestions) {
    return suggestions.isEmpty
        ? Container()
        : Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions[index];
                return ListTile(
                  title: Text(
                    suggestion.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(suggestion.fullAddress),
                  onTap: () {
                    /// get suggestion id for get detail location
                  },
                );
              },
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

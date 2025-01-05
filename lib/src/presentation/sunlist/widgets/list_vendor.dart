import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_card.dart';

class ListVendor extends StatefulWidget {
  final int? itemCount;
  const ListVendor({super.key, this.itemCount});

  @override
  State<ListVendor> createState() => _ListVendorState();
}

class _ListVendorState extends State<ListVendor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int count = widget.itemCount ?? 3;

    return BlocBuilder<VendorListBloc, VendorListState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Container(
                height: 260,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.only(top: 5.0),
                child: const Center(
                  child: Text('Fetching data.'),
                ));
          },
          error: (message) {
            return Container(
                height: 260,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.only(top: 5.0),
                child: const Center(
                  child: Text('Please try again.'),
                ));
          },
          loading: () {
            return Container(
                height: 260,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.only(top: 5.0),
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          },
          loaded: (vendors) {
            return Column(
              children: List.generate(
                vendors.length > count ? count : vendors.length,
                (index) {
                  final vendor = vendors[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: VendorCard(data: vendor),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

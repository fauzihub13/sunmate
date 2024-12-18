import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor.dart';
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
    context.read<VendorListBloc>().add(const VendorListEvent.getAllVendor());
  }

  @override
  Widget build(BuildContext context) {
    final int count = widget.itemCount ?? vendorList.length;

    return BlocBuilder<VendorListBloc, VendorListState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(child: Text('Failed fetch vendor'));
          },
          error: (message) {
            return Text(message);
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
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

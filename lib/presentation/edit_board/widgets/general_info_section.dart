import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_models/board_details_cubit/board_details_cubit.dart';
import '../../create_board/widgets/input_view.dart';
import 'edit_text_field.dart';

class GeneralInfoSection extends StatelessWidget {
  const GeneralInfoSection({Key? key}) : super(key: key);

  _updateTitle(BuildContext context, String title) {
    if (title.isNotEmpty) {
      context.read<BoardDetailsCubit>().updateTitle(title);
    }
  }

  _updateDescription(BuildContext context, String description) {
    if (description.isNotEmpty) {
      context.read<BoardDetailsCubit>().updateDescription(description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardDetailsCubit, BoardDetailsState>(
         builder: (context, state) {
      if (state is BoardDetailsSuccessfully) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputView(
              inputTitle: "Title",
              maxLength: 30,
              maxLines: 1,
              textField: EditTextField(
                maxLength: 30,
                maxLine: 1,
                textEditingController: TextEditingController(text: state.title),
                onChange: (c) {
                  _updateTitle(context, c);
                },
              ),
            ),
            InputView(
              inputTitle: "Description",
              maxLength: 200,
              maxLines: 6,
              textField: EditTextField(
                maxLength: 200,
                maxLine: 6,
                textEditingController:
                    TextEditingController(text: state.description),
                onChange: (v) {
                  _updateDescription(context, v);
                },
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    });
  }
}

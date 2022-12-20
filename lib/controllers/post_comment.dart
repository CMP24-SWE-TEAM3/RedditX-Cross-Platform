import '../services/add_comment_service.dart';

postComment(postID, textController) async {
await addCommentApi(postID, textController.text);
}
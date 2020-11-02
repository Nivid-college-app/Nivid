class FileModel {
  List<String> files;
  String folder;
  FileModel({this.files, this.folder});
  FileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }
}

class VideoFileModel {
  List<dynamic> files;
  String folder;
  VideoFileModel({this.files, this.folder});
  VideoFileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].map((e) => e['path']).toList();
    folder = json['folderName'];
  }
}

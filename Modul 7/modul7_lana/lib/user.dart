class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId:
          json['userId'], // Perbaikan: Menggunakan 'userId' sesuai konvensi JSON umum
      id: json['id'],
      title: json['title'],
    );
  }
}

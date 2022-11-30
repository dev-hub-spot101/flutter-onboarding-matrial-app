class UnbordingContent{
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription });
}

List<UnbordingContent> contents = [
    UnbordingContent(
      image: "assets/intro.png",
      title: "First slider",
      discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ),
    UnbordingContent(
        image: "assets/intro1.png",
        title: "Second slider",
        discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ),
    UnbordingContent(
        image: "assets/intro2.png",
        title: "Three slider",
        discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    )
];
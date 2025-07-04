// import 'package:connectingknox/core/constants/enums.dart';
// import 'package:connectingknox/core/models/notification/notification_model.dart';
// import 'package:connectingknox/features/home/models/announcement_model.dart';
// import 'package:connectingknox/features/home/models/business_model.dart';
// import 'package:connectingknox/features/home/models/category.dart';
// import 'package:connectingknox/features/home/models/club_model.dart';
// import 'package:connectingknox/features/home/models/event_model.dart';
// import 'package:connectingknox/features/home/models/image_model.dart';
// import 'package:connectingknox/features/home/models/restaurant_model.dart';
// import 'package:connectingknox/features/questionnaire/models/question.dart';
// import 'package:connectingknox/features/quotes/models/quote_model.dart';
// import 'package:connectingknox/features/relationship_partners/models/partner_model.dart';

// Future<List<StepQuestion>> fetchQuestionsFromApi() async {
//   await Future.delayed(const Duration(milliseconds: 500));

//   return [
//     StepQuestion(
//       id: 'title',
//       label: 'Add a custom title for your project',
//       type: QuestionType.text,
//       hintText: 'Beautiful bathroom',
//       maxLines: 1,
//       isRequired: true,
//     ),
//     StepQuestion(
//       id: 'location',
//       label: 'Add the location where the project will take place',
//       type: QuestionType.text,
//       hintText: 'Maple street 123',
//       maxLines: 1,
//     ),
//     StepQuestion(
//       id: 'photos',
//       label: 'Add photos',
//       type: QuestionType.attachment,
//     ),
//     StepQuestion(
//       id: 'details',
//       label: 'Custom text area question?',
//       type: QuestionType.text,
//       hintText: "It's about 500 square…",
//       maxLines: 5,
//     ),
//     // StepQuestion(
//     //   id: 'projectType',
//     //   label: 'Select project type',
//     //   type: QuestionType.dropdown,
//     //   dropdownItems: [
//     //     'Bathroom Renovation',
//     //     'Kitchen Renovation',
//     //     'Flooring',
//     //     'Painting',
//     //   ],
//     // ),
//   ];
// }

// Future<List<NotificationModel>> fetchNotificationsFromApi() async {
//   await Future.delayed(const Duration(milliseconds: 500));

//   return [
//     // NotificationModel(
//     //   id: 1,
//     //   user: 101,
//     //   type: NotificationType.normal,
//     //   isRead: true,
//     //   title: 'Welcome to ConnectingKnox!',
//     //   body: 'Thank you for joining us. We are excited to have you on board.',
//     //   createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
//     //   orderId: 'ORD12345',
//     // ),
//     // NotificationModel(
//     //   id: 2,
//     //   user: 101,
//     //   type: NotificationType.normal,
//     //   isRead: false,
//     //   title: 'Your Quote Request',
//     //   body:
//     //       'PrimeCraft Contractors has reviewed your quote request. Expect a detailed response within 2 days.',
//     //   createdAt: DateTime.now().subtract(const Duration(hours: 3)),
//     //   orderId: 'ORD12346',
//     // ),
//     // NotificationModel(
//     //   id: 3,
//     //   user: 101,
//     //   type: NotificationType.event,
//     //   isRead: false,
//     //   title: 'Feedback Request',
//     //   body: 'Please provide your feedback on your recent experience.',
//     //   createdAt: DateTime.now().subtract(const Duration(days: 2)),
//     //   orderId: 'ORD12347',
//     // ),
//     // NotificationModel(
//     //   id: 4,
//     //   user: 101,
//     //   type: NotificationType.normal,
//     //   isRead: false,
//     //   title: 'New Features Added',
//     //   body:
//     //       'Check out the new features we have added to enhance your experience.',
//     //   createdAt: DateTime.now().subtract(const Duration(days: 3)),
//     //   orderId: 'ORD12348',
//     // ),
//     // NotificationModel(
//     //   id: 5,
//     //   user: 101,
//     //   type: NotificationType.normal,
//     //   isRead: false,
//     //   title: 'Scheduled Maintenance',
//     //   body:
//     //       'We will be undergoing scheduled maintenance on Saturday at 12:00 AM.',
//     //   createdAt: DateTime.now().subtract(const Duration(days: 4)),
//     //   orderId: 'ORD12349',
//     // ),
//   ];
// }

// final List<ClubModel> dummyClubs = [
//   // Client's provided clubs
//   ClubModel(
//     id: '1580af32-72ae-4db7-b3f7-752e507b373b',
//     categories: [
//       const Category(id: 'sports_fitness', name: 'Sports and Fitness')
//     ],
//     owner: 'Knox Admin',
//     name: 'Knox Paddle Boarding Group',
//     status: 'published',
//     isFavorite: false,
//     phoneNumber: '+14028025870',
//     description:
//         'The Knox Paddleboarding Group is a vibrant community in Knoxville, TN, dedicated to bringing people together through the love of paddleboarding. Whether you\'re a seasoned paddler or a beginner, we offer fun, inclusive meetups to explore Knoxville\'s waterways, connect with nature, and build lasting friendships.',
//     meetingDay: 'Saturday',
//     meetingTime: '10:00:00',
//     location: 'Knoxville, TN, USA',
//     logo:
//         'https://connecting-knox-api.kochanet.com/media/club/logos/Logo_maker_project_4.png',
//     images: [
//       ImageModel(
//         image:
//             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYpJtv9AG9ec72lQ_ditZ2ChUNq4IUT_0XzQ&s',
//       ),
//       ImageModel(
//         image:
//             'https://archive.knoxnews.com/Services/image.ashx?domain=www.knoxnews.com&file=K0015580743--286635.JPG&resize=660*439',
//       ),
//     ],
//     numberOfMembers: '31-50',
//     facebookLink: null,
//     youtubeLink: null,
//     xLink: null,
//     instagramLink: null,
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//     likes: 234,
//   ),
//   ClubModel(
//     id: 'c00b9952-b34a-41d4-80d6-ee0458bcc0dc',
//     categories: [const Category(id: 'soccer', name: 'Soccer')],
//     owner: 'Owner 2',
//     name: 'Sober in Knoxville',
//     status: 'published',
//     isFavorite: true,
//     phoneNumber: '123-456-7892',
//     description:
//         'Sober in Knoxville is a supportive community dedicated to celebrating sobriety and healthy living. We host regular meetups in the vibrant Market Square area, offering engaging events and open discussions for those on the path to recovery.',
//     meetingDay: 'Wednesday',
//     meetingTime: '16:00:00',
//     location: 'Market Square, Knoxville, TN 37902',
//     logo: 'https://picsum.photos/seed/club_logo2/1920/1080',
//     images: [
//       ImageModel(image: 'https://picsum.photos/seed/club2_image1/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/club2_image2/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/club2_image3/1920/1080'),
//     ],
//     numberOfMembers: '51-100',
//     facebookLink: null,
//     youtubeLink: null,
//     xLink: null,
//     instagramLink: null,
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//     likes: 110,
//   ),
//   ClubModel(
//     id: '76f7f8f5-f5ab-467e-8e7b-21881df85cf9',
//     categories: [const Category(id: 'basketball', name: 'Basketball')],
//     owner: 'Owner 3',
//     name: 'The Long Run',
//     status: 'published',
//     isFavorite: false,
//     phoneNumber: '201-555-0123',
//     description:
//         'The Long Run is a dynamic group of basketball enthusiasts in Knoxville, TN. We gather at the Knoxville Central YMCA for pick-up games, skill-building sessions, and competitive leagues, fostering teamwork, fitness, and lasting friendships.',
//     meetingDay: 'Wednesday',
//     meetingTime: '16:00:00',
//     location: 'Knoxville Central YMCA, Knoxville, TN 37917',
//     logo: 'https://picsum.photos/seed/club_logo3/1920/1080',
//     images: [
//       ImageModel(image: 'https://picsum.photos/seed/club3_image1/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/club3_image2/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/club3_image3/1920/1080'),
//     ],
//     numberOfMembers: '51-100',
//     facebookLink: null,
//     youtubeLink: null,
//     xLink: null,
//     instagramLink: null,
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//     likes: 120,
//   ),
//   ClubModel(
//     id: '0ac6f3d2-d0a7-4991-9135-e338862f4fd2',
//     categories: [const Category(id: 'soccer', name: 'Soccer')],
//     owner: 'Owner 4',
//     name: 'Knoxville Open Water Swim Club',
//     status: 'published',
//     isFavorite: true,
//     phoneNumber: '123-456-7894',
//     description:
//         'Knoxville Open Water Swim Club brings together swimmers who love the challenge of open water. Meeting at Ijams Nature Center, we organize training sessions, safety workshops, and social swims amidst Knoxville’s scenic natural surroundings.',
//     meetingDay: 'Wednesday',
//     meetingTime: '16:00:00',
//     location: 'Ijams Nature Center, Knoxville, TN 37921',
//     logo: 'https://picsum.photos/seed/club_logo4/1920/1080',
//     images: [
//       ImageModel(image: 'https://picsum.photos/seed/club4_image1/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/club4_image2/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/club4_image3/1920/1080'),
//     ],
//     numberOfMembers: '51-100',
//     facebookLink: null,
//     youtubeLink: null,
//     xLink: null,
//     instagramLink: null,
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//     likes: 130,
//   ),
// ];

// final List<Category> dummyRestaurantsCategories = [
//   const Category(
//       id: "f7992905-4448-4648-abcf-5e6a2813a6b1", name: "Breakfast & Brunch"),
//   const Category(id: "3e615e47-0892-4281-8768-3a5ae3cd89a3", name: "American"),
//   const Category(id: "5f96a619-489a-429d-ac58-d18651568dd8", name: "Asian"),
//   const Category(
//       id: "637bafcb-a865-47a7-9cb0-c31f487ec0f8", name: "BBQ & Grilled"),
//   const Category(id: "f2526dc0-40a5-4012-bcb0-5b022756124e", name: "European"),
//   const Category(
//       id: "c7c2ad8f-e51f-4db4-a009-daaba5fb4b2b", name: "Latin & Mexican"),
//   const Category(id: "c7bb6895-741e-4d48-90d6-2b1ddee81b81", name: "Chicken"),
//   const Category(
//       id: "6a78c1d5-5695-41b2-a4b1-7f92d505dea9", name: "Pizza & Pasta"),
//   const Category(
//       id: "bd062280-cb32-48a8-9f0a-c1bdcdb67f48", name: "Sandwich & Deli"),
//   const Category(id: "5b8793ec-515d-4648-9057-c6b25e78e20a", name: "Buffets"),
//   const Category(
//       id: "89fdeee5-4d65-446b-8565-a64afd2657d8",
//       name: "Ice Cream & Frozen Desserts"),
//   const Category(
//       id: "661018ef-3dff-410a-80e9-dcf1bac8422b", name: "Boba & Juice bars"),
//   const Category(
//       id: "249d74e9-3e8a-4e9d-b404-c494603d3860", name: "Coffeehouses"),
//   const Category(
//       id: "0083e4be-27dd-416f-905f-b81470ca630f", name: "Craft Breweries"),
//   const Category(
//       id: "25efced4-fa27-4116-8f4d-e4a5b96e0940", name: "Pubs & Wine Bars"),
//   const Category(
//       id: "2b145358-91a5-4f99-923a-f7e63d3f7acc", name: "Mediterranean"),
//   const Category(id: "10a95a5a-6432-4f21-b02e-ba2d13cea52c", name: "Seafood"),
//   const Category(
//       id: "c1b0290f-1cfb-449e-82a2-7e0add6f58b1",
//       name: "International & Fusion"),
//   const Category(id: "65613698-d7b9-40fd-a677-b0f98ed27234", name: "Bakery"),
// ];

// final List<Category> dummyClubsCategories = [
//   const Category(
//     id: "fae2c027-f54b-4f8c-bc3c-f364e6eb71a7",
//     name: "Academic and Educational Clubs",
//     subcategories: [
//       Category(
//           id: "e7492633-5481-4f83-a72e-b6bc10e9bb32",
//           name: "Debate and Public Speaking Clubs"),
//       Category(
//           id: "71b43da8-b9ec-4d6c-8cb7-92376e4c5cd5",
//           name: "History or Philosophy Discussion Groups"),
//       Category(
//           id: "4ab9a8d3-2d6b-450d-b17f-c70e6ff7421c",
//           name: "Investment and Finance Clubs"),
//       Category(
//           id: "3e08c832-df73-4edb-9223-f2ce7e5de9bf", name: "Reading Groups"),
//       Category(
//           id: "87fcb3d4-38e9-4171-abf4-a3b91794fab1",
//           name: "Science and Nature Clubs"),
//       Category(
//           id: "562e038c-5a6c-4906-b6ff-5c91ca4b79df",
//           name: "STEM (Science, Technology, Engineering, Math) Clubs"),
//     ],
//   ),
//   const Category(
//     id: "d0b49f52-c86b-4bb4-8f6e-5b3356eeaba4",
//     name: "Community and Volunteer Organizations",
//     subcategories: [
//       Category(
//           id: "8ac095cf-e3bb-4ad1-a503-a23abc587205",
//           name: "Animal Rescue and Shelter Volunteer Groups"),
//       Category(
//           id: "51765a3a-51cb-4311-bde5-630b7b65fb65",
//           name: "Charity and Fundraising Groups"),
//       Category(
//           id: "6fa44c67-0032-45d3-afba-4173162485b2",
//           name: "Environmental Conservation Groups"),
//       Category(
//           id: "91ec2e75-9bdb-4002-af09-d3600f5941d3",
//           name: "Food Banks and Soup Kitchen Volunteering"),
//       Category(
//           id: "5baa26e5-9a7d-4790-95ce-47f77556595a",
//           name: "Habitat for Humanity and Housing Assistance Clubs"),
//       Category(
//           id: "df15e2a5-153b-4179-82a2-ccc100f4eb63",
//           name: "Rotary, Lions, or Kiwanis Clubs"),
//     ],
//   ),
//   const Category(
//     id: "f3d5f950-bef5-4b09-9498-7f6a651f5af3",
//     name: "Creative and Arts Clubs",
//     subcategories: [
//       Category(
//           id: "21545e06-ce1e-4ecf-b1ef-05c7197bc495",
//           name: "Crafting and DIY Groups"),
//       Category(
//           id: "477b7e1c-3fe4-4bca-9264-bc335f2b1f9a",
//           name: "Music and Band Groups"),
//       Category(
//           id: "ab88c379-3d51-40ac-ae48-fb0eca7fc5da",
//           name: "Painting and Drawing Classes"),
//       Category(
//           id: "2398fdf6-4906-4edf-9370-c7a4112bd5a9",
//           name: "Performing Arts Groups (Theater, Dance)"),
//       Category(
//           id: "bdb79298-8837-47c3-9987-6b0810ead390",
//           name: "Photography Clubs"),
//       Category(
//           id: "e857f040-8aee-46fc-8c0a-64ddb4768b2b",
//           name: "Pottery and Sculpture Clubs"),
//       Category(
//           id: "f83aa1e3-3e47-4a94-9892-b3fee693569a",
//           name: "Writing and Poetry Groups"),
//     ],
//   ),
//   const Category(
//     id: "f4506338-ded4-4378-87e3-89f8a0000833",
//     name: "Cultural and Language Exchange Clubs",
//     subcategories: [
//       Category(id: "10d50ac0-da60-4c3c-93d9-243fa6257d5b", name: "Book Clubs"),
//       Category(
//           id: "bc9d5e99-5061-4c4d-8b62-2444b1f6803b",
//           name: "Cooking Classes or Culinary Clubs"),
//       Category(
//           id: "e1d987fd-4c28-4380-8ca2-85eda07a32c6",
//           name: "Cultural Exchange Groups"),
//       Category(
//           id: "c61f4057-ddbb-42b0-916b-04be513bd960",
//           name: "Film Appreciation or Movie Clubs"),
//       Category(
//           id: "a28c9532-9f52-4408-b44f-eeeed0785e28",
//           name: "Language Learning Groups (Spanish, French, etc.)"),
//     ],
//   ),
//   const Category(
//     id: "84728121-f5a7-445e-91ae-a87b32dcbc9f",
//     name: "Health and Wellness Groups",
//     subcategories: [
//       Category(
//           id: "c70b13f9-b7a9-4933-9264-d20b7241457c",
//           name: "Addiction Recovery Groups (Alcoholics Anonymous, etc.)"),
//       Category(
//           id: "e7aa7e28-ba4c-411b-b41e-313750447091",
//           name: "Health and Nutrition Discussion Groups"),
//       Category(
//           id: "44b1b77a-ab82-4c9c-9677-979cd5f2fe0c",
//           name: "Mental Health Support Groups"),
//       Category(
//           id: "9de5fcbe-4a9c-4313-a941-bd812a5279e8",
//           name: "Mindfulness and Stress-Relief Clubs"),
//       Category(
//           id: "f3ef209c-b0b0-47fc-a8b7-f06aee86466e",
//           name: "Weight Loss and Fitness Accountability Groups"),
//     ],
//   ),
//   const Category(
//     id: "e5aa9f04-9014-4538-9ca7-910380baa51a",
//     name: "Outdoor and Nature Clubs",
//     subcategories: [
//       Category(
//           id: "9c29ef0d-e214-4f8e-b7a4-edbfa349b6bc",
//           name: "Birdwatching Clubs"),
//       Category(
//           id: "afafeed8-55e8-437a-8550-8db00fd3ad64",
//           name: "Camping and Outdoorsmanship Groups"),
//       Category(
//           id: "3e6c9b1d-97ff-44ea-a1a3-f30577e96d1e",
//           name: "Conservation and Environmental Advocacy Groups"),
//       Category(
//           id: "56166b39-1731-46d1-8987-68fd914937e0",
//           name: "Fishing and Hunting Clubs"),
//       Category(
//           id: "e53eb1f3-f573-4945-a26b-1d18712cda35", name: "Gardening Clubs"),
//     ],
//   ),
//   const Category(
//     id: "a70872a7-9530-44bd-b63d-473b979adcd4",
//     name: "Parenting and Family Groups",
//     subcategories: [
//       Category(
//           id: "92809041-55ce-4a47-b2aa-74fb0c092699",
//           name: "Family Fitness Groups"),
//       Category(
//           id: "cdf51d83-f118-4f7f-9b9e-aac4e62b46d3",
//           name: "Homeschooling Support Groups"),
//       Category(
//           id: "56301f04-64a8-4365-b8c2-c03efb87212a",
//           name: "Moms or Dads Clubs"),
//       Category(
//           id: "b51ae5c0-532a-47a1-ae61-0b4fcc3dd2d0",
//           name: "Parenting Support Groups"),
//       Category(
//           id: "30087e88-b963-4698-893e-2baa4f824755", name: "Playdate Groups"),
//     ],
//   ),
//   const Category(
//     id: "bd5c04fa-e1b1-47a5-be49-d9ee51bb39cb",
//     name: "Political and Advocacy Groups",
//     subcategories: [
//       Category(
//           id: "00a4ce74-7ec3-4fbc-8330-9fcde923cbbe",
//           name: "Human Rights Organizations"),
//       Category(
//           id: "c99a38c9-7425-40f7-b936-af25cda372ca",
//           name: "Local Government Advocacy Groups"),
//       Category(
//           id: "e66e8797-a5d0-445b-817e-6eef891355a7",
//           name: "Policy Discussion Forums"),
//       Category(
//           id: "64c36039-655d-4935-8fcd-29d7edfa3dec",
//           name: "Political Party Chapters (Democratic, Republican, etc.)"),
//       Category(
//           id: "2cd2d6da-f4cb-4881-b700-bfbd8604f136",
//           name: "Social Justice and Activism Groups"),
//     ],
//   ),
//   const Category(
//     id: "c06b1d13-fdb5-4e56-b42b-ca8d396a9874",
//     name: "Professional and Networking Groups",
//     subcategories: [
//       Category(
//           id: "bdef936a-4534-4860-a4b6-22080e6123ed",
//           name: "Business Networking International (BNI) Chapters"),
//       Category(
//           id: "800da234-80c9-4d49-84d8-bad1b9260078",
//           name: "Entrepreneurs and Startups Networking Groups"),
//       Category(
//           id: "35dd511c-16fe-428f-bd31-1c4630be351b",
//           name: "Marketing and Creative Professional Groups"),
//       Category(
//           id: "4f80593a-ea68-4c43-875a-dfaeea9a53d9",
//           name: "Real Estate Investment Clubs"),
//       Category(
//           id: "dbc106f1-7624-44b4-b523-43b18bc7d738",
//           name: "Women in Business Associations"),
//       Category(
//           id: "1d1619a6-7318-4400-82f5-19b2d617099f",
//           name: "Young Professionals Groups"),
//     ],
//   ),
//   const Category(
//     id: "b71a49c5-ee9d-4525-8db1-8848a4c0a01e",
//     name: "Religious and Spiritual Groups",
//     subcategories: [
//       Category(
//           id: "88310260-12af-4a0e-9241-b6c6063ee994",
//           name: "Bible Study or Religious Study Groups"),
//       Category(
//           id: "56d264f0-0668-4043-ac53-1fdf342fcb5f",
//           name: "Church-Based Fellowship Groups"),
//       Category(
//           id: "9561c90f-fddb-4f45-9177-a1fe3ea18945",
//           name: "Interfaith Dialogue Groups"),
//       Category(
//           id: "8eaa48d9-e40d-4484-969d-34c5fdab49d5",
//           name: "Meditation and Mindfulness Groups"),
//       Category(
//           id: "0601eb63-826f-4c3c-807c-7b820f9ccbc4", name: "Youth Ministries"),
//     ],
//   ),
//   const Category(
//     id: "e3f96f5f-1570-49e0-b740-d224ea4171d2",
//     name: "Social and Special Interest Groups",
//     subcategories: [
//       Category(
//           id: "130a26db-6512-4a3e-b9b6-df54fc5fb764",
//           name: "Board Games and Tabletop RPG Clubs"),
//       Category(
//           id: "7f666233-b13f-4e9a-93b6-a899e9ed31c3",
//           name: "Car and Motorcycle Enthusiast Clubs"),
//       Category(
//           id: "b6a2e673-ff04-4786-b3b3-86ed524c9620",
//           name: "Game Night or Trivia Groups"),
//       Category(
//           id: "9509638b-787e-45f7-826e-6dc3b65c3d50",
//           name: "Gardening and Urban Farming Groups"),
//       Category(
//           id: "6ad30516-f39c-44d9-ab18-4b0c485f836d",
//           name: "Social Dancing (Salsa, Ballroom, Swing, etc.)"),
//       Category(
//           id: "9bc47a34-698c-4af5-8715-99c98c4d7190",
//           name: "Travel and Adventure Groups"),
//       Category(
//           id: "09a64462-9584-414c-8a99-9e1427c86dc9",
//           name: "Wine Tasting or Beer Brewing Clubs"),
//     ],
//   ),
//   const Category(
//     id: "62bbfb5e-a9a5-40db-b81b-6f4a9920bf7d",
//     name: "Special Interest and Hobby Clubs",
//     subcategories: [
//       Category(
//           id: "e4cdbc0c-4557-4ab4-95a3-7dd7da551c8c", name: "Astronomy Groups"),
//       Category(id: "5baf8a10-8e4b-453d-8aeb-5c4d0ca475eb", name: "Chess Clubs"),
//       Category(
//           id: "0a3124ee-0182-451c-95de-fc3e8cdbf617",
//           name: "Genealogy and Ancestry Clubs"),
//       Category(
//           id: "6e96bdbf-bca5-4590-a9ba-43d4d03ac599",
//           name: "Model Train or Plane Groups"),
//       Category(
//           id: "a1b0eda2-fda5-4708-b8b4-bd341842a218",
//           name: "Vintage and Antiques Collectors Groups"),
//     ],
//   ),
//   const Category(
//     id: "db9feb0d-c015-4a75-83f7-0fef6635f899",
//     name: "Sports and Fitness Clubs",
//     subcategories: [
//       Category(
//           id: "76ad8cbb-4a29-481d-a117-feba594491fd",
//           name: "CrossFit and Bootcamp Groups"),
//       Category(
//           id: "b277a207-46f7-4045-aedc-0c6f35cb2ce0", name: "Cycling Clubs"),
//       Category(
//           id: "ee3c94e8-1724-40aa-95b2-41b1a7f88430", name: "Hiking Clubs"),
//       Category(
//           id: "b23fdbb2-6356-463d-9137-f98eadb2a8e8",
//           name: "Martial Arts and Self-Defense Clubs"),
//       Category(
//           id: "cecd5933-7aad-4d93-a2be-317299fdf8ca",
//           name: "Paddleboarding and Kayaking Groups"),
//       Category(
//           id: "d8d7df36-d9a0-4045-9693-d434e5d84074", name: "Running Clubs"),
//       Category(
//           id: "5db60c85-9f4d-4894-9a83-bfcd1929389a",
//           name: "Soccer, Basketball, Softball, Baseball, Football"),
//       Category(
//           id: "c75737d8-81d7-48e7-942c-51c300ff012e",
//           name: "Tennis and Pickleball Clubs"),
//       Category(
//           id: "f99b484d-46c2-4777-818d-3bb4d770cd51",
//           name: "Yoga and Meditation Groups"),
//     ],
//   ),
//   const Category(
//     id: "be57df2f-61dd-4b2f-bd7e-63ced9f8cf2e",
//     name: "Technology and Innovation Groups",
//     subcategories: [
//       Category(
//           id: "da914d74-656d-4f8d-991e-f07d711b4e69",
//           name: "Coding and Programming Groups"),
//       Category(
//           id: "89377e17-a49d-49ed-8687-2a9d1181beb6",
//           name: "Cryptocurrency and Blockchain Groups"),
//       Category(
//           id: "8f8d0492-56be-4bb9-a7b3-05bd4689f779",
//           name: "Makerspaces and DIY Technology Clubs"),
//       Category(
//           id: "dbbf197d-1f48-424c-a9e2-de6de260a314", name: "Robotics Clubs"),
//       Category(
//           id: "3afa3ea0-ebab-4e41-8422-d718a037beea",
//           name: "Tech Startups and Innovation Networking Groups"),
//     ],
//   ),
// ];

// final List<RestaurantModel> dummyRestaurants = [
//   // Client's provided restaurants
//   // 1. Pete's Restaurant & Coffee Shop
//   RestaurantModel(
//     id: 'c2018be0-0caa-4a73-877d-26cc30bf660e',
//     title: "Pete's Restaurant & Coffee Shop",
//     shortDescription:
//         "Sandwiches & other diner staples in an enduring American breakfast & lunch joint.",
//     description:
//         "Pete’s Restaurant is a family-owned, family-operated diner in downtown Knoxville. We pride ourselves on serving the best breakfast and lunch in Knoxville. Customer satisfaction is our #1 priority. From our family at Pete's Restaurant, thanks for stopping by!",
//     images: [
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipNnHdJOvHI28lcGlZB4Mh1jDHPr9XHu-9RWnaZs=s1360-w1360-h1020'),
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipNUROBr3ofo-j7kxltHC6TOGFm9QsKgkypVFkhB=s1360-w1360-h1020'),
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipPSNslf9b4JToERJnUpoxuQOUPMggX9oO3wTc7j=s1360-w1360-h1020'),
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipOVoC2Lw2n9XKfVP_6hc7hqDSGRspQUrw9AL8Ux=s1360-w1360-h1020'),
//     ],
//     logo:
//         "http://backend-api-dev-4560.up.railway.app/media/food/c2018be0-0caa-4a73-877d-26cc30bf660e/images/petes-coffee-shop-logo-cropped.jpg",
//     address: "540 Union Ave, Knoxville, TN 37902",
//     openingTime: "Mon - Fri: 6:30 AM - 2 PM / Sat: 7 AM - 2 PM / Sun: Closed",
//     closingTime: "Mon - Fri: 6:30 AM - 2 PM / Sat: 7 AM - 2 PM / Sun: Closed",
//     phoneNumber: "(865) 523-2860",
//     categories: [const Category(id: 'breakfast', name: 'Breakfast')],
//     createdAt: DateTime.now(),
//     isFavorite: false,
//   ),

//   // 2. KoPita Authentic Mediterranean
//   RestaurantModel(
//     id: '160ddd00-9fc8-4687-a195-3f7567431713',
//     title: "KoPita Authentic Mediterranean",
//     shortDescription:
//         "Relaxed Mediterranean cafe offering pita wraps, bowls & salads, plus platters & vegetarian options.",
//     description:
//         "This taste of Mediterranean restaurant is the brainchild of Chef Avi Zenatti. Avi is a Moroccan/Israeli who honed his family recipes passed down through generations. His expertise comes from cooking for his big family. Inspired by the Downtown Knoxville community, he decided to share his love of food and so KoPita was born. We're proud to say that all of our food is made fresh, with no exceptions.",
//     images: [
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipMHiQAftCQuFGDATDU_XiIZ7hidknMPVuq6Ok_E=s1360-w1360-h1020'),
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipPNIviUjphAZaBqICUuhC5RtYIEs7LDQ2WGijHk=s1360-w1360-h1020'),
//       ImageModel(
//           image:
//               'https://lh3.googleusercontent.com/p/AF1QipPXYNWTEenou4JG4pZRpJK0Yl5xrR0O0wR6OBL3=s1360-w1360-h1020'),
//     ],
//     logo:
//         "http://backend-api-dev-4560.up.railway.app/media/food/160ddd00-9fc8-4687-a195-3f7567431713/images/kopta_logo.jpg",
//     address:
//         "Upstairs of the Embassy Suites Hotel, 507 S Gay St, Knoxville, TN 37902",
//     openingTime: "Mon - Fri: 11:30 AM - 9 PM / Sun: Closed",
//     closingTime: "Mon - Fri: 11:30 AM - 9 PM / Sun: Closed",
//     phoneNumber: "(865)-249-8823",
//     categories: [const Category(id: 'mediterranean', name: 'Mediterranean')],
//     createdAt: DateTime.now(),
//     isFavorite: true,
//   ),

//   // 3. Knox Cafe
//   RestaurantModel(
//     id: '0d6f015c-d471-4672-8e48-fc490fb818cf',
//     title: 'Knox Cafe',
//     shortDescription: 'A cozy place for a quick bite.',
//     description:
//         'Knox Cafe offers a warm and welcoming atmosphere with a variety of delicious dishes perfect for breakfast, lunch, or a casual meal.',
//     images: [
//       ImageModel(image: 'https://picsum.photos/seed/knox_cafe1/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/knox_cafe2/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/knox_cafe3/1920/1080'),
//     ],
//     logo: 'https://picsum.photos/seed/knox_cafe_logo/1920/1080',
//     address: '123 Main St, Knoxville, TN',
//     openingTime: '7 AM - 10 PM',
//     closingTime: '7 AM - 10 PM',
//     phoneNumber: '123-456-7890',
//     categories: [const Category(id: 'cafe', name: 'Cafe')],
//     createdAt: DateTime.now(),
//     isFavorite: false,
//   ),

//   // 4. Knoxville Hotdogs
//   RestaurantModel(
//     id: 'd517c4cd-6067-43b8-a24b-b12995385763',
//     title: 'Knoxville Hotdogs',
//     shortDescription: 'Serving the best hotdogs in town.',
//     description:
//         'Knoxville Hotdogs specializes in gourmet hotdogs with a variety of unique toppings, bringing a modern twist to a classic favorite.',
//     images: [
//       ImageModel(image: 'https://picsum.photos/seed/knox_hotdogs1/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/knox_hotdogs2/1920/1080'),
//       ImageModel(image: 'https://picsum.photos/seed/knox_hotdogs3/1920/1080'),
//     ],
//     logo: 'https://picsum.photos/seed/knox_hotdogs_logo/1920/1080',
//     address: '456 Elm St, Knoxville, TN',
//     openingTime: '11 AM - 9 PM',
//     closingTime: '11 AM - 9 PM',
//     phoneNumber: '987-654-3210',
//     categories: [const Category(id: 'fast_food', name: 'Fast Food')],
//     createdAt: DateTime.now(),
//     isFavorite: true,
//   ),
// ];

// final List<BusinessModel> dummyBusinesses = [
//   BusinessModel(
//     id: "d01a0efb-3e2f-4c1e-9d8e-7b4a2c9f1234",
//     // rating: 4.7,
//     // reviewCount: 124,
//     // badge: "Top Rated Roofing",
//     // website: "https://knoxroofers.com",
//     // priceRange: "\$\$\$",
//     isFavorite: true,
//     name: "Knox Roofers",
//     shortDescription: "Providing expert roofing services for over 20 years.",
//     images: [
//       ImageModel(
//           image: "https://picsum.photos/seed/knoxroofers_image1/1920/1080"),
//       ImageModel(
//           image: "https://picsum.photos/seed/knoxroofers_image2/1920/1080"),
//       ImageModel(
//           image: "https://picsum.photos/seed/knoxroofers_image3/1920/1080"),
//     ],
//     logo: "https://picsum.photos/seed/knoxroofers_logo/1920/1080",
//     address: "123 Main St, Knoxville, TN",
//     // openingHours: "8 AM - 6 PM",
//     categories: [const Category(id: 'Construction', name: 'Construction')],
//     description:
//         "Knox Roofers has been serving the Knoxville area with top quality roofing solutions for over two decades. Our team of experienced professionals delivers reliable repairs, installations, and maintenance services tailored to each client's needs.",
//     // services: [
//     //   Service(
//     //     id: "srv1",
//     //     name: "Roof Repair",
//     //     image: "https://picsum.photos/seed/roofrepair/1920/1080",
//     //   ),
//     //   Service(
//     //     id: "srv2",
//     //     name: "Roof Installation",
//     //     image: "https://picsum.photos/seed/roofinstallation/1920/1080",
//     //   ),
//     // ],
//     // reviews: [
//     //   Review(
//     //     reviewerName: "John Doe",
//     //     comment: "Excellent service and quality workmanship.",
//     //     rating: 5.0,
//     //   ),
//     //   Review(
//     //     reviewerName: "Jane Smith",
//     //     comment: "Reliable and professional, highly recommended.",
//     //     rating: 4.5,
//     //   ),
//     // ],
//     // workImages: [
//     //   "https://picsum.photos/seed/knoxroofers_work1/1920/1080",
//     //   "https://picsum.photos/seed/knoxroofers_work2/1920/1080",
//     //   "https://picsum.photos/seed/knoxroofers_work3/1920/1080",
//     //   "https://picsum.photos/seed/knoxroofers_work4/1920/1080",
//     //   "https://picsum.photos/seed/knoxroofers_work5/1920/1080",
//     //   "https://picsum.photos/seed/knoxroofers_work6/1920/1080",
//     // ],
//   ),
//   BusinessModel(
//     id: "e92c1b7d-8f4e-4d9a-9d07-5f2c3e6789ab",
//     // phoneNumber: "865-555-0456",
//     // rating: 4.2,
//     // reviewCount: 87,
//     // badge: "Best HVAC Solutions",
//     // website: "https://scruffychvac.com",
//     // priceRange: "\$\$",
//     isFavorite: false,
//     name: "Scruffy City HVAC",
//     shortDescription:
//         "Efficient heating and cooling solutions for residential and commercial needs.",
//     images: [
//       ImageModel(
//           image: "https://picsum.photos/seed/scruffych_image1/1920/1080"),
//       ImageModel(
//           image: "https://picsum.photos/seed/scruffych_image2/1920/1080"),
//       ImageModel(image: "https://picsum.photos/seed/scruffych_image3/1920/1080")
//     ],
//     logo: "https://picsum.photos/seed/scruffych_logo/1920/1080",
//     address: "456 Elm St, Knoxville, TN",
//     // openingHours: "9 AM - 7 PM",
//     categories: [const Category(id: "HVAC", name: "HVAC")],
//     description:
//         "Scruffy City HVAC offers reliable and affordable heating and cooling services in the Knoxville area. Our certified technicians ensure your systems run efficiently, providing comfort all year round.",
//     // services: [
//     //   Service(
//     //     id: "srv3",
//     //     name: "AC Repair",
//     //     image: "https://picsum.photos/seed/acrepair/1920/1080",
//     //   ),
//     //   Service(
//     //     id: "srv4",
//     //     name: "Heating Maintenance",
//     //     image: "https://picsum.photos/seed/heatingmaintenance/1920/1080",
//     //   ),
//     // ],
//     // reviews: [
//     //   Review(
//     //     reviewerName: "Alice Johnson",
//     //     comment: "Quick response and professional service.",
//     //     rating: 4.0,
//     //   ),
//     //   Review(
//     //     reviewerName: "Bob Williams",
//     //     comment: "Fixed our AC in no time, very satisfied.",
//     //     rating: 4.5,
//     //   ),
//     // ],
//     // workImages: [
//     //   "https://picsum.photos/seed/scruffych_work1/1920/1080",
//     //   "https://picsum.photos/seed/scruffych_work2/1920/1080",
//     //   "https://picsum.photos/seed/scruffych_work3/1920/1080",
//     //   "https://picsum.photos/seed/scruffych_work4/1920/1080",
//     //   "https://picsum.photos/seed/scruffych_work5/1920/1080",
//     //   "https://picsum.photos/seed/scruffych_work6/1920/1080",
//     // ],
//   ),
//   BusinessModel(
//     id: "f7b3d5c9-4e6f-4a0e-8b2a-1d9f7c8e3b5d",
//     // phoneNumber: "865-555-0789",
//     // rating: 4.8,
//     // reviewCount: 153,
//     // badge: "Expert Electrical Services",
//     // website: "https://sunsphereelectrical.com",
//     // priceRange: "\$\$\$",
//     isFavorite: true,
//     name: "Sunsphere Electrical",
//     shortDescription:
//         "Your trusted partner in electrical installations and repairs.",
//     images: [
//       ImageModel(
//           image: "https://picsum.photos/seed/sunsphere_image1/1920/1080"),
//       ImageModel(
//           image: "https://picsum.photos/seed/sunsphere_image2/1920/1080"),
//       ImageModel(
//           image: "https://picsum.photos/seed/sunsphere_image3/1920/1080"),
//     ],
//     logo: "https://picsum.photos/seed/sunsphere_logo/1920/1080",
//     address: "789 Oak St, Knoxville, TN",
//     // openingHours: "7 AM - 5 PM",
//     categories: [const Category(id: 'Electrical', name: 'Electrical')],
//     description:
//         "With decades of experience, Sunsphere Electrical delivers quality electrical services for both residential and commercial clients. We specialize in installations, maintenance, and troubleshooting to keep your systems running safely.",
//     // services: [
//     //   Service(
//     //     id: "srv5",
//     //     name: "Electrical Wiring",
//     //     image: "https://picsum.photos/seed/electricalwiring/1920/1080",
//     //   ),
//     //   Service(
//     //     id: "srv6",
//     //     name: "Lighting Installation",
//     //     image: "https://picsum.photos/seed/lightinginstallation/1920/1080",
//     //   ),
//     // ],
//     // reviews: [
//     //   Review(
//     //     reviewerName: "Carlos Reyes",
//     //     comment: "Highly professional and efficient work.",
//     //     rating: 5.0,
//     //   ),
//     //   Review(
//     //     reviewerName: "Diana Lee",
//     //     comment: "The team was punctual and very knowledgeable.",
//     //     rating: 4.5,
//     //   ),
//     // ],
//     // workImages: [
//     //   "https://picsum.photos/seed/sunsphere_work1/1920/1080",
//     //   "https://picsum.photos/seed/sunsphere_work2/1920/1080",
//     //   "https://picsum.photos/seed/sunsphere_work3/1920/1080",
//     //   "https://picsum.photos/seed/sunsphere_work4/1920/1080",
//     //   "https://picsum.photos/seed/sunsphere_work5/1920/1080",
//     //   "https://picsum.photos/seed/sunsphere_work6/1920/1080",
//     // ],
//   ),
//   BusinessModel(
//     id: "a6e2c8b1-9d7f-4e2c-8b3a-2f1e6d9c4b7f",
//     // phoneNumber: "865-555-0912",
//     // rating: 4.3,
//     // reviewCount: 102,
//     // badge: "Reliable Plumbing Experts",
//     // website: "https://tnriverplumbing.com",
//     // priceRange: "\$\$",
//     isFavorite: false,
//     name: "Tennessee River Plumbing",
//     shortDescription: "Plumbing solutions with a commitment to excellence.",
//     images: [
//       ImageModel(image: "https://picsum.photos/seed/tnriver_image1/1920/1080"),
//       ImageModel(image: "https://picsum.photos/seed/tnriver_image2/1920/1080"),
//       ImageModel(image: "https://picsum.photos/seed/tnriver_image3/1920/1080"),
//     ],
//     logo: "https://picsum.photos/seed/tnriver_logo/1920/1080",
//     address: "321 River Rd, Knoxville, TN",
//     // openingHours: "8 AM - 8 PM",
//     categories: [const Category(id: 'plumbing', name: 'Plumbing')],
//     description:
//         "Tennessee River Plumbing provides fast and effective plumbing repairs and installations throughout Knoxville. Our licensed plumbers ensure that every job is completed to the highest standards, offering personalized solutions for your home or business.",
//     // services: [
//     //   Service(
//     //     id: "srv7",
//     //     name: "Leak Repair",
//     //     image: "https://picsum.photos/seed/leakrepair/1920/1080",
//     //   ),
//     //   Service(
//     //     id: "srv8",
//     //     name: "Pipe Installation",
//     //     image: "https://picsum.photos/seed/pipeinstallation/1920/1080",
//     //   ),
//     // ],
//     // reviews: [
//     //   Review(
//     //     reviewerName: "Emily Carter",
//     //     comment: "Very responsive and fixed my plumbing issues quickly.",
//     //     rating: 4.0,
//     //   ),
//     //   Review(
//     //     reviewerName: "Frank Miller",
//     //     comment: "Professional service with fair pricing.",
//     //     rating: 4.5,
//     //   ),
//     // ],
//     // workImages: [
//     //   "https://picsum.photos/seed/tnriver_work1/1920/1080",
//     //   "https://picsum.photos/seed/tnriver_work2/1920/1080",
//     //   "https://picsum.photos/seed/tnriver_work3/1920/1080",
//     //   "https://picsum.photos/seed/tnriver_work4/1920/1080",
//     //   "https://picsum.photos/seed/tnriver_work5/1920/1080",
//     //   "https://picsum.photos/seed/tnriver_work6/1920/1080",
//     // ],
//   ),
// ];

// final List<PartnerModel> dummyPartners = [
//   const PartnerModel(
//     id: 'e80be7cf-6ff3-43b3-8076-a78d9541407f',
//     name: 'Visit Knoxville',
//     image:
//         'http://backend-api-dev-4560.up.railway.app/media/relationship_partners/e80be7cf-6ff3-43b3-8076-a78d9541407f/visitCK.jpg',
//     address: '301 S. Gay Street, Knoxville, TN 37902',
//     openingTime:
//         'Mon - Fri 8:30 - 5 pm | Sat: 9:00 am - 5 pm | Sun 12 pm - 4 pm',
//     shortDescription: 'official Convention and Visitors Bureau',
//     description:
//         'Visit Knoxville is the official Convention and Visitors Bureau for Knoxville and Knox County. It\'s our priority to promote Knoxville as a nature-loving-adventure-seeking-artsy-kinda-town. Visit Knoxville (VK) is also home to the VK Sports Commission, the VK Film Office, the downtown Visitors Center, and the Sunsphere Welcome Center (while also operating the Sunsphere Observation Deck). Our mission is to accelerate sustainable economic growth and development by increasing visitor and convention/event business to our community. VK is proud to support community initiatives encompassing art and culture, history, entertainment, and outdoor adventure to promote Knoxville. Follow VK online @VisitKnoxville and learn more on our website.',
//     website: 'visitknoxville.com',
//     phoneNumber: '+1 865-555-0101',
//   ),
//   const PartnerModel(
//     id: '91325c64-73bb-4ae2-8cad-ebc05f16df3d',
//     name: 'Knoxville Business Chamber of Commerce',
//     image: 'https://picsum.photos/seed/partner2_image1/1920/1080',
//     address: '17 Market Square, Knoxville, TN 37902',
//     openingTime: 'Mon - Fri 9:00 AM - 5:00 PM',
//     shortDescription: 'leading business advocacy',
//     description:
//         'The Knoxville Chamber of Commerce is a leading business advocacy organization that supports local entrepreneurs, fosters economic growth, and connects businesses with valuable resources. We provide networking opportunities, professional development programs, and community engagement initiatives. Our mission is to strengthen the Knoxville business landscape through partnerships and innovation.',
//     website: 'knoxvillechamber.com',
//     phoneNumber: '+1 865-555-0102',
//   ),
//   const PartnerModel(
//     id: '2ce6314b-d13d-44df-96ce-87eb8fdb2b85',
//     name: 'Knoxville Museum of Art',
//     image: 'https://picsum.photos/seed/partner3_image1/1920/1080',
//     address: '1050 World’s Fair Park Dr, Knoxville, TN 37916',
//     openingTime: 'Tue - Sat: 10:00 AM - 5:00 PM | Sun: 1:00 PM - 5:00 PM',
//     shortDescription: 'celebrates the rich culture',
//     description:
//         'The Knoxville Museum of Art celebrates the rich, creative culture of East Tennessee by showcasing regional artists, contemporary exhibitions, and permanent collections. The museum provides an inspiring space for education, engagement, and appreciation of visual arts. Admission is free, making it accessible to the entire community.',
//     website: 'knoxart.org',
//     phoneNumber: '+1 865-555-0103',
//   ),
//   const PartnerModel(
//     id: '588c626c-a496-4ede-b166-dbedc0a18875',
//     name: 'Ijams Nature Center',
//     image: 'https://picsum.photos/seed/partner4_image1/1920/1080',
//     address: '2915 Island Home Ave, Knoxville, TN 37920',
//     openingTime: 'Daily: 8:00 AM - Dusk',
//     shortDescription: 'urban wilderness hiking trails',
//     description:
//         'Ijams Nature Center is a 315-acre urban wilderness that offers hiking trails, kayaking, rock climbing, and educational programs focused on environmental conservation. Visitors can explore diverse ecosystems, engage in outdoor recreation, and experience the beauty of East Tennessee’s natural landscapes.',
//     website: 'ijams.org',
//     phoneNumber: '+1 865-555-0104',
//   ),
// ];

// final List<EventModel> dummyEvents = [
//   // 1. Pool Party
//   EventModel(
//     id: "140107ae-b454-4ca2-bcd0-59ca087f05d9",
//     title: "Pool Party",
//     description:
//         "Splash & Groove: The Ultimate Pool Party! 🌊🎶\r\n\r\nGet ready to soak up the sun, dance to the hottest beats, and make waves at the Ultimate Pool Party! Dive into a day filled with cool vibes, refreshing drinks, and non-stop music from top DJs and live performers.\r\n\r\nWhether you’re floating with a cocktail in hand, showing off your best dance moves, or just enjoying the perfect summer atmosphere, this is the party you don’t want to miss! Swimwear, sunglasses, and good vibes are a must!\r\n\r\nLet’s make a splash and party like never before! 💦🔥🎉",
//     startDate: "2025-02-27",
//     endDate: "2025-02-27",
//     status: "published",
//     isFeatured: true,
//     isFavorite: true,
//     address: "123 Riverside Dr, Knoxville, TN 37914",
//     showPrice: true,
//     organizer: "Knoxville Pool Club",
//     startTime: "14:00:00",
//     endTime: "22:00:00",
//     locationName: "Riverwalk Pool Club",
//     phoneNumber: "+1 865-555-7890",
//     websiteUrl: 'www.poolpartyknox.com',
//     category: ["party", "music"],
//     images: [
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/140107ae-b454-4ca2-bcd0-59ca087f05d9/images/pool1.jpg",
//       ),
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/140107ae-b454-4ca2-bcd0-59ca087f05d9/images/pool.jpg",
//       ),
//     ],
//   ),

//   // 2. Summer-Break Party
//   EventModel(
//     id: "622a28e2-07cb-4fd2-8c41-848136db6411",
//     title: "Summer-Break Party",
//     description:
//         "The long-awaited summer break party is finally here! Join us for an unforgettable night filled with music, dancing, and summer vibes.",
//     startDate: "2025-02-27",
//     endDate: "2025-02-27",
//     status: "published",
//     isFeatured: true,
//     isFavorite: true,
//     address: "2500 Kingston Pike, Knoxville, TN 37919",
//     showPrice: true,
//     organizer: "Sunset Event Group",
//     startTime: "20:00:00",
//     endTime: "02:00:00",
//     locationName: "The Rooftop Lounge",
//     phoneNumber: "+1 865-555-4567",
//     websiteUrl: 'www.summerbreakparty.com',
//     category: ["party", "social"],
//     images: [
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/622a28e2-07cb-4fd2-8c41-848136db6411/images/summer.jpg",
//       ),
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/622a28e2-07cb-4fd2-8c41-848136db6411/images/summer1.jpg",
//       ),
//     ],
//   ),

//   // 3. Halloween Concert
//   EventModel(
//     id: "4c012493-7d79-4389-9d04-12792483a4d5",
//     title: "Halloween Concert",
//     description:
//         "Spooky Sounds: The Ultimate Halloween Concert Experience! 🎃👻\r\n\r\nGet ready for a night of haunting melodies and electrifying performances at the Halloween Concert! Step into a world where eerie symphonies meet bone-chilling beats, as talented artists bring the spirit of Halloween to life with thrilling music, spine-tingling effects, and a mesmerizing stage atmosphere.\r\n\r\nDress in your spookiest costumes, dance under the eerie lights, and let the music awaken your Halloween spirit! Whether you're a fan of rock, EDM, or classic Halloween tunes, this concert promises a night of unforgettable chills and thrills.",
//     startDate: "2025-02-28",
//     endDate: "2025-02-28",
//     status: "published",
//     isFeatured: true,
//     isFavorite: false,
//     address: "400 W Jackson Ave, Knoxville, TN 37902",
//     showPrice: true,
//     organizer: "Knoxville Music Fest",
//     startTime: "19:00:00",
//     endTime: "23:59:00",
//     locationName: "The Mill & Mine",
//     phoneNumber: "+1 865-555-1234",
//     websiteUrl: 'www.halloweenconcert.com',
//     category: ["music", "concert"],
//     images: [
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/4c012493-7d79-4389-9d04-12792483a4d5/images/hall.jpg",
//       ),
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/4c012493-7d79-4389-9d04-12792483a4d5/images/hall1.jpg",
//       ),
//     ],
//   ),

//   // 4. Future Sci-Fi
//   EventModel(
//     id: "45e94205-d177-49c7-8f2a-f894dd81a155",
//     title: "Future Sci-Fi",
//     description:
//         "Future Sci-Fi: A Journey Beyond Imagination 🚀✨\r\n\r\nStep into the future with Future Sci-Fi, an immersive event celebrating the limitless possibilities of science fiction. From groundbreaking technologies to visionary storytelling, explore how sci-fi shapes our world and inspires tomorrow’s innovations.\r\n\r\n🔹 What to Expect?\r\n🌌 Cutting-edge discussions on AI, space exploration, and futuristic tech\r\n📽️ Exclusive screenings of sci-fi films and series\r\n🛸 Live demonstrations of next-gen gadgets\r\n📖 Meet renowned sci-fi authors and creators\r\n🎮 Hands-on experiences with VR, AR, and gaming\r\n\r\nJoin us as we bridge the gap between fiction and reality, pushing the boundaries of imagination! 🚀🔭",
//     startDate: "2025-02-28",
//     endDate: "2025-02-28",
//     status: "published",
//     isFeatured: false,
//     isFavorite: true,
//     address: "701 Henley St, Knoxville, TN 37902",
//     showPrice: false,
//     organizer: "Knox Sci-Fi Expo",
//     startTime: "10:00:00",
//     endTime: "18:00:00",
//     locationName: "Knoxville Convention Center",
//     phoneNumber: "+1 865-555-8523",
//     websiteUrl: 'www.futurescifi.com',
//     category: ["technology", "expo"],
//     images: [
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/45e94205-d177-49c7-8f2a-f894dd81a155/images/scifi1.jpg",
//       ),
//       ImageModel(
//         image:
//             "http://backend-api-dev-4560.up.railway.app/media/event/45e94205-d177-49c7-8f2a-f894dd81a155/images/scifi2.jpg",
//       ),
//     ],
//   ),
// ];

// // final List<OfferModel> dummyOffers = List.generate(
// //   10,
// //   (index) => OfferModel(
// //     image: 'https://picsum.photos/seed/offer${index + 1}/1920/1080',
// //     name: 'Offer ${index + 1}',
// //   ),
// // );

// final List<AnnouncementModel> dummyAnnouncements = List.generate(
//   5,
//   (index) => AnnouncementModel(
//     id: 'announcement${index + 1}',
//     title: 'Announcement Title ${index + 1}',
//     image: 'https://picsum.photos/seed/announcement${index + 1}/1920/1080',
//     description: 'This is a description for announcement ${index + 1}.',
//     createdDt: DateTime.now().subtract(Duration(days: index * 2)),
//   ),
// );

// const List<Category> dummyBusinessesCategories = [
//   Category(
//     id: "f07d11a0-97c3-4907-9250-2e04356f2fec",
//     name: "General Home Maintenance & Repairs",
//     subcategories: [
//       Category(
//         id: "467395cc-4cec-4adc-bcbf-61f65e883640",
//         name: "Appliance Repair",
//       ),
//       Category(
//         id: "5c8c32ce-2d10-4098-b7f2-cbf6cb95a8f6",
//         name: "Electrical Services",
//       ),
//       Category(
//         id: "b0ae3bad-2e9a-46cc-9bb0-8b94461d91aa",
//         name: "HVAC",
//       ),
//       Category(
//         id: "91a0f3d9-55a8-44a7-b819-7231968b662b",
//         name: "Maintenance & Repairs",
//       ),
//       Category(
//         id: "8f81428b-7f59-44a1-b696-0383f5629eb8",
//         name: "Plumbing Services",
//       ),
//       Category(
//         id: "d984dcb6-e42e-4ec0-840f-4087c424c2f5",
//         name: "Roofing Repairs & Replacement",
//       ),
//       Category(
//         id: "942f6fc6-ba5a-4677-a779-98ee103b5845",
//         name: "Siding Repair & Installation",
//       ),
//     ],
//   ),
//   Category(
//     id: "1c3bea52-4604-43c5-b588-b4e79b719f2e",
//     name: "Interior Home Services",
//     subcategories: [
//       Category(
//         id: "502165c5-ebea-43e1-8601-59dd78590e94",
//         name: "Cabinet Refacing & Installation",
//       ),
//       Category(
//         id: "677db99d-659b-4e69-a71f-1f3c2e3095ef",
//         name: "Closets & Storage Solutions",
//       ),
//       Category(
//         id: "a6195535-1ba4-4597-9b19-283d8e08e9ad",
//         name: "Flooring Installation & Repair",
//       ),
//       Category(
//         id: "ab06dc5c-2970-4f03-8378-22f9bf6f36bc",
//         name: "Interior Design",
//       ),
//       Category(
//         id: "6d755e6f-4cef-4ab6-883e-4a0c86110bf1",
//         name: "Kitchen & Bathroom Remodeling",
//       ),
//       Category(
//         id: "f9ea887d-6740-424f-9f6a-d595643d8479",
//         name: "Painting & Wallpapering",
//       ),
//       Category(
//         id: "9b28dc9f-d089-42a9-8a6e-97f1b112cbbc",
//         name: "Smart Home Automation Installation",
//       ),
//       Category(
//         id: "4270a69f-92ac-40ee-8e00-fa4da03539f7",
//         name: "Window & Door Replacement",
//       ),
//     ],
//   ),
//   Category(
//     id: "cd6e36e5-ddca-4ff4-878e-95bfb1aaf267",
//     name: "Outdoor Home Services",
//     subcategories: [
//       Category(
//         id: "b4e6644f-41e8-462d-bc63-42764c98f022",
//         name: "Deck & Patio Construction & Maintenance",
//       ),
//       Category(
//         id: "4c67c5a2-560f-4433-95f3-9d66101e5e85",
//         name: "Fence Installation & Repair",
//       ),
//       Category(
//         id: "a2feaa64-9836-4145-9962-ef4b855f1605",
//         name: "Garden Landscaping & Design",
//       ),
//       Category(
//         id: "554a0250-9c1c-49b7-a35f-3b32c61c9e4c",
//         name: "Lawn Care & Maintenance",
//       ),
//       Category(
//         id: "3593a4be-346e-48ab-9263-a4be4b1716ef",
//         name: "Outdoor Lighting Installation",
//       ),
//       Category(
//         id: "653a704e-cdde-4630-a121-087fc19f4119",
//         name: "Sprinkler System Installation & Repair",
//       ),
//       Category(
//         id: "50fa813d-4295-47a0-a108-1f4d2a6bde2c",
//         name: "Swimming Pool Maintenance & Repair",
//       ),
//       Category(
//         id: "9d389989-5220-40cc-a41c-f24723c456f0",
//         name: "Tree Trimming & Removal",
//       ),
//     ],
//   ),
//   Category(
//     id: "1efbb375-5a32-4db7-b87c-927394d86a6d",
//     name: "Moving & Storage",
//     subcategories: [
//       Category(
//         id: "4530734a-8ff7-4378-8888-86a3c2d88fef",
//         name: "Dumpster Rental",
//       ),
//       Category(
//         id: "24b409a1-9fb8-4ca1-818a-3b0555bb4d99",
//         name: "Foundation Repair",
//       ),
//       Category(
//         id: "0f69d215-37e2-4aa2-a72c-279f6b4e1ac7",
//         name: "Garage Door Repair & Installation",
//       ),
//       Category(
//         id: "92a66541-bef8-4501-9c5c-4bb47a368baf",
//         name: "Moving Services",
//       ),
//       Category(
//         id: "32b7eb73-e42d-4ef8-830c-89960ca709db",
//         name: "Septic Tank Inspection & Pumping",
//       ),
//       Category(
//         id: "3e7b25ea-e984-4b6a-a668-38b3ed3869f4",
//         name: "Water Softening & Filtration Systems",
//       ),
//     ],
//   ),
//   Category(
//     id: "84799219-9933-49e8-9a04-9b5f9acac6cf",
//     name: "Cleaning & Waste Management",
//     subcategories: [
//       Category(
//         id: "b99189c0-04ff-4abd-a5f9-fcd21dada1df",
//         name: "Carpet & Upholstery Cleaning",
//       ),
//       Category(
//         id: "2bc1d739-8b40-4b00-af4a-69606756a393",
//         name: "Chimney Cleaning & Repair",
//       ),
//       Category(
//         id: "3556be13-ea7e-4815-aa10-e56d8b2781da",
//         name: "Dryer Vent Cleaning",
//       ),
//       Category(
//         id: "2ff2a0cf-66d0-4d0f-9142-d58102223692",
//         name: "Gutter Cleaning & Repair",
//       ),
//       Category(
//         id: "4394eab6-7977-4040-9326-c8449c112c51",
//         name: "House Cleaning Services",
//       ),
//       Category(
//         id: "bb929b53-2a3e-4111-b261-d718aad29c6c",
//         name: "Junk Removal",
//       ),
//       Category(
//         id: "5406de32-2bab-4bc4-9246-acd8b9b5cc9a",
//         name: "Window Cleaning & Pressure Washing",
//       ),
//     ],
//   ),
//   Category(
//     id: "2d1d0c3e-f8a6-4e0e-8286-17cff3df85f5",
//     name: "Home Safety & Security",
//     subcategories: [
//       Category(
//         id: "6e72eb83-0b4b-4552-8967-52189a05240a",
//         name: "Fire Extinguisher Inspection & Recharging",
//       ),
//       Category(
//         id: "a32c3f25-e547-40cb-be4c-345b50a454bb",
//         name: "Home Security System Installation & Monitoring",
//       ),
//       Category(
//         id: "9124e651-e338-46f7-826a-b08b982414a3",
//         name: "Locksmith Services",
//       ),
//     ],
//   ),
//   Category(
//     id: "6ae65ee3-3aef-41e3-82cb-ac88249d7f25",
//     name: "Specialty Installations & Services",
//     subcategories: [
//       Category(
//         id: "3e14dfc5-814d-47ca-8dfe-6819b7dea990",
//         name: "Home Theater Installation",
//       ),
//     ],
//   ),
// ];

// final dummyResponses = [
//   QuoteResponse(
//     id: '9cad0caa-ccbc-43ec-868f-11dbd266cd55',
//     question: QuoteQuestion(
//       id: 'fc626628-1c1b-4553-abe9-6370bb63d8ee',
//       questionText: 'Explain about something',
//       questionType: 'text',
//     ),
//     textResponse: 'explain 1',
//     selectedOptions: [],
//     attachments: [],
//   ),
//   QuoteResponse(
//     id: '7aadc06c-85fa-499a-902f-2f3b40fe98fe',
//     question: QuoteQuestion(
//       id: '4633e2cc-61a3-4567-b497-186e41022642',
//       questionText: 'photos',
//       questionType: 'attachment',
//     ),
//     textResponse: null,
//     selectedOptions: [],
//     attachments: [],
//   ),
// ];

// final dummyQuotes = [
//   QuoteModel(
//     id: 'quote1',
//     user: QuoteUser(
//       id: 'user1',
//       fullName: 'Michael Anderson',
//       email: 'michael.anderson@example.com',
//     ),
//     business: QuoteBusiness(
//       id: 'business1',
//       name: 'Anderson Renovations',
//       address: '1234 Elm Street, Knoxville, TN 37901',
//       logo: 'https://picsum.photos/seed/anderson_logo/200/200',
//     ),
//     offer: QuoteOffer(
//       id: 'offer1',
//       title: 'Bathroom Remodeling',
//     ),
//     projectTitle: 'Luxury Bathroom Remodel',
//     projectLocation: '1234 Elm Street, Knoxville, TN 37901',
//     status: 'approved',
//     createdAt: DateTime.now().subtract(const Duration(days: 3)),
//     updatedAt: DateTime.now().subtract(const Duration(days: 1)),
//     responses: dummyResponses,
//   ),
//   QuoteModel(
//     id: 'quote2',
//     user: QuoteUser(
//       id: 'user2',
//       fullName: 'Samantha Lee',
//       email: 'samantha.lee@example.com',
//     ),
//     business: QuoteBusiness(
//       id: 'business2',
//       name: 'Lee Construction',
//       address: '5678 Oak Avenue, Knoxville, TN 37902',
//       logo: 'https://picsum.photos/seed/lee_logo/200/200',
//     ),
//     offer: QuoteOffer(
//       id: 'offer2',
//       title: 'Kitchen Upgrade',
//     ),
//     projectTitle: 'Modern Kitchen Renovation',
//     projectLocation: '5678 Oak Avenue, Knoxville, TN 37902',
//     status: 'pending',
//     createdAt: DateTime.now().subtract(const Duration(days: 5)),
//     updatedAt: DateTime.now().subtract(const Duration(days: 2)),
//     responses: dummyResponses,
//   ),
//   QuoteModel(
//     id: 'quote3',
//     user: QuoteUser(
//       id: 'user3',
//       fullName: 'Robert Garcia',
//       email: 'robert.garcia@example.com',
//     ),
//     business: QuoteBusiness(
//       id: 'business3',
//       name: 'Garcia Interiors',
//       address: '910 Pine Road, Knoxville, TN 37903',
//       logo: 'https://picsum.photos/seed/garcia_logo/200/200',
//     ),
//     offer: QuoteOffer(
//       id: 'offer3',
//       title: 'Living Room Redesign',
//     ),
//     projectTitle: 'Cozy Living Room Makeover',
//     projectLocation: '910 Pine Road, Knoxville, TN 37903',
//     status: 'new',
//     createdAt: DateTime.now().subtract(const Duration(days: 2)),
//     updatedAt: DateTime.now().subtract(const Duration(hours: 12)),
//     responses: dummyResponses,
//   ),
// ];

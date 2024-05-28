
import 'package:flutter/material.dart';
import 'package:mobileapp/model/post_model.dart';
import 'package:mobileapp/pages/post_data.dart';
import 'package:mobileapp/services/api_service.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   bool isApiCallProcess = false;
@override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	appBar: AppBar(
		title: Text("Green_Jobs",style: TextStyle(
      color: Colors.white
    ),),
    
		backgroundColor: Colors.green,
    
	),
	body: ProgressHUD(
        child: loadProducts(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
	drawer: Drawer(
		child: ListView(
		padding: EdgeInsets.zero,
		children: [
			const DrawerHeader(
			decoration: BoxDecoration(
				color: Colors.green,
			),
			child: Text(
				'Jobseeker name',
				style: TextStyle(fontSize: 20),
			),
			),
			ListTile(
			leading: Icon(Icons.person),
			title: const Text(' My Profile '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.filter_alt_outlined),
			title: const Text(' Fulter job categories '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.schedule_sharp),
			title: const Text(' Schedules '),
			onTap: () {
				Navigator.pop(context);
			},

			),
			ListTile(
			leading: Icon(Icons.logout),
			title: const Text('Logout'),
			onTap: () {
				
			},
			),
		],
		),
	),
	);
  }
}


  Widget loadProducts() {
    return FutureBuilder(
      future: APIService.getPost(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<PostModel>?> model,
      ) {
        if (model.hasData) {
          return postList(model.data);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget postList(post) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.white, backgroundColor: Colors.green,
              //     minimumSize: const Size(88, 36),
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.pushNamed(
              //       context,
              //       '/add-product',
              //     );
              //   },
              //   child: const Text('Add Product'),
              // ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return AddPost(
                    model: post[index],
                    onDelete: (PostModel model) {
                      // setState(() {
                      //   isApiCallProcess = true;
                      // });

                      // APIService.deleteProduct(model.id).then(
                      //   (response) {
                      //     setState(() {
                      //       isApiCallProcess = false;
                      //     });
                      //   },
                      // );
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }







import 'package:flutter/material.dart';

class EditMembersPage extends StatelessWidget {
  const EditMembersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Edit group members")),
      floatingActionButton: SizedBox(
        width: screenSize.width / 6 * 5,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.red[700],
          onPressed: () {},
          label: const Text("Delete"),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Center(child: Text("Group Title")),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Text("This is the description of the group members")),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add new friend"),
            ),
            SizedBox(
              height: (screenSize.height / 3) * 2,
              child: ListView(
                children: [
                  //TODO: make friends removeable and an option to make them admin
                  ListTile(
                    title: const Text("Asad ullah "),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  ListTile(
                    title: const Text("Asad ullah "),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  ListTile(
                    title: const Text("Asad ullah "),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  ListTile(
                    title: const Text("Asad ullah "),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  ListTile(
                    title: const Text("Asad ullah "),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  ListTile(
                    title: const Text("Asad ullah "),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

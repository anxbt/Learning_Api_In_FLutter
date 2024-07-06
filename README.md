### Code Explanation

#### HTTP Request and Response Handling

The `fetchUser` function is responsible for making the HTTP GET request to the Random User API and parsing the JSON response.

Dart

```
Future<void> fetchUser() async {
  const url = "https://randomuser.me/api/?results=30";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);

  setState(() {
    users = json["results"];
  });
}

```




-   **Making the Request:** The `http.get(uri)` function sends the HTTP GET request.
-   **Parsing the Response:** The `jsonDecode(body)` function converts the JSON string response into a `Map<String, dynamic>`.
-   **Updating the State:** The `setState` function updates the `users` list with the fetched data, which triggers a rebuild of the UI.

#### Updating State

The `users` list is a state variable that holds the user data. When `fetchUser` updates this list, the `setState` function ensures the UI is rebuilt to reflect the new data.

Dart

```
List<dynamic> users = [];

```

Use code [with caution.](/faq#coding)

content_copy

#### Accessing and Displaying Data

The `ListView.builder` widget builds the list of user profiles dynamically. The `itemBuilder` function is called for each item in the list, providing the context and index.

Dart

```
ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: users.length,
  itemBuilder: (context, index) {
    final user = users[index];
    final name = user['name']['first'];
    final title = user['name']['last'];
    final email = user['email'];
    final imageUrl = user['picture']['thumbnail'];

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(imageUrl),
      ),
      title: Text(name + " " + title),
      subtitle: Text(email),
    );
  },
)

```

Use code [with caution.](/faq#coding)

content_copy

-   **Fetching User Data:** `final user = users[index];` retrieves the user data at the specified index.
-   **Extracting User Information:** The `name`, `title`, `email`, and `imageUrl` variables extract specific user information from the user data.
-   **Displaying User Information:** The `ListTile` widget displays the user's profile picture, name, and email.

### Dependencies

This project uses the following dependencies:

-   `http`: For making HTTP requests.
-   `flutter`: The Flutter SDK.

To add these dependencies, ensure your `pubspec.yaml` includes:

### Help and Support

If you have any doubts or need further assistance, feel free to go to the Discussion tab and ask your questions. We're here to help!git branch -D master
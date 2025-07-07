# Waracle Tech Test - Flutter :technologist:

Thanks for applying to Waracle! The purpose of this test is to assess your skills and understanding of the Dart programming language, Flutter development and software engineering practices.

The provided a Flutter project is a prototype of a simple app to display a list of cakes with thumbnail images. When a cake is selected, a detail view is shown with a large image.

Unfortunately the prototype has a number of bugs and issues, and also is not particularly well engineered! Your task is to fix and refactor the app to address these concerns, and also add a pull-to-refresh feature that looks right on each platform.

### Minimum Requirements

- Layout issues should be fixed and the UI should adapt well to different phone sizes (don’t worry about tablet form factors!)
- UI interaction should be smooth and app should not stutter
- App should be performant and work reliably without crashing
- At least devices running the last 3 version of iOS and or Android should be supported
- You should add "pull to refresh" support to the app - i.e. when the main list is pulled down, the standard pull to refresh control for the platform should be shown and the JSON reloaded from the network.

### What we are looking for

In addition to the above requirements above you should:

- Improve the quality of the code / architecture
- Demonstrate good software engineering practice
- Update and fill out the file NOTES.md

### Please also:

- Use the latest non-beta version of Flutter that is available at the time of completing the test and document which version is used in NOTES.md
- Do NOT use any third party libraries, but feel free to suggest any that you might have used in your NOTES.md file.

### Submission process

Provide your final submission as a Zip file via email, including your .git folder to preserve any git history
If you fork the repository, please ensure your fork is private and not visible to other potential candidates.
You may change, rewrite, adapt and improve as much of the app as you like within the constraints above. There is no one right solution, so feel free to impress us!

There is no limit to how long you can take to complete the test, however we suggest it should take around 3 hours. We are not looking for perfection, so feel free to suggest a list of things you would add or improve if you had more time in your NOTES.md file.

---

# Notes by Hafiz

- Flutter version used: Stable channel version **3.32.5**
- Java version: **21.0.6**
- Gradle version: **8.5**

### App issues found and applicable fixes

- Issue: The auto generated 'app_localizations.dart' file is missing and its import path is broken in _app.dart_, therefore the app will not compile.
  Fix: Ran `flutter pub get` command and fixed the package import path in _app.dart_.

- Issue: No error handling for image network requests in cake list view, will cause crashes and poor UX.
  Fix: Add error handling for image network requests, show fallback image if needed.

- Issue: Cake image param is being forced unwrapped `!` in `CircleAvatar` widget in cake list view.
  Fix: Use null-aware operator `??` to provide a default value `''` as the image URL, which will trigger the error builder and show the fallback image.

- Issue: Cake images in cake list view are not clipped correctly in the `CircleAvatar` widget.
  Fix: Use `foregroundImage` and `backgroundImage` params in `CircleAvatar` to show network image and fallback image respectively.

- Issue: From cake list view, static arguments are being passed to the cake details view, cake image is missing as well for the arguments.
  Fix: In list view - pass the respective `Cake` object arguments to the details view (make the arguments dynamic). In details view - add `Image.network` widget to show the cake's image, refactor `Center` widget to be parent of `Column` widget.

- Issue: In cake details view, the `Column` can overflow if the content is extending past the screen height.
  Fix: Add `SingleChildScrollView` widget to enable scrolling when the content is more than the screen height. Also add `SafeArea` widget to avoid overlapping the operating system's UI elements.

- Issue: In settings view, the last `DropdownMenuItem` was wrongly assigned value `ThemeMode.light` instead of `ThemeMode.dark`. 
  Fix: Update the menu items list to use a `switch-case` statement, so that all the `ThemeMode` enums are exhaustively matched. If not, a compile error will occur signalling an issue.

- Issue: Feature is in a single directory with no separation (e.g. models, views, controller), data fetch is happening on the presentation layer. Harder to scale and maintain.
  Fix: Consolidated codes/files into a structured directory (API, data, domain, presentation layers).

- Issue: Unnecessary 2-second wait in the API data fetch.
  Fix: Remove the 2-second wait, since the `async-await` combo is already there to handle asychronous code.

- Issue: Stateful widget for the cake list view can be replaced with a stateless widget.
  Fix: Replace with a stateless widget, use `ValueNotifier` to listen to changes to the cakes list.



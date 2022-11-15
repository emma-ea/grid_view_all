# grid_view_all

Demonstrating View all in Grid or Any List View

## Procedure

I wanted to experiment with how to implement "view all" in app ui.


Normally a user is presented with a list or grid list of items. there is also a button
to click to expand all items in the list.


To implement this, the initial idea I had was to have two separate lists, one with the 
default size of length of items. The other with all the remaining items to present to a user when the user
taps the "click to view all" button.


Eventhough this worked well, having two list items. you just need to add/append the extra list of items to the
default. and when the user clicks to shrink the list. you take the extra added out. the only issue is with the constant swapping of lists.


To the next idea was to have all the list of items but control how many items are being displayed by 
controlling the length of the items being passed to the listview. This next iteration not only avoids 
creating another list of items which wastes memory. you only have one list of items but this time we control the length
anytime the user clicks on "view all".



## Getting Started with Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

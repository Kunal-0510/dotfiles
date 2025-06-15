
For task it will have lists where you can put tasks for that list. for example a subject, shopping etc. you can make a list smart list by having special filters.

smart filters -> will search based on date, priority or tags

boards -> can contain plain text, lists and tasks , similar to have short notes along with tasks
	sections -> can make sections inside board to further segregate work
Projects -> It can have text and tasks both and tracks the progress by tracking the %tasks done. we can also make sections in this. to section out progress as well.


## Task Flow Checklist

-  Create `todo_core` library crate with all data types and logic.
    
-  Refactor CLI to call into `todo_core`.
    
-  Add unit tests in `todo_core`.
    
-  Choose UI stack for Android (Flutter + FRB) and Linux (e.g. GTK/Slint).
    
-  Configure build for Android: compile Rust to `.so`, integrate into Flutter.
    
-  Develop Linux desktop front end calling into `todo_core`.
    
-  Implement UI screens (list view, add/edit, status toggle).
    
-  Style according to modern guidelines (Material for Flutter, native themes for GTK).
    
-  Bundle and deploy: APK with embedded Rust for Android; binary/AppImage for Linux.
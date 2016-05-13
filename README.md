# Final Project Milestone \#1

This project is an party planning app for families or small groups of friends who are all pitching in to make the event happen.
## Resources

### Guests
The app will have the ability to invite Guests through use of email or text message, and track their response either through text message or use of the online app. If the Guest chooses to create a User account (or already has one), they can log in or create a username and password to associate their User account with their Guest status. Users and Guests have a one-to-one relationship.

### Invitations
Invitations will track the many-to-many relationship between Guests and Events.

### Events
Events can be created by a User, and possess a title, date, an image, and Event details, as well as a budget to compare to Supplies.

### Lists
Lists are to-do lists of Tasks (see next) for a specific event. The User who has created the Event can assign Guests to help with certain to-do Tasks, or invite Guests to choose which Tasks they would like to volunteer for.

### Tasks
Tasks are associated with a single List (which is associated with a single Event). They can have a due date, a tag (to group similar tasks), a Guest who is assigned to the Task, and can keep track of whether the Task has been completed.

### Supplies
Supplies are items needed to make the Event happen. They can have a title, a price, and the id of a guest that they are assigned to, plus a link to an outside site to purchase. They also keep track of whether or not they have been purchased.

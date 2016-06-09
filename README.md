# Final Project Milestone \#1

This project is an party planning app for families or small groups of friends who are all pitching in to make the event happen.

**NOTICE**: This app functions through the use of Twilio SMS/phone services. In order to run the app locally with its full functionality, environment variables must be set in the same terminal window that 'rails server' is run from. Please contact Alex for the environment variables (or find them in the private note on Piazza).

The finished app is deployed here: https://limitless-plains-54750.herokuapp.com/

You can create a new account/events/etc. from scratch, or login with one of the predefined accounts from the seed file.

## Resources

### Guests
The app has the ability to invite Guests through use of text message, and track their response through text message reply.

### Invitations
Invitations will track the many-to-many relationship between Guests and Events. When a new guest is created, an event must be chosen, and this creates an Invitation. When an Invitation is created, the invitee receives an SMS invitation, to which they can reply to RSVP.

### Events
Events can be created by a User, and possess a title, date, an image, and Event details, as well as a budget.

### Lists
Lists are to-do lists of Tasks (see next) for a specific event. The User who has created the Event can assign Guests to help with certain to-do Tasks, and "nudge" them to remind them of the task.

### Tasks
Tasks are associated with a single List (which is associated with a single Event). They can have a due date, a tag (to group similar tasks), a Guest who is assigned to the Task, and can keep track of whether the Task has been completed. The user can also nudge the guest to remind them to do the task, which results in an SMS reminder.

### Supplies
Supplies are items needed to make the Event happen. They can have a title, a price, and the id of a guest that they are assigned to, plus a link to an outside site to purchase. They also keep track of whether or not they have been purchased. The user can nudge the guest to remind them to purchase the supply, which results in an SMS reminder.

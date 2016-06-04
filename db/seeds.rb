Guest.delete_all
Invitation.delete_all
Event.delete_all
List.delete_all
Task.delete_all
Supply.delete_all
User.delete_all

egon = Guest.create(:first_name => "Egon", :last_name => "Spengler", :email => "espengler@example.org", :phone => "7153182885")
ian = Guest.create(:first_name => "Ian", :last_name => "Malcolm", :email => "imalcolm@example.org", :phone => "7153182885")
lloyd = Guest.create(:first_name => "Lloyd", :last_name => "Dobler", :email => "ldobler@example.org", :phone => "7153182885")
rick = Guest.create(:first_name => "Rick", :last_name => "Deckard", :email => "rdeckard@example.org", :phone => "7153182885")
chris = Guest.create(:first_name => "Chris", :last_name => "Knight", :email => "cknight@example.org", :phone => "7153182885")

ellen = Guest.create(:first_name => "Ellen", :last_name => "Ripley", :email => "eripley@example.org", :phone => "7153182885")
joan = Guest.create(:first_name => "Joan", :last_name => "Lambert", :email => "jlambert@example.org", :phone => "7153182885")
samuel = Guest.create(:first_name => "Samuel", :last_name => "Brett", :email => "sbrett@example.org", :phone => "7153182885")
gilbert = Guest.create(:first_name => "Gilbert", :last_name => "Kane", :email => "gkane@example.org", :phone => "7153182885")
dennis = Guest.create(:first_name => "Dennis", :last_name => "Parker", :email => "dparker@example.org", :phone => "7153182885")

honey = Guest.create(:first_name => "Honey", :last_name => "Ryder", :email => "hryder@example.org", :phone => "7153182885")
kissy = Guest.create(:first_name => "Kissy", :last_name => "Suzuki", :email => "ksuzuki@example.org", :phone => "7153182885")
xenia = Guest.create(:first_name => "Xenia", :last_name => "Onatopp", :email => "xonatopp@example.org", :phone => "7153182885")
vesper = Guest.create(:first_name => "Vesper", :last_name => "Lynd", :email => "vlynd@example.org", :phone => "7153182885")
may = Guest.create(:first_name => "May", :last_name => "Day", :email => "mday@example.org", :phone => "7153182885")

pyjama_party = Event.new
pyjama_party.title = "Pyjama Party"
pyjama_party.date = "12-31-1989"
pyjama_party.details = "A pyjama party for the turn of the decade!"
pyjama_party.image_url = ""
pyjama_party.budget = "50"
pyjama_party.save

class_reunion = Event.new
class_reunion.title = "Class Reunion"
class_reunion.date = "08-01-2132"
class_reunion.details = "Getting the old crew back together!"
class_reunion.image_url = ""
class_reunion.budget = "6000"
class_reunion.save

networking_brunch = Event.new
networking_brunch.title = "Networking Brunch"
networking_brunch.date = "07-07-2017"
networking_brunch.details = "Trade secrets. Mutual connections. Bottomless mimosas."
networking_brunch.image_url = ""
networking_brunch.budget = nil
networking_brunch.save

Invitation.create(guest_id: egon.id, event_id: pyjama_party.id, RSVP: true, attending: true)
Invitation.create(guest_id: ian.id, event_id: pyjama_party.id, RSVP: true, attending: true)
Invitation.create(guest_id: lloyd.id, event_id: pyjama_party.id, RSVP: true, attending: true)
Invitation.create(guest_id: rick.id, event_id: pyjama_party.id, RSVP: true, attending: true)
Invitation.create(guest_id: chris.id, event_id: pyjama_party.id, RSVP: true, attending: true)

Invitation.create(guest_id: ellen.id, event_id: class_reunion.id, RSVP: true, attending: true)
Invitation.create(guest_id: joan.id, event_id: class_reunion.id, RSVP: true, attending: true)
Invitation.create(guest_id: samuel.id, event_id: class_reunion.id, RSVP: true, attending: true)
Invitation.create(guest_id: gilbert.id, event_id: class_reunion.id, RSVP: true, attending: true)
Invitation.create(guest_id: dennis.id, event_id: class_reunion.id, RSVP: true, attending: true)

Invitation.create(guest_id: honey.id, event_id: networking_brunch.id, RSVP: true, attending: true)
Invitation.create(guest_id: kissy.id, event_id: networking_brunch.id, RSVP: true, attending: true)
Invitation.create(guest_id: xenia.id, event_id: networking_brunch.id, RSVP: true, attending: true)
Invitation.create(guest_id: vesper.id, event_id: networking_brunch.id, RSVP: true, attending: true)
Invitation.create(guest_id: may.id, event_id: networking_brunch.id, RSVP: true, attending: true)

List.create(title: "Pyjama Party To-do", event_id: pyjama_party.id)
List.create(title: "Class Reunion Planning", event_id: class_reunion.id)
List.create(title: "Networking Brunch Milestones", event_id: networking_brunch.id)

Task.create(list_id: pyjama_party.id, item: "ask everyone to vote on movies", due_date: nil, tag: "movies", user_id: nil, completed: false, completed_date: nil)
Task.create(list_id: pyjama_party.id, item: "rent movies", due_date: nil, tag: "movies", user_id: nil, completed: false, completed_date: nil)
Task.create(list_id: pyjama_party.id, item: "borrow mom's Betamax player", due_date: nil, tag: "snacks", user_id: chris.id, completed: false, completed_date: nil)

Task.create(list_id: class_reunion.id, item: "rent venue", due_date: nil, tag: "venue", user_id: nil, completed: false, completed_date: nil)

Task.create(list_id: networking_brunch.id, item: "reserve restaurant back room", due_date: nil, tag: "venue", user_id: nil, completed: false, completed_date: nil)
Task.create(list_id: networking_brunch.id, item: "vet everyone's dietary preferences", due_date: nil, tag: nil, user_id: nil, completed: false, completed_date: nil)

Supply.create(event_id: pyjama_party.id, title: "microwave popcorn (2 boxes)", quantity: nil, price: 10, user_id: nil, purchase_url: nil, purchased: true)
Supply.create(event_id: pyjama_party.id, title: "plates & bowls (large box)", quantity: 1, price: nil, user_id: chris.id, purchase_url: nil, purchased: false)

Supply.create(event_id: class_reunion.id, title: "printed fliers", quantity: 35, price: 10, user_id: nil, purchase_url: nil, purchased: true)

Supply.create(event_id: networking_brunch.id, title: "orange juice", quantity: 5, price: 10, user_id: nil, purchase_url: nil, purchased: true)
Supply.create(event_id: networking_brunch.id, title: "champagne", quantity: 5, price: 200, user_id: nil, purchase_url: nil, purchased: false)
Supply.create(event_id: networking_brunch.id, title: "branded business card holders", quantity: 10, price: 100, user_id: nil, purchase_url: nil, purchased: false)
Supply.create(event_id: networking_brunch.id, title: "name tags", quantity: 10, price: 30, user_id: nil, purchase_url: nil, purchased: true)

User.create username: "imalcolm", email: "imalcolm@example.org", guest_id: ian.id, password: "lifefindsaway",  password_confirmation: "lifefindsaway"
User.create username: "eripley", email: "eripley@example.org", guest_id: ellen.id, password: "noonecanhearyou",  password_confirmation: "noonecanhearyou"
User.create username: "mday", email: "mday@example.org", guest_id: may.id, password: "whataview",  password_confirmation: "whataview"

print "There are now #{Guest.count} guests in the database.\n"
print "There are now #{Invitation.count} invitations in the database.\n"
print "There are now #{Event.count} events in the database.\n"
print "There are now #{List.count} lists in the database.\n"
print "There are now #{Task.count} tasks in the database.\n"
print "There are now #{Supply.count} supplies in the database.\n"
print "There are now #{User.count} users in the database.\n"

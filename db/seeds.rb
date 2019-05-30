Participation.destroy_all
Challenge.destroy_all
User.destroy_all

puts "Creating some users, challenges and participations..."

loic = User.new(email: "loic@trashtag.pro", first_name: "loic", last_name: "Lead", description: "25 ans, aime sa petite Caroline (tortue), Marmande", password: "azerty")
loic.save

kevin = User.new(email: "kevin@trashtag.pro", first_name: "kevin", last_name: "Stark", description: "43 ans, adore le vélo 🚲 , Bordeaux", password: "azerty")
kevin.save

justine = User.new(email: "justine@trashtag.pro", first_name: "justine", last_name: "Jackson", description: "28 ans, en couple, Bordeaux", password: "azerty")
justine.save

tristan = User.new(email: "tristan@trashtag.pro", first_name: "tristan", last_name: "Bouteille", description: "32 ans, aime les sushis 🍣 Bordeaux", password: "azerty")
tristan.save


lacanau = Challenge.new(title: "Justine's challenge", place: 'Lacanau', date:"2019-07-07 07:07:07")
lacanau.remote_photo_url = 'http://rue89bordeaux.com/wp-content/uploads/2014/08/surfrider2.png'
lacanau.user = justine
lacanau.save

arcachon = Challenge.new(title: "Loïc's challenge", place: 'Arcachon', date:"2019-10-30 10:00:01", user: loic)
arcachon.remote_photo_url = 'https://images.sudouest.fr/2018/10/25/5bd1fff766a4bd825e6a491f/widescreen/1000x500/des-galettes-sont-presentes-sur-49-plages-du-departement.jpg?v1'
arcachon.user = loic
arcachon.save

tarnos = Challenge.new(title: "Tristan's challenge", place: 'Tarnos', date:"2019-11-22 14:06:00", user: tristan)
tarnos.remote_photo_url = 'https://www.francetvinfo.fr/image/750buu13x-2e9d/1200/450/3528877.jpg'
tarnos.user = tristan
tarnos.save

guéthary = Challenge.new(title: "Kévin's challenge", place: 'Guéthary', date:"2020-01-05 17:30:00", user: kevin)
guéthary.remote_photo_url = 'http://www.amisdelaterre40.fr/spip/IMG/jpg/Contis_-_enfant_sur_la_plage.jpg'
guéthary.user = kevin
guéthary.save

Participation.new(user: kevin, challenge: arcachon).save
Participation.new(user: tristan, challenge: arcachon).save
Participation.new(user: justine, challenge: arcachon).save

Participation.new(user: kevin, challenge: lacanau).save
Participation.new(user: tristan, challenge: lacanau).save

puts "Done ! Let's test your app..."

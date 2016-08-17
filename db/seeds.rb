health = Category.create(title: "Health & Beauty")
kitchen = Category.create(title: "Kitchen")
cleaning = Category.create(title: 'Cleaning')
bathroom = Category.create(title: 'Bathroom')
entertainment = Category.create(title: 'Entertainment')
outdoors = Category.create(title: 'Outdoors')
date = "2014-09-18 12:30:59 -0700"

jt = Venue.create(
name: 'Justin Timberlake',
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
jtt = Venue.create(
name: 'Jonathan Taylor Thomas',
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
attenborough = Venue.create(
name: 'Sir David Attenborough',
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
hulk = Venue.create(
name: "Hulk Hogan",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
christopher = Venue.create(
name: "Christopher Walken",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
gary = Venue.create(
name: "Gary Busey",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
cyndi = Venue.create(
name: "Cyndi Lauper",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
chris = Venue.create(
name: "Chris Farley",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
flavor = Venue.create(
name: "Flavor Flave",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
vin = Venue.create(
name: "Vin Diesel",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
tom = Venue.create(
name: "Tom Hanks",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
leo = Venue.create(
name: "Leonardo Dicaprio",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
arnold = Venue.create(
name: "Arnold Schwarzenegger",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
charlie = Venue.create(
name: "Charlie Sheen",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))
britney = Venue.create(
name: "Britney Spears",
city: 'Denver',
state: 'CO',
capacity: rand(100..1000))

Event.create(
  title: 'Broken Swiffer',
  description: "When times are tough and you're cleaning your own home,\
  it's easy to imagine the frustration that arises when your trusty \
  Swiffer finally scrubs its last floor. But with great frustration \
  comes great perspiration, and JTT's sweat on this one-of-a-kind item \
  is what makes it truly special.",
  price: 44.99,
  image_path: 'http://i.imgur.com/ymvr4Qd.jpg',
  category: cleaning,
  venue: jtt,
  date: date
)

Event.create(
  title: 'Half-full Throat Spray',
  description: "You know him from every nature documentary ever \
  produced, and now you can unlock the secret behind his buttery, \
  informative voice with this partially-used bottle of throat coat \
  spray. You won't quite be kissing Mr. Attenborough, but sharing \
  this bottle will surely be enough to pique the interests of even \
  your most staunch dinner guests.",
  price: 109.99,
  image_path: 'http://i.imgur.com/69bNRtH.jpg',
  category: health,
  venue: attenborough,
  date: date
)

Event.create(
  title: 'Malfunctioning Bidet',
  description: "Perhaps one of our greatest treasures: hit-maker, \
  actor, and all-around world superstar Justin Timberlake's personal \
  bidet. Although tempting, this particular item is not recommended \
  for use, due to the malfunction of the pressure limiter of the spray \
  nozzle. Buyer beware, this rare gem comes with a scare!",
  price: 1099.99,
  image_path: 'http://i.imgur.com/LeTdTmw.jpg',
  category: bathroom,
  venue: jt,
  status: 1,
  date: date
)

Event.create(
  title: 'Justin Timberlake N*Sync Doll',
  description: "Worlds have collided with this unique item. Owned by \
  Sir David Attenborough, revealing both his good taste and a rare \
  glimpse into his private taste in both music and style is this \
  N*Sync era doll of Justin Timberlake. Originally equipped with a \
  pull string that would deliver snippets of songs, this feature is \
  no longer functioning due to overuse by Mr. Attenborough.",
  price: 249.99,
  image_path: 'http://i.imgur.com/bOZoSV8.jpg',
  category: entertainment,
  venue: attenborough,
  date: date
)

Event.create(
  title: 'Glee Season 2 Soundtrack (CD)',
  description: "Priced at a very special fifty-TWO dollars, this CD \
  shows plenty of scratches from apparent regular use by superstar \
  Justin Timberlake. Making this item extra special, the liner notes \
  have all original song titles scratched out and replaced with the \
  words 'Cry Me a River'.",
  price: 52.00,
  image_path: 'http://i.imgur.com/cLgVDRa.png',
  category: entertainment,
  venue: jt,
  date: date
)

Event.create(
  title: "Quarter Full Bottle of Visine",
  description: 'It’s no secret in Christopher Walken’s circle of friends that
  he suffers from chronically dry eyes. He maintains a regular optical
  prescription through his local Hollywood pharmacy, but was forced to use
  this Visine when he was unable to locate his prescription drops while
  filming Hot Island Breeze, a Bollywood romance that was never released
  in the US. One Fan’s Treasure acquired this bottle when Christopher,
  while on set, turned to one of our associates, handed him the bottle,
  and said, “Take this. It’s like God sent down an angel, to kiss my
  eyeballs. Wow.”',
  price: 3499.99,
  category: health,
  venue: christopher,
  image_path: "http://i.imgur.com/be4TQVU.jpg",
  status: 1,
  date: date
)

Event.create(
  title: "Toothbrush",
  description: 'Barely used! This was acquired from Gary’s housecleaner who said,
   “Mr. Busey likes soft bristle only. This is a medium to hard bristle toothbrush!”',
  price: 200.01,
  category: health,
  venue: gary,
  image_path: "http://i.imgur.com/s4Z1p1G.jpg",
  date: date
)

Event.create(
  title: "Bedazzled Toothbrush",
  description: 'Upon arrival at the Riviera Hotel & Casino in Las Vegas where Flavor Flave
  was negotiation another location for his House of Flavor restaurant specializing in fried chicken,
  Flavor Flave realized his assistant forgot to pack his custom microfiber-coated boar bristle grill polishing
  toothbrush. One of our associates was on staff at the Riviera at the time and provided this very toothbrush
  to Flave, who used it for one day until his custom toothbrush could be overnighted to him. Flavor Flave left this
  beauty on his bathroom counter, and now it can grace yours!',
  price: 299.99,
  category: health,
  venue: flavor,
  image_path: "http://i.imgur.com/zVIJ8wJ.png",
  date: date
)

Event.create(
  title: "Nearly Panned Blue Eyeshadow",
  description: 'Straight from the set of the 1983 hit music video Girls Wanna
  Have Fun, this eyeshadow graced the lids of this 80’s pop legend time after time.',
  price: 80.05,
  category: health,
  venue: cyndi,
  image_path: "http://i.imgur.com/LGbPdhk.jpg",
  date: date
)

Event.create(
  title: "1800w Microwave",
  description: 'Acquired through an estate sale after his passing, this
  microwave was used by Chris to heat up many of the snacks that fueled his
  larger than life comedic genius. It only runs for 20 seconds at a time,
  ensuring that you’ll never over-microwave your hot pockets.',
  price: 199.99,
  category: kitchen,
  venue: chris,
  image_path: "http://i.imgur.com/Ea13XQf.jpg",
  date: date
)

Event.create(
  title: "Almost New Bottle of Baby Oil",
  description: "Only enough of the oil was used to grease up the Hulkster
  right before he entered the arena for WrestleMania 20. Once slathered, the
  Hulk discarded the bottle outside the WrestleMania entranceway where it was
  scooped up by a security guard who made sure it found its way to One Fan's Treasure!",
  price: 350.21,
  category: health,
  venue: hulk,
  image_path: "http://i.imgur.com/7Muqvq2.jpg",
  date: date
)

Event.create(
  title: "Willson (volleyball)",
  description: "This is the companion that we all watched and wanted during
  the emotional tale portrayed in Cast Away. The opportunity to gain a friend
  and piece of history is now!",
  price: 760.09,
  category: entertainment,
  venue: tom,
  image_path: "http://i.imgur.com/XDSCwr4.jpg",
  date: date
)

Event.create(
  title: "Dull Straight Razor",
  description: "You may have thought it was all natural, but Vin was maintaining
  his unique look with this timeless tool for years! He has upgraded to an ever-sharp
  platinum coated razor, but now you can upgrade your collection of venue treasures
  at a bargain price!",
  price: 35.75,
  category: bathroom,
  venue: vin,
  image_path: "http://i.imgur.com/LT9Jeka.jpg",
  date: date
)

Event.create(
  title: "Oscar Award",
  description: 'One would have to wonder how long Leo has been wanting an Oscar
  of his own. In 2016, his goal was achieved, and he immediately donated his Oscar
  to us. Why? We asked, too! Leo told us, "After wanting it for so long, it is
  just weighing me down. Recycling just seems like the right thing to do, you
  know?" We sure do!',
  price: 15259.99,
  category: entertainment,
  venue: leo,
  image_path: "http://i.imgur.com/ET3lR7u.jpg",
  date: date
)

Event.create(
  title: "Blender",
  description: "This slightly used blender was used by none other than Arnold
  Schwarzenegger on his redemption tour in the realm of bodybuilding. You can
  also gain and win with this product.",
  price: 250.01,
  category: kitchen,
  venue: arnold,
  image_path: "http://i.imgur.com/r8TlVsW.jpg",
  date: date
)

Event.create(
  title: "Flask Containing Mystery Liquor",
  description: 'This was a secretly prized possesion of Charlie Sheen until the
  night he accidentally left it in the cab of a taxi in Slicklizzard, Alabama.
  Because respect and honesty are at our core values, When we acquired the
  flask, we attempted to reunite Mr. Sheen with his precious flash. He responded,
  "Last night was a shameful train wreck filled with blind cuddly puppies. Boom,
  crush. I never want to see that thing again. Winning, duh. Sheen out." The events
  of that evening are still as much of a mystery to us as the liquid contained within
  this flask. Now the mystery can be yours!',
  price: 365.05,
  category: entertainment,
  venue: charlie,
  image_path: "http://i.imgur.com/RIwQsL4.jpg",
  status: 1,
  date: date
)

Event.create(
  title: "Broken Green Umbrella",
  description: "You may immediately recognize this iconic umbrella used by
  Britney in 2007 to defend herself against a vicious paparrazi attack. In the
  last few years, Britney has warmed up to being in the spotlight again and
  offered us the umbrella as a means of shedding her difficult past. It can't
  shield you from the rain, but it can shield you from the prying eyes of
  the public if you use it as a weapon and make frantic, angry jabs at people.
  Wield with responsibility.",
  price: 313.13,
  category: outdoors,
  venue: britney,
  image_path: "http://i.imgur.com/XOKy4oy.jpg",
  date: date
)

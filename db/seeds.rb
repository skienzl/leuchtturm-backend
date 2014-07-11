# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# HARBORS

zell = Harbor.create({
    name: "Zell am See Kaprun",
    description: "Deep v pour-over disrupt, umami cornhole bicycle rights authentic bespoke ugh next level. Aesthetic iPhone McSweeney's, wolf Cosby sweater +1 banh mi. Disrupt drinking vinegar mixtape Williamsburg dreamcatcher, farm-to-table Tumblr. Lo-fi selfies ugh, polaroid wayfarers kitsch Schlitz retro mixtape flexitarian selvage PBR Austin trust fund. Flexitarian Blue Bottle shabby chic Helvetica sartorial. Sriracha Pinterest keffiyeh mlkshk 90's. PBR Tumblr organic, farm-to-table mixtape butcher Truffaut crucifix PBR&B kogi."
  })

rb = Harbor.create({
    name: "Rettungsboot",
    description: "Bacon ipsum dolor sit amet magna veniam esse, cillum consequat qui pariatur. Sausage rump sed ground round ut dolor fugiat drumstick duis pork voluptate. Sed cow nulla frankfurter venison, ground round ribeye excepteur strip steak magna occaecat labore veniam. Elit andouille tail adipisicing esse ullamco sausage tenderloin beef ribs in cupidatat laboris pastrami chuck pork loin."
  })

# COLLECTIONS

schmitten = Collection.create({
    name: "Schmitten Runde",
    harbor: zell,
    description: "Deep v pour-over disrupt, umami cornhole bicycle rights authentic bespoke ugh next level. Aesthetic iPhone McSweeney's, wolf Cosby sweater +1 banh mi. Disrupt drinking vinegar mixtape Williamsburg dreamcatcher, farm-to-table Tumblr. Lo-fi selfies ugh, polaroid wayfarers kitsch Schlitz retro mixtape flexitarian selvage PBR Austin trust fund. Flexitarian Blue Bottle shabby chic Helvetica sartorial. Sriracha Pinterest keffiyeh mlkshk 90's. PBR Tumblr organic, farm-to-table mixtape butcher Truffaut crucifix PBR&B kogi."
  })

room1 = Collection.create({
    name: "Backbord",
    harbor: rb,
    description: "Bacon ipsum dolor sit amet magna veniam esse, cillum consequat qui pariatur. Sausage rump sed ground round ut dolor fugiat drumstick duis pork voluptate. Sed cow nulla frankfurter venison, ground round ribeye excepteur strip steak magna occaecat labore veniam. Elit andouille tail adipisicing esse ullamco sausage tenderloin beef ribs in cupidatat laboris pastrami chuck pork loin."
  })

room2 = Collection.create({
    name: "Steuerbord",
    harbor: rb,
    description: "Bacon ipsum dolor sit amet magna veniam esse, cillum consequat qui pariatur. Sausage rump sed ground round ut dolor fugiat drumstick duis pork voluptate. Sed cow nulla frankfurter venison, ground round ribeye excepteur strip steak magna occaecat labore veniam. Elit andouille tail adipisicing esse ullamco sausage tenderloin beef ribs in cupidatat laboris pastrami chuck pork loin."
  })

room3 = Collection.create({
    name: "Kombüse",
    harbor: rb,
    description: "Bacon ipsum dolor sit amet magna veniam esse, cillum consequat qui pariatur. Sausage rump sed ground round ut dolor fugiat drumstick duis pork voluptate. Sed cow nulla frankfurter venison, ground round ribeye excepteur strip steak magna occaecat labore veniam. Elit andouille tail adipisicing esse ullamco sausage tenderloin beef ribs in cupidatat laboris pastrami chuck pork loin."
  })

# REGIONS

beacon1 = Region.create({
    name: "Beacon 1",
    description: "Backbord Beacon",
    next: nil,
    previous: nil,
    lat: 46.62543,
    lon: 14.31136,
    technology: Technology::BEACON,
    accuracy: Accuracy::HIGH,
    identifier: "B9407F30-F5F8-466E-AFF9-25556B57FE6D",
    minor: 1,
    major: 1,
    collection: room1
  })

beacon2 = Region.create({
    name: "Beacon 2",
    description: "Backbord Beacon",
    next: nil,
    previous: nil,
    lat: 46.62543,
    lon: 14.31136,
    technology: Technology::BEACON,
    accuracy: Accuracy::HIGH,
    identifier: "B9407F30-F5F8-466E-AFF9-25556B57FE6D",
    minor: 2,
    major: 1,
    collection: room2
  })

beacon3 = Region.create({
    name: "Beacon 3",
    description: "Backbord Beacon",
    next: nil,
    previous: nil,
    lat: 46.62543,
    lon: 14.31136,
    technology: Technology::BEACON,
    accuracy: Accuracy::HIGH,
    identifier: "B9407F30-F5F8-466E-AFF9-25556B57FE6D",
    minor: 3,
    major: 1,
    collection: room3
  })

schmitten1 = Region.create({
    name: "Schmitten Point of Interest 1",
    description: "Schmitten POI",
    next: nil,
    previous: nil,
    lat: 46.62543,
    lon: 14.31136,
    technology: Technology::GPS,
    accuracy: Accuracy::HIGH,
    identifier: nil,
    minor: nil,
    major: nil,
    collection: schmitten
  })

schmitten2 = Region.create({
    name: "Schmitten Point of Interest 2",
    description: "Schmitten POI",
    next: nil,
    previous: nil,
    lat: 46.42543,
    lon: 14.21136,
    technology: Technology::GPS,
    accuracy: Accuracy::HIGH,
    identifier: nil,
    minor: nil,
    major: nil,
    collection: schmitten
  })

schmitten3 = Region.create({
    name: "Schmitten Point of Interest 3",
    description: "Schmitten POI",
    next: nil,
    previous: nil,
    lat: 46.92543,
    lon: 14.71136,
    technology: Technology::GPS,
    accuracy: Accuracy::HIGH,
    identifier: nil,
    minor: nil,
    major: nil,
    collection: schmitten
  })

schmitten1.next = schmitten2

schmitten2.next = schmitten3
schmitten2.previous = schmitten1

schmitten3.previous = schmitten2


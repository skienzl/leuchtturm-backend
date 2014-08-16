
# USERS

user1 = User.create({email: "mgratzer@gmail.com",
                      name: "Martin Gratzer",
                      password: "#letmein#",
                      password_confirmation: "#letmein#",
                      role: 1})

user2 = User.create({email: "kienzlstefan@gmail.com",
                      name: "Stefan Kienzl",
                      password: "#letmein#",
                      password_confirmation: "#letmein#",
                      role: 1})

user3 = User.create({email: "leuchtturm@topmind.eu",
                     name: "Käptn Blaubär",
                     password: "#letmein#",
                     password_confirmation: "#letmein#",
                     role: 0})

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

# TASKS

schmitten1_task = Task.create({
    name: "Add Server Log",
    description: "Adds an entry in the website database to get a user counting",
    harbor: zell
})

schmitten2_task = Task.create({
    name: "Facebook Post Checkin",
    description: "Post a checkin on Facebook",
    harbor: zell
})

schmitten3_task = Task.create({
    name: "Picture on Twitter",
    description: "User should take picture and uploads it to the server which tweets it on the Zell account.",
    harbor: zell
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
                               collection: schmitten,
                               task: schmitten1_task
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
                               collection: schmitten,
                               task: schmitten2_task
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
                               collection: schmitten,
                               task: schmitten3_task
                           })

schmitten1.next = schmitten2

schmitten2.next = schmitten3
schmitten2.previous = schmitten1

schmitten3.previous = schmitten2

# ACTIVITIES

add_server_log = Activity.create({
    identifier: "activity_joker",
    name: "Add Server Log",
    description: "Adds an entry in the website database to get a user counting",
    task: schmitten1_task
})

facebooke_post_checking = Activity.create({
    identifier: "activity_facebook_post_checkin",
    name: "User posts a checkin on Facebook",
    description: "Adds an entry in the website database to get a user counting",
    task: schmitten2_task
})

notifiy_user  = Activity.create({
    identifier: "activity_notifiy_user",
    name: "Notification",
    description: "User gets a notification on the device",
    task: schmitten3_task
})

take_picture  = Activity.create({
    identifier: "activity_make_picture",
    name: "Take a picture",
    description: "User should take a picture",
    task: schmitten3_task
})

upload_to_server = Activity.create({
    identifier: "activity_server_upload",
    name: "Upload to Server",
    description: "Client upload content to server",
    task: schmitten3_task
})

server_tweets = Activity.create({
    identifier: "activity_server_tweets",
    name: "Server tweets",
    description: "Server tweets with the provider account",
    task: schmitten3_task
})

# PORTS

add_server_log_in_content_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::IN,
    is_optional: false,
    activity: add_server_log
})

add_server_log_out_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::OUT,
    is_optional: false,
    activity: add_server_log
})

facebooke_post_checking_in_content_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::IN,
    is_optional: false,
    activity: facebooke_post_checking
})

facebooke_post_checking_out_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::OUT,
    is_optional: false,
    activity: facebooke_post_checking
})

notifiy_user_in_content_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::IN,
    is_optional: false,
    activity: notifiy_user
})

notifiy_user_out_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::OUT,
    is_optional: false,
    activity: notifiy_user
})

take_picture_in_content_string = Port.create({
    data_type: DataType::INTEGER,
    port_type: PortType::IN,
    is_optional: false,
    activity: take_picture
})

take_picture_out_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::OUT,
    is_optional: false,
    activity: take_picture
})

take_picture_proxy_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::PROXY,
    is_optional: false,
    activity: take_picture
})

upload_to_server_in_content_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::IN,
    is_optional: false,
    activity: upload_to_server
})

upload_to_server_in_notification_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::IN,
    is_optional: false,
    activity: upload_to_server
})

upload_to_server_out_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::OUT,
    is_optional: false,
    activity: upload_to_server
})

server_tweets_in_content_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::IN,
    is_optional: false,
    activity: server_tweets
})

server_tweets_out_response_string = Port.create({
    data_type: DataType::STRING,
    port_type: PortType::OUT,
    is_optional: false,
    activity: server_tweets
})

# Mapping

Mapping.create({
    task: add_server_log_out_response_string.activity.task,
    in_id: nil,
    out_id: add_server_log_out_response_string.id
})

Mapping.create({
    task: facebooke_post_checking_out_response_string.activity.task,
    in_id: nil,
    out_id: facebooke_post_checking_out_response_string.id
})

Mapping.create({
    task: notifiy_user_out_response_string.activity.task,
    in_id: nil,
    out_id: notifiy_user_out_response_string.id
})

Mapping.create({
    task: notifiy_user_out_response_string.activity.task,
    in_id: notifiy_user_out_response_string.id,
    out_id: take_picture_proxy_response_string.id,
})

Mapping.create({
    task: take_picture_out_response_string.activity.task,
    in_id: take_picture_out_response_string.id,
    out_id: upload_to_server_in_content_string.id,
})

Mapping.create({
    task: upload_to_server_out_response_string.activity.task,
    in_id: upload_to_server_out_response_string.id,
    out_id: server_tweets_in_content_string.id,
})

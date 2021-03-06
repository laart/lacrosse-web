# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Events extension
Refinery::Events::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Galleries extension
Refinery::Galleries::Engine.load_seed

# Added by Refinery CMS Players extension
Refinery::Players::Engine.load_seed

# Added by Refinery CMS Achievements extension
Refinery::Achievements::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Managers extension
Refinery::Managers::Engine.load_seed

Refinery::NewPlayerInquiries::Engine.load_seed

# Added by Refinery CMS Videos extension
Refinery::Videos::Engine.load_seed

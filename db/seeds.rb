# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dpa1 = Dpa.create! description: "pichincha", hierarchy: 1
Dpa.create! description: "cayambe", hierarchy: 2, bg_url: "https://", dpa_id: dpa1.id
Dpa.create! description: "quito", hierarchy: 2, bg_url: "https://", dpa_id: dpa1.id

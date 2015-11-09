# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  #first org and user
  org = Organization.create(name: "MFProduction")
  user = User.create!({:email => "admin@admin.com", :password => "password", :password_confirmation => "password" })
  user.add_role :admin
  
  #Analitic
  analytic = Analytic.create(name: "Plače", number: 4700 )
  analytic = Analytic.create(name: "Prispevki", number: 4740 )
  analytic = Analytic.create(name: "Prispevki #2 ", number: 4741 )
  analytic = Analytic.create(name: "Stroški prevoza na delo - zaposleni", number: 4731 )
  analytic = Analytic.create(name: "Stroški prehrane med delom - zaposleni", number: 4732 )
  analytic = Analytic.create(name: "Potni stroški drugi", number: 4140 )
  analytic = Analytic.create(name: "Avtorski Honorar - Strokovni sodelavci", number: 4180  )


  #CBS
  costcenter = org.costcenters.build(name: "Nedefinirano", number: "000/99" )
  costcenter = org.costcenters.build(name: "Nedefinirano - Matjaž", number: "007/99" )
require 'faker'

puts 'Destroying records and data'
Comment.with_deleted.each { |u| u.really_destroy! } # acts as paranoid
Landscape.with_deleted.each { |u| u.really_destroy! } # acts as paranoid
Category.destroy_all
User.destroy_all


# Reset postgres auto increments
puts "Reseting postgres auto increment ids"
Comment.connection.execute('ALTER SEQUENCE comments_id_seq RESTART WITH 1')
Landscape.connection.execute('ALTER SEQUENCE landscapes_id_seq RESTART WITH 1')
Category.connection.execute('ALTER SEQUENCE categories_id_seq RESTART WITH 1')
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')

puts 'Creating categories'
categories = ["Naturaleza", "Ciudad", "Urbano", "Viajes", "Playas"]
categories.each do |category|
  Category.create!(name: category)
end

users = [
  { email: 'cristobal@example.com', name: 'Cristobal', lastname: 'Dominguez', nickname: 'cristobaldominguez', password: 123123, profile: 'cd.jpg', cover: 'cover_04.jpg', landscapes: 5 },
  { email: 'admin@example.com', name: 'Desafío', lastname: 'Latam', nickname: 'elliot', password: 123456, profile: 'elliot.jpg', cover: 'mr_robot_cover.jpeg', landscapes: 3 },
  { email: 'margot@example.com', name: 'Margot', lastname: 'Robbie', nickname: 'margotrobbie', password: 123456, profile: 'margot.jpg', cover: 'cover_01.jpg', landscapes: 3 },
  { email: 'ryan@example.com', name: 'Ryan', lastname: 'Reynolds', nickname: 'ryanreynolds', password: 123456, profile: 'ryan.jpg', cover: 'cover_05.jpg', landscapes: 3 },
  { email: 'barack@example.com', name: 'Barack', lastname: 'Obama', nickname: 'barackobama', password: 123456, profile: 'barack.jpg', cover: 'cover_03.jpg', landscapes: 3 },
  { email: 'michael@example.com', name: 'Michael', lastname: 'Jackson', nickname: 'michaeljackson', password: 123456, profile: 'michael.jpg', cover: 'cover_06.jpg', landscapes: 3 },
  { email: 'bruce@example.com', name: 'Bruce', lastname: 'Willis', nickname: 'brucewillis', password: 123456, profile: 'bruce.jpg', cover: 'cover_02.jpg', landscapes: 3 }
]

images = (1..23).to_a.shuffle
days = (1..24).to_a.shuffle
titles = ['Muy lejos, más allá', 'De las montañas', 'Alejados de los países', 'De vocales y consonantes', 'Viven los textos simulados', 'Aislados en casas de letras', 'En la costa de la semántica', 'Un gran océano de lenguas', 'Un riachuelo llamado Pons', 'Fluye por su pueblo', 'Los abastece con normas', 'Hablamos de un país', 'Paraisomático en el que', 'A uno le caen pedazos', 'De frases asadas', 'Ni siquiera los poderosos', 'Signos de puntuación', 'A los textos simulados', 'Una vida, se puede decir', 'Poco ortográfica', 'Pero un buen día', 'Una pequeña línea de texto', 'Llamada Lorem Ipsum', 'Decidió aventurarse y salir']

puts 'Creating Users'
users.each do |user|

  puts "Creating User #{user[:name]}"
  current_user = User.create!(
    email: user[:email],
    name: user[:name],
    lastname: user[:lastname],
    nickname: user[:nickname],
    password: user[:password]
  )
  current_user.profile.attach(io: File.open("app/assets/images/profiles/#{user[:profile]}"), filename: user[:profile])
  current_user.cover.attach(io: File.open("app/assets/images/covers/#{user[:cover]}"), filename: user[:cover])

  user[:landscapes].times do
    id = images.pop
    date = Date.today - days[id].days

    current_landscape = Landscape.create!(
      title: titles[id],
      description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
      user_id: current_user.id,
      created_at: Date.today - days[id].days,
      updated_at: Date.today - days[id].days
    )

    current_id = id < 10 ? "0#{id}" : id.to_s
    current_landscape.image.attach(io: File.open("app/assets/images/squared/#{current_id}.jpg"), filename: "#{current_id}.jpg")
  end

end

user_ids = User.pluck(:id)
landscape_ids = Landscape.pluck(:id)
rand_comments = landscape_ids.map { |_| rand(1..5) }

puts 'Creating Comments'
landscape_ids.each do |landscape|
  puts "Creating Comments for Landscape #{landscape}"

  rand_comment = rand_comments.pop

  rand_comment.times do
    current_comment = Comment.create!(
       user_id: user_ids.sample,
       landscape_id: landscape,
       text: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 5),
       created_at: Date.today - rand(1..10000).hours
    )
  end

end

puts 'DONE!'

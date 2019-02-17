# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

parque_celaya = Cinema.create!(
  description: 'Cinépolis Parque Celaya'
)

('A'..'H').each do |column|
  (1..12).each do |row|
    parque_celaya.seats.create!(
      code: "#{column}#{row}"
    )
  end
end

english = Language.create!(
  code: 'EN',
  description: 'Inglés'
)

spanish = Language.create!(
  code: 'ES',
  description: 'Español'
)

pg_13 = Classification.create!(
  code: 'PG-13',
  description: 'Mayores de 13'
)

fantasy = Genre.create!(
  description: 'Fantasía'
)

aquaman = Movie.create!(
  title: 'Aquaman',
  release_date: Time.parse('13/12/2018'),
  duration: 144,
  genre: fantasy,
  language: english,
  classification: pg_13
)

alita = Movie.create!(
  title: 'Alita: Battle Angel',
  release_date: Time.parse('13/12/2018'),
  duration: 144,
  genre: fantasy,
  language: english,
  classification: pg_13
)

aquaman_spanish = MovieVersion.create!(
  language: spanish,
  movie: aquaman,
  title: 'Aquaman'
)

alita_spanish = MovieVersion.create!(
  language: spanish,
  movie: alita,
  title: 'Battle Angel: La Última Guerrera'
)

aquaman_function_16 = Function.create!(
  cinema: parque_celaya,
  movie_version: aquaman_spanish,
  started_for: Time.current.tomorrow.change(
    hour: 16,
    minute: 0
  )
)

aquaman_function_20 = Function.create!(
  cinema: parque_celaya,
  movie_version: aquaman_spanish,
  started_for: Time.current.tomorrow.change(
    hour: 20,
    minute: 0
  )
)

alita_function_18 = Function.create!(
  cinema: parque_celaya,
  movie_version: alita_spanish,
  started_for: Time.current.tomorrow.change(
    hour: 18,
    minute: 0
  )
)

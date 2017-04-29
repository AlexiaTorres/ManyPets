# ruby encoding: utf-8
developer_list = [
    [ 'Alexia', 'Torres Celorio', 'maikuxy20@gmail.com' ],
    [ 'Jonatan', 'Rojas', 'jonatan.rojas@gmail.com' ],
]

pets_list = [
    ['Caballito', 2, 'Male', 1, 'Rat', 1],
    ['Bliss', 4, 'Male', 0, 'Chinchilla', 1],
    ['Gato', 6, 'Male', 1, 'Cat', 1],
    ['Katniss', 4, 'Female', 0, 'Dog', 1]
]


developer_list.each do |first_name, last_name, email|
  Developer.create( first_name: first_name, last_name: last_name, email: email)
end

pets_list.each do |name, age, gender, alive, category, developer_id|
  Pet.create(name: name, age: age, gender: gender, alive: alive, category: category, developer_id: developer_id)
end

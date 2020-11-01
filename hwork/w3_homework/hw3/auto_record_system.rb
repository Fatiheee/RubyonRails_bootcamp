require 'json'
require 'yaml'
require 'cities'

class AutoRecordSystem
  attr_accessor :cars

  def initialize
    load
  end

  def add_car(full_name, city, model, plate)
    @cars << Keywords.new(full_name, city, model, plate)
    save
    puts "#{plate} vehicle was added."
    @cars.last
  end

  private

  def save
    File.open("register.yml", "w") { |file| file.write(@cars.to_yaml)}
  end

  def load
    if File.exist?('register.yml') && YAML.load(File.read('register.yml'))
      @cars = YAML.load(File.read('register.yml'))
    else
      @cars = Array.new
    end

    @cars
  end
end

class Keywords
  attr_accessor :full_name, :city, :model, :plate

  def initialize(full_name, city, model, plate)
    @full_name = full_name
    @city = city
    @model = model
    @plate = plate
  end
end

car_record = AutoRecordSystem.new

puts "Plaka :"
plate = gets.chomp.split(' ')
edited_plate = plate[0] + ' ' + plate[1].upcase + ' ' + plate[2]

c = Cities::CarPlate.new(plate[0])
city = c.city.to_s.split('"')[1]

puts "Model :"
model = gets.chomp.upcase

models_list = JSON.parse(File.read('models.json'))

if !((models_list).any? { |e| e['name'] == model })
  puts "Bulunamayan arac modeli"
  exit
end

puts "Ad/Soyad :"
full_name = gets.chomp.upcase

record = car_record.add_car(full_name, city, model, edited_plate)

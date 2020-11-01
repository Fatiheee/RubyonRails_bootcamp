require "cities/version"
require 'json'

module Cities
  class CarPlate
    attr_accessor :number

    def initialize(number)
      @number = number
    end

    def city
      if @number > '0' && @number < '82'
        data_hash = JSON.parse(File.read('E:/Ruby/cities/lib/cities.json'))
        city = data_hash.select { |data| data == @number }
        return city.values
      else
        puts 'Plaka formati uygun degil. (01 - 81 arasinda giriniz)'
        exit
      end
    end
  end
end
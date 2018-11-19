require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    all.each do |song|
      return song if song.name == name 
    end
    nil
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end
  
  def self.alphabetical
    all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename
    
end

def crop_string_between_markers(string, m1, m2)
  string[/#{Regexp.escape(m1)}(.*?)#{Regexp.escape(m2)}/m, 1]
end

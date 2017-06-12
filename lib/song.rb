require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  # def initialize(song)
  #   @song = song
  # end

  def self.create
  song = self.new
  song.save
  song
  end

  def self.new_by_name(name_of_song)
     song = self.new
     song.name = name_of_song
     song.save
     song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song)
    self.all.detect {|s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    if !self.find_by_name(song)
        self.create_by_name(song)
    else
      self.find_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(the_song)
    s = the_song.split(" - ")
    artist = s[0]
    song_name = s[1].chomp(".mp3")
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(the_song)
    s = the_song.split(" - ")
    artist = s[0]
    song_name = s[1].chomp(".mp3")
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
  







  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

Pry.start

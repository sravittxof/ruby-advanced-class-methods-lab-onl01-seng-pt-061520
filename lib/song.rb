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
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.detect do |x|
      if x.name == name
        x
      else
        false
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    @exists = self.find_by_name(song_name)
    @new = self.create_by_name(song_name)
    
    if @exists == false
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file_name)
    song = self.new
    names_array = file_name.scan(/(.+).mp3/).join.split(" - ")
    song.artist_name = names_array[0]
    song.name = names_array[1]
    song.save
    song
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end

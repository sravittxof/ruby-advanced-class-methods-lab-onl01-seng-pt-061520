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
  
=begin
    sorted_alphabetically = []
    self.all.each do |song|
      sorted_alphabetically << "#{song.name}"
    end
    sorted_alphabetically.sort!    
    sorted_alphabetically
=end
  
  
  def self.alphabetical
    self.all.sort_by(song.name)

  end
  
  
end

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(content)
    content = content.reject {|note| note == ""}

    content.each {|note| self.notes << Note.create(content: note)}

  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  

  def artist_name
    self.artist ? self.artist.name : nil
  end

    def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
    end

    def genre_name
   self.genre ? self.genre.name : nil
    end

    def note_contents
      self.notes.map {|note|note.content}
    end
end

class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :genre
  belongs_to :artist

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

  # def note_ids=(ids)
  #   ids.each do |id|
  #     note = Note.find(id)
  #     self.notes << note
  #   end
  # end

  def note_contents
    self.notes.map{|note| note.content}
  end

  def note_contents=(note_content_array)
    note_content_array.each do |note_content|
      if note_content.squeeze.length > 0
        found_note = Note.find_or_create_by(content: note_content)
        self.notes << found_note
      end
    end
  end
end

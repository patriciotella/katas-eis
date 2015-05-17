class InvalidLocation < Exception

  def message
    "location is out of board"
  end
end
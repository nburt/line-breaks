class LineBreaker

  def initialize(text)
    @text = text
  end

  def break_lines(characters)
    new_text = ""
    scanned_line = @text.scan(/(.{,#{characters}}\s)/)
    if scanned_line == []
      new_text << "#{scanned_line.strip}\n"
    else
      scanned_line.each do |scanned_line|
        new_text << "#{scanned_line[0].strip}\n"
      end
    end
    new_text
  end

end
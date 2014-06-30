class LineBreaker

  def initialize(text)
    @text = text
  end

  def break_lines(chars_per_line)
    broken_lines = ""

    while @text.length > 0 do
      if @text[chars_per_line] == nil || @text[chars_per_line] == " "
        broken_lines << "#{@text.slice!(0..chars_per_line).strip}\n"
      else
        line = get_line(@text.slice(0..chars_per_line).chars)
        if line.join == @text.slice(0..chars_per_line)
          broken_lines << "#{line.join}\n"
        elsif line.empty?
          @text.slice!(0..line.join.length)
          broken_lines << "\n"
        else
          broken_lines << "#{line.join}\n"
          @text.slice!(0..line.join.length)
        end
      end
    end
    broken_lines
  end

  private

  def get_line(chars)
    foo = true
    while foo do
      if chars[-1] != " "
        chars.delete_at(-1)
      end
      if chars[-1] == " " || chars[-1] == "\n"
        chars.delete_at(-1)
        foo = false
      end
      if chars.empty?
        foo = false
      end
    end
    chars
  end

end

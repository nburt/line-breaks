require './lib/line_breaker'

describe LineBreaker do

  it 'should break off lines after 20 characters' do
    text = <<-Lines
Jean shorts you probably haven't heard of them farm-to-table.

Another line.
    Lines

    expected = <<-Result
Jean shorts you
probably haven't
heard of them
farm-to-table.

Another line.
Result

    line_breaker = LineBreaker.new(text)
    expect(line_breaker.break_lines(20)).to eq expected

  end

  it 'should break of lines after 12 characters' do
    input = "This is a sample string with characters."
    line_breaker = LineBreaker.new(input)
    expect(line_breaker.break_lines(12)).to eq "This is a\nsample\nstring with\ncharacters.\n"
  end

end
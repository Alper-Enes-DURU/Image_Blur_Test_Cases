class Image
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def blur
    ones = Array.new
    @data.each_with_index do |rows, row|
       rows.each_with_index do |num, col|
          ones << [row, col] if num == 1
       end
    end

    num_rows = @data.size
    num_cols = @data[0].size

    ones.each do |row, col|
      @data[row-1][col]=1 if row-1 >= 0         
      @data[row+1][col]=1 if row+1 < num_rows  
      @data[row][col-1]=1 if col-1 >= 0         
      @data[row][col+1]=1 if col+1 < num_cols   
    end
    return self
  end
end
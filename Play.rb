board=[["-", "-"], ["-", "-"]]
board.each do |item|
    puts true if item.include?("-")
end
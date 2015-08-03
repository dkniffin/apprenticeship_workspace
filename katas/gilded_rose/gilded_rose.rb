def update_quality(items)
  items.each do |item|
    next if item.name == 'Sulfuras, Hand of Ragnaros'

    case item.name
    when 'Aged Brie'
      handle_aged_brie(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      handle_backstage_passes(item)
    when /^Conjured*/
      handle_conjured(item)
    else
      handle_default(item)
    end
    item.sell_in -= 1
    item.quality = 50 if item.quality > 50
  end
end

def handle_aged_brie(item)
    if item.sell_in <= 0
      item.quality += 2
    else
      item.quality += 1
    end
end

def handle_backstage_passes(item)
  if item.sell_in > 10
    item.quality += 1
  elsif item.sell_in > 5 && item.sell_in <= 10
    item.quality += 2
  elsif item.sell_in > 0 && item.sell_in <= 5
    item.quality += 3
  else
    item.quality = 0
  end
end

def handle_conjured(item)
  2.times { handle_default(item) }
end

def handle_default(item)
  if item.quality > 0
    if item.sell_in <= 0
      item.quality -= 2
    else
      item.quality -= 1
    end
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

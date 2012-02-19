module EventsHelper
  def closest_half_hour(minute_offset = 0)
    # Ok I spent 30 minutes trying to figure this out but apparently
    # %l returns the hour with some leading whitespace - you need to
    # use .lstrip in order to trim it off the top in order to get it
    # to compare nicely.
    # Time.at((Time.now.advance(:minutes => minute_offset*30).to_f / (30*60) ).round * 30*60).strftime("%l:%M %P").lstrip
    Time.at((Time.now.advance(:minutes => minute_offset*30).to_f / (30*60) ).round * 30*60).strftime("%H:%M").lstrip
  end
  @@category_hash = {
  "Arts" => 1, 
  "Sports" =>2,
  "Professional" => 4,
  "Cultural" => 6,
  "Music" => 7,
  "Movies" => 8,
  "Academic" => 9,
  "Social" => 10,
  "Service" => 11
  }

  def self.all_categories
    categories = []
    @@category_hash.each do |c|
      categories << c
    end
    return categories
  end

  def get_check_id(name)
    'check-' + name.downcase
  end

  def cat_to_array(categories)
    # Takes an event's category string as stored in the database and returns
    # an array where each element is the category number (type string)
    categories.split(',')
  end

  def get_cat_classes(categories)
    # Takes an event's category string as stored in the database and returns
    # a correct css class string with the cat-# css classes
    cat_classes = ''
    categories.split(',').each do |c|
      cat_classes += 'cat-' + c + ' '
    end
    return cat_classes[0..-2]
  end
end

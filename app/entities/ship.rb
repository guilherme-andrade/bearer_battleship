class Ship
  extend Dry::Initializer

  option :name
  option :front_cell
  option :direction
  option :player

  PARTS = {
    'cruiser': ['front', 'back'],
    'destroyer': ['front', 'middle', 'back'],
    'submarine': ['front-submarine', 'middle', 'back'],
    'battleship': ['front', 'middle', 'middle', 'back'],
    'aircraft-carrier': ['front-aircraft-carrier', 'middle', 'middle', 'middle', 'back-aircraft-carrier']
  }.with_indifferent_access.freeze

  def parts
    PARTS[name.to_s]
  end

  def cells_to_occupy
    cell = front_cell

    parts.map.with_index do |part, index|
      index.zero? ? cell : cell = next_cell(cell)
    end.compact
  end

  def ship_complete?
    parts.length == cells_to_occupy.length
  end

  def can_be_placed_in?(battlefield)
    ship_complete? && cells_to_occupy.all? { |cell| battlefield.cell_available?(player, cell) }
  end

  def next_cell(cell)
    return nil unless cell

    letter, number = cell.split('')
 
    case direction
    when 'left'
      next_coordinates_to_the_right(letter, number)
    when 'right'
      next_coordinates_to_the_left(letter, number)
    when 'top'
      next_coordinates_to_the_bottom(letter, number)
    when 'bottom'
      next_coordinates_to_the_top(letter, number)
    end
  end

  def next_coordinates_to_the_right(letter, number)
    index = Battlefield::LETTERS.index(letter)
    return if index == Battlefield::LETTERS.length - 1

    "#{Battlefield::LETTERS[index + 1]}#{number}"
  end

  def next_coordinates_to_the_left(letter, number)
    index = Battlefield::LETTERS.index(letter)
    return if index.zero?

    "#{Battlefield::LETTERS[index - 1]}#{number}"
  end

  def next_coordinates_to_the_bottom(letter, number)
    index = Battlefield::NUMBERS.index(number)
    return if index == Battlefield::NUMBERS.length - 1

    "#{letter}#{Battlefield::NUMBERS[index + 1]}"
  end

  def next_coordinates_to_the_top(letter, number)
    index = Battlefield::NUMBERS.index(number)
    return if index.zero?

    "#{letter}#{Battlefield::NUMBERS[index - 1]}"
  end
end

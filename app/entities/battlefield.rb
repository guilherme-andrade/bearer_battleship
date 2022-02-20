class Battlefield
  BASE_BATTLEFIELD = {
    'main-player': {
      'bombs': [],
      'ship_parts': {}
    },
    'opponent': {
      'bombs': [],
      'ship_parts': {}
    }
  }.with_indifferent_access.freeze

  LETTERS = ('A'..'J').to_a.freeze
  NUMBERS = (1..LETTERS.size).to_a.map(&:to_s).freeze
  DIRECTIONS = ['left', 'right', 'top', 'bottom'].freeze
  
  def initialize
    @battlefield = BASE_BATTLEFIELD
    setup_opponent_ships if @battlefield['opponent']['ship_parts'].blank?
  end

  def add(ship)
    player = ship.player
    direction = ship.direction
    ship_name = ship.name.to_s

    ship.cells_to_occupy.each_with_index do |cell, index|
      @battlefield[player]['ship_parts'][cell] = {
        ship: ship_name,
        part: ship.parts[index],
        direction: direction
      }.with_indifferent_access
    end
  end

  def marshal_dump
    @battlefield
  end

  def marshal_load(battlefield)
    @battlefield = battlefield
  end

  def cell_bombed?(player, coordinates)
    @battlefield.dig(player, 'bombs').include?(coordinates)
  end

  def cell_occupied?(player, coordinates)
    @battlefield.dig(player, 'ship_parts', coordinates)
  end

  def cell_available?(player, coordinates)
    letter, number = coordinates.split('')

    !cell_occupied?(player, coordinates) && LETTERS.include?(letter) && NUMBERS.include?(number)
  end

  def ship_sunk?(player, ship)
    ship_parts = ship_parts_for(player)
    bombs = @battlefield.dig(player, 'bombs')

    ship_cells = ship_parts.keys.select { |cell| ship_parts.dig(cell, 'ship') == ship.to_s }

    ship_cells.all? { |cell| bombs.include?(cell) }
  end

  def bomb(player, coordinates)
    @battlefield[player]['bombs'] << coordinates
  end

  def random_bomb(player)
    @battlefield[player]['bombs'] << random_cell(player)
  end

  def ship_placed?(player, ship)
    @battlefield.dig(player, 'ship_parts').values.any? { |part| part['ship'] == ship }
  end

  def ship_part_for(player, coordinates)
    @battlefield.dig(player, 'ship_parts', coordinates, 'part')
  end

  def ship_direction_for(player, coordinates)
    @battlefield.dig(player, 'ship_parts', coordinates, 'direction')
  end

  def ship_parts_for(player)
    @battlefield.dig(player, 'ship_parts')
  end

  def place_ship(player, cell, ship)
    place_ship = PlaceShip.new(self)

    place_ship.call(player, cell, ship)
  end

  private

  def setup_opponent_ships
    ::Ship::PARTS.keys.each do |ship|
      cell = random_cell('opponent')
      place_ship('opponent', cell, ship)
    end
  end

  def random_cell(player)
    letter = LETTERS.sample
    number = NUMBERS.sample
    coordinates = "#{letter}#{number}"

    while cell_bombed?(player, coordinates)
      letter = LETTERS.sample
      number = NUMBERS.sample
      coordinates = "#{letter}#{number}"
    end

    coordinates
  end
end

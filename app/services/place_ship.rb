class PlaceShip
  extend Dry::Initializer

  param :battlefield

  def call(player, cell, ship_name)
    direction = random_direction
    ship = Ship.new(name: ship_name, front_cell: cell, direction: direction, player: player)

    until ship.can_be_placed_in?(battlefield)
      directions_tried ||= []
      directions_tried << direction
      direction = random_direction
      cell = random_cell if directions_tried.length == Battlefield::DIRECTIONS.length

      ship = Ship.new(name: ship_name, front_cell: cell, direction: direction, player: player)
    end

    battlefield.add(ship)
  end

  private

  def random_cell
    "#{Battlefield::LETTERS.sample}#{Battlefield::NUMBERS.sample}"
  end

  def random_direction
    Battlefield::DIRECTIONS.sample
  end
end

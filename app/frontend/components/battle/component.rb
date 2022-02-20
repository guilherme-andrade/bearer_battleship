module Battle
  class Component < ApplicationComponent
    attr_reader :battlefield

    def drop_ship(ship_part, coordinates)
      battlefield.place_ship('main-player', coordinates, ship_part)
      refresh! "#main-player-board"
    end

    def bomb
      battlefield.bomb('opponent', element.dataset.coordinates)
      battlefield.random_bomb('main-player')
      refresh! "#main-player-board", "#opponent-board"
    end

    def battlefield
      @battlefield ||= Battlefield.new
    end
  end
end

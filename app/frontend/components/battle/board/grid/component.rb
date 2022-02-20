module Battle
  module Board
    module Grid
      class Component < ApplicationComponent
        LETTERS = Battlefield::LETTERS
        NUMBERS = Battlefield::NUMBERS

        option :player, default: proc { 'main-player' }
        option :battlefield, default: proc { {} }

        def call
          component_controller(class: class_name(:grid)) do
            [header_row, grid_body].join.html_safe
          end
        end

        def row(&blk)
          content_tag(:div, class: class_name(:row), &blk)
        end

        def header_row
          row do
            render_letter + LETTERS.map { |letter| render_letter(letter) }.join.html_safe
          end
        end

        def grid_body
          NUMBERS.map { |number| render_row(number) }.join
        end

        def render_row(number)
          row do
            render_letter(number) + LETTERS.map { |letter| render_cell(letter, number) }.join.html_safe
          end
        end

        def render_cell(letter, number)
          cell = "#{letter}#{number}"
          bombed = battlefield.cell_bombed?(player, cell)
          ship_part = battlefield.ship_part_for(player, cell)
          direction = battlefield.ship_direction_for(player, cell)

          render Cell::Component.new player: player, bombed: bombed, coordinates: cell, ship_part: ship_part, direction: direction
        end

        def render_letter(number = nil)
          render Letter::Component.new letter: number
        end

        def collection_key
          player
        end
      end
    end
  end
end

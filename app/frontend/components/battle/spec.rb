require 'rails_helper'

RSpec.describe Battle::Component, type: :component do
  subject { described_class.new }

  before do
    render_inline(subject)
  end

  it "renders 200 cells" do
    expect(rendered_component).to have_css "[data-testid=cell]", count: 200
  end

  it "renders 5 ships in the shipyard" do
    expect(rendered_component).to have_css "[data-testid=shipyard] [data-testid=ship]", count: 5
  end

  it "renders 5 ship names in the graveyard" do
    expect(rendered_component).to have_css "[data-testid=graveyard] [data-testid=ship-name]", count: 5
  end

  it "renders 2 grids" do
    expect(rendered_component).to have_css "[data-testid=grid]", count: 2
  end

  it "renders 2 boards" do
    expect(rendered_component).to have_css "[data-testid=board]", count: 2
  end

  it "renders 0 ships in the grid" do
    expect(rendered_component).to have_css "[data-testid=grid] [data-testid=ship]", count: 0
  end

  it "renders 0 hits in the grid" do
    expect(rendered_component).to have_css "[data-testid=grid] [data-testid=hit]", count: 0
  end

  it "renders the player title" do
    expect(rendered_component).to have_css "[data-testid=main-player-side]", text: "Your fleet"
  end

  it "renders the player footer text" do
    expect(rendered_component).to have_css "[data-testid=main-player-side]", text: "Shipyard"
  end

  it "renders the opponent title" do
    expect(rendered_component).to have_css "[data-testid=opponent-side]", text: "Opponent"
  end

  it "renders the opponent footer text" do
    expect(rendered_component).to have_css "[data-testid=opponent-side]", text: "Graveyard"
  end
end

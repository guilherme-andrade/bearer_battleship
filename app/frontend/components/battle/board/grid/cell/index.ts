import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";
export default class extends Controller {
  stimulate: (key: string, ...other: any) => void;

  connect() {
    StimulusReflex.register(this);
  }

  dragging(event) {
    event.preventDefault();
  }

  placeShip(event) {
    this.stimulate(
      "Battle::Component#drop_ship",
      event.dataTransfer.getData("text"),
      event.target.dataset.cell
    );
  }
}

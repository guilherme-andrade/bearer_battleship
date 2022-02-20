import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";
import styles from "./styles.module.scss";

export default class extends Controller {
  connect() {
    StimulusReflex.register(this);
  }

  ghost(event) {
    this.element.classList.add(styles["ship--ghost"]);
    event.dataTransfer.setData("text", event.target.dataset.ship);
  }
}

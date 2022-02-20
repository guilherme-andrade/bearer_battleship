import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import StimulusReflex from "stimulus_reflex";
import consumer from "channels/consumer";

const application = Application.start();

export const defineFromContext = (context) => {
  application.load(definitionsFromContext(context));
  (application as any).consumer = consumer;
};

StimulusReflex.initialize(application, { consumer });

export default application;

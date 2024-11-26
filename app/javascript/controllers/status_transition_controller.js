import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  submit(_e) {
    this.element.requestSubmit();
  }
}

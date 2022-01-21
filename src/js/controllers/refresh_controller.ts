import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    interval: { type: Number, default: 3000 }
  }

  connect() {
    this.timeout = setInterval(() => {
      Turbo.visit(window.location.href)
    }, this.intervalValue);
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}

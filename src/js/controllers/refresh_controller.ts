import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.timeout = setInterval(() => {
      Turbo.visit(window.location.href)
    }, 3000);
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}

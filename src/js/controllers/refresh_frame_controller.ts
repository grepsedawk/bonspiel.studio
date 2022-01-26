import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.timeout = setInterval(() => {
      const orig = this.element.src
      this.element.setAttribute('src', "")
      this.element.setAttribute('src', orig)
    }, 3000);
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  public submit(e): void {
    e.target.closest("form").requestSubmit()
  }

  public selectAll(e): void {
    e.target.select()
  }
}

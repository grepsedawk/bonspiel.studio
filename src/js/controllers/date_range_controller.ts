import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  public setMaxFromValue(e): void {
    const end_at = e.srcElement
    const start_at = document.getElementById(end_at.dataset.target)

    if (start_at !== null && end_at !== null) {
      start_at.max = end_at.value
    }
  }

  public setMinFromValue(e): void {
    const start_at = e.srcElement
    const end_at = document.getElementById(start_at.dataset.target)

    if (start_at !== null && end_at !== null) {
      end_at.min = start_at.value
    }
  }
}

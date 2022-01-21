import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  copy(event: PointerEvent) {
    event.preventDefault()
    const target = event.target as HTMLAnchorElement
    navigator.clipboard.writeText(target.href)

    const origText = target.innerText
    target.innerText = "Copied"
    setTimeout(() => target.innerText = origText, 1000)
  }
}

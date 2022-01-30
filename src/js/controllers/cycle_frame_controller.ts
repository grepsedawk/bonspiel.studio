import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.timeout = setInterval(() => {
      const frames = this.element.children
      let showNext = false

      for (var i = 0; i < frames.length; i++) {
        const frame = frames[i]
        if (showNext) {
          this.#showFrame(frame)
          return
        }

        if (!frames[i].classList.contains('hidden')) {
          frames[i].classList.add("hidden")
          showNext = true
          if (i === frames.length - 1) {
            this.#showFrame(frames[0])
          }
        }
      }
    }, 3000)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  #showFrame(frame) {
    const orig = frame.src
    frame.setAttribute('src', "")
    frame.setAttribute('src', orig)
    frame.classList.remove("hidden")
  }
}

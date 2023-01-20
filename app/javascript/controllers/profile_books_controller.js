import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-books"
export default class extends Controller {
  static targets = [ "book", "bookForm" ]

  connect() {
    console.log("hi")
  }

  editFormToggle(e) {
    e.preventDefault()
    console.log(this.bookTarget.classList)
    this.bookTarget.classList.toggle("d-none")
    this.bookFormTarget.classList.toggle("d-none")
    e.currentTarget.innerHTML = '<i class="fa-solid fa-pen-to-square"></i>'
  }
}

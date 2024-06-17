// app/javascript/application.js
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"

window.bootstrap = bootstrap


document.addEventListener("turbo:load", () => {
    const addGiftButton = document.querySelector("#add-gift");
    const giftFieldsContainer = document.querySelector(".gift-fields");

    if (addGiftButton && giftFieldsContainer) {
        addGiftButton.addEventListener("click", (e) => {
            e.preventDefault();
            const index = giftFieldsContainer.querySelectorAll(".form-container").length;

            fetch("/friends/gift_fields")
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Network response was not ok: ${response.statusText}`);
                    }
                    return response.text();
                })
                .then(html => {
                    const div = document.createElement("div");
                    div.innerHTML = html;

                    // Update the name and ID attributes
                    div.querySelectorAll("input").forEach(input => {
                        input.name = input.name.replace("gifts", `friend[gifts_attributes][${index}]`);
                        input.id = input.id.replace("gifts", `friend_gifts_attributes_${index}`);
                    });

                    giftFieldsContainer.appendChild(div.firstElementChild);
                })
                .catch(error => console.error('There was a problem with the fetch operation:', error));
        });

        giftFieldsContainer.addEventListener("click", (e) => {
            if (e.target.classList.contains("remove-gift")) {
                e.preventDefault();
                e.target.closest(".form-container").remove();
            }
        });
    }
});

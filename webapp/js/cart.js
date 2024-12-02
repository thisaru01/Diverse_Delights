document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById("cartModal");
    const closeBtn = document.querySelector(".close-button");

    // Show the modal automatically when the page loads
    modal.classList.add("show");

    // Function to close the modal and redirect
    closeBtn.addEventListener("click", function() {
        modal.classList.remove("show");
        window.location.href = "appetizers.jsp"; // Redirects to appetizers.jsp
    });

    // Close the modal when clicking outside the modal content
    window.addEventListener("click", function(event) {
        if (event.target === modal) {
            modal.classList.remove("show");
            window.location.href = "appetizers.jsp"; // Redirects to appetizers.jsp
        }
    });

    // Add confirmation prompt when the remove button is clicked
    const removeButtons = document.querySelectorAll(".remove-button");
    removeButtons.forEach(function(button) {
        button.addEventListener("click", function(event) {
            const confirmed = confirm("Are you sure you want to remove this item from the cart?");
            if (!confirmed) {
                event.preventDefault(); // Prevents form submission if user cancels
            }
        });
    });
});
document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById("cartModal");
    const closeBtn = document.querySelector(".close-button");

    // Show the modal automatically when the page loads
    modal.classList.add("show");

    // Function to close the modal and redirect
    closeBtn.addEventListener("click", function() {
        modal.classList.remove("show");
        window.location.href = "appetizers.jsp"; // Redirects to appetizers.jsp
    });

    // Close the modal when clicking outside the modal content
    window.addEventListener("click", function(event) {
        if (event.target === modal) {
            modal.classList.remove("show");
            window.location.href = "appetizers.jsp"; // Redirects to appetizers.jsp
        }
    });
});


function validateQuantity(form) {
           const quantityInput = form.quantity;
           const quantityValue = parseInt(quantityInput.value);

           // Optional: Limit maximum quantity (for example, to 99)
           if (quantityValue > 99) {
               alert("Quantity cannot exceed 99.");
               quantityInput.focus();
               return false; // Prevent form submission
           }

           return true; // Allow form submission
       }
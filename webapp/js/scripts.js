function confirmDelete() {
    return confirm("Are you sure you want to delete this food item?");
}

function loadContent(page) {
    const mainContent = document.getElementById('mainContent');

    fetch(page)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            mainContent.innerHTML = data; // Load the content into the main section
            
            // After loading new content, reattach delete confirmation to specific forms
            attachDeleteConfirmation();
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
}

// Function to attach delete confirmation to delete forms
function attachDeleteConfirmation() {
    const deleteForms = document.querySelectorAll('#mainContent form[action="deleteFoodItem"]'); 
    deleteForms.forEach(form => {
        form.onsubmit = function() {
            return confirmDelete(); // Call confirmDelete on form submission
        };
    });
}



	
	  function confirmLogout() {
	      // Show confirmation dialog
	      const userConfirmed = confirm("Are you sure you want to log out?");

	      // If user confirmed, redirect to the logout URL
	      if (userConfirmed) {
	          window.location.href = "logout"; // Redirect to the logout URL
	      }
	      // If user canceled, do nothing (just close the dialog)
	  }




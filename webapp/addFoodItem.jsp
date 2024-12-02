<div class="container">
    <div class="main-content">
        <h2 class="mb-4 text-center">Add New Food Item</h2>
        <div class="form-container">
            <form id="foodForm" action="submitFoodItem" method="post" class="form" novalidate>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter food name" required>
                    <div class="invalid-feedback"></div>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select class="form-control" id="category" name="category" required>
                        <option value="">Select a category</option>
                        <option value="Appetizers">Appetizers</option>
                        <option value="Main Course">Main Course</option>
                        <option value="Desserts">Desserts</option>
                        <option value="Beverages">Beverages</option>
                    </select>
                    <div class="invalid-feedback"></div>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" id="price" name="price" step="0.01" min="0.01" placeholder="Enter price" required>
                    <div class="invalid-feedback">Please enter a price greater than 0</div>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="4" placeholder="Enter description" required></textarea>
                    <div class="invalid-feedback">Please provide a description</div>
                </div>
                <div class="form-group">
                    <label for="image_url">Image URL</label>
                    <input type="url" class="form-control" id="image_url" name="image_url" placeholder="Enter image URL" pattern="https?://.+">
                    <div class="invalid-feedback">Please enter a valid URL starting with http:// or https://</div>
                </div>
                <button type="submit" class="btn-sub">Add Item</button>
            </form>
        </div>
    </div>
</div>

<script>
    // Custom frontend validation
    (function () {
        'use strict';
        var form = document.getElementById('foodForm');
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    })();
</script>

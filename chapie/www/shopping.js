function product_Item_Onclick(){
    let x = document.getElementById("product_id").value;
    console.log(x);
}

function shop_cart(){
    window.location.href="wishlist.php";
}

const form = document.querySelector('form');

form.addEventListener('submit', function(event) {
    event.preventDefault();
    const searchQuery = form.querySelector('input').value;
    searchProducts(searchQuery);
});

function searchProducts(searchQuery) {
    // Send an AJAX request to the server to retrieve the search results
    // Here's an example using jQuery:
    $.ajax({
        url: 'products_list.php',
        type: 'POST',
        data: { query: searchQuery },
        success: function(response) {
            window.location.href='products_list.php?search=' + searchQuery;

            // Display the search results on the page
            //const resultsContainer = document.querySelector('#search_elements');
            //resultsContainer.innerHTML = response;
        }
    });
}

function search_Btn(){
    window.location.href='products_list.php';
}



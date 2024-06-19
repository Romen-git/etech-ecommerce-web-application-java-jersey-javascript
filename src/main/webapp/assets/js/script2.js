/* $('#image-dev').spartanMultiImagePicker({
     fieldName: 'file[]',
     maxCount: 2,


 });*/


document.querySelector('#add-product').addEventListener('click', (evt) => {
    evt.preventDefault();
    let productName = document.querySelector('#name').value;
    let productPrice = document.querySelector('#price').value;
    let selectedCategory = document.querySelector('#category');
    let productCategory = selectedCategory.options[selectedCategory.selectedIndex].text;
    let productDescription = document.querySelector('#description').value;
    let productStock = document.querySelector('#stock').value;
    console.log(productDescription)

    fetch('/etech/admin/api/product', {
        headers: {
            'Content-Type': 'application/json'
        },
        method: 'post',
        body: JSON.stringify({
            name: productName,
            price: productPrice,
            description: productDescription,
            category: productCategory,
            stock: productStock
        })
    }).then(response => response.json())
        .then(data => {

            uploadImages(data.pid);
        })
});


function uploadImages(id) {

    let formData = new FormData();
    let inputs = document.querySelectorAll('input[type=file]');
    inputs.forEach((input, index) => {
        if (inputs.length - 1 === index) {
            if (index !== -1) {
                let file = input.files[0];

                formData.append("file[]", file);
            }
        } else {
            if (index !== -1 && index !== inputs.length - 1) {
                let file = input.files[0];

                formData.append("file[]", file);
            }
        }


    });


    fetch('/etech/admin/api/product/' + id + '/upload-image', {

        method: 'post',
        body: formData
    }).then(response => response.json())
        .then(data => {
            console.log(data);
            window.location.href = '/etech/admin/product';
        }).catch(error => {
        console.error('Error:', error);
    });
}

document.querySelector('#add-category').addEventListener('click', (evt) => {
    evt.preventDefault();
    let categoryName = document.querySelector('#categoryname').value;

    fetch('/etech/admin/api/product/category', {
        headers: {
            'Content-Type': 'application/json'
        },
        method: 'post',
        body: JSON.stringify({
            name: categoryName,

        })
    }).then(response => response.json())
        .then(data => {
            console.log(data);
            window.location.href = '/etech/admin/product';

        }).catch(error => {
        console.error('Error:', error);
    });
});

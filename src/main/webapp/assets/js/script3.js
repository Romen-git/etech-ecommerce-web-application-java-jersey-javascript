let productId;
let productCategory;

function loadProduct() {
    fetch('/etech/admin/api/product/selectedproduct')
        .then(response => response.json())
        .then(data => {
            let name = document.querySelector('#name');
            let description = document.querySelector('#description');
            let category = document.querySelector('#category');
            let price = document.querySelector('#price');
            let stock = document.querySelector('#stock');

            name.value = data.name;
            description.value = data.description;
            price.value = data.price;
            stock.value = '1000';

            loadCategories(data.id);
            loadImages(data.id);
            productId = data.id;
            productCategory = data.category;
        });
}

function loadCategories(id) {

    fetch('/etech/admin/api/product/category')
        .then(response => response.json())
        .then(data => {
            let select = document.querySelector('#category');
            select.innerHTML = "";
            //document.querySelector('#table-products tbody').innerHTML = "";

            data.forEach(category => {
                let option = document.createElement('option');
                option.value = category.id;
                option.innerHTML = category.name;
                if (category.id === productCategory) {
                    option.selected = true;
                }
                select.add(option);
            });

        });

}

let count1 = 0;
let last_index1 = 0;
let total_count1 = 0;
let productEdit = false;
let itemsNo = 0;
let productEdit1 = false;

function loadImages(id) {
    productEdit1 = true;
    fetch('/etech/admin/api/product/images/' + id)
        .then(response => response.json())
        .then(data => {

            let div = document.querySelector('#image-dev');
            div.innerHTML = "";
            let html = '';
            productEdit = true;
            for (let i = 0; i < data.length; i++) {
                last_index1 = count1;
                let innerhtml = '<div class="col-md-4 col-sm-4 col-xs-6 spartan_item_wrapper"' +
                    ' data-spartanindexrow="' + i + '" style="margin-bottom : 20px; "> ' +
                    '<div style="position: relative;"> ' +
                    '<div class="spartan_item_loader" data-spartanindexloader="' + i + '"' +
                    ' style=" position: absolute; width: 100%; height: 200px; background: rgba(255,255,255, 0.7); z-index: 22; text-align: center; align-items: center; margin: auto; justify-content: center; flex-direction: column; display : none; font-size : 1.7em; color: #CECECE;"> ' +
                    '<svg xmlns="http://www.w3.org/2000/svg" fill="none"' +
                    ' viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"> ' +
                    '<path stroke-linecap="round" stroke-linejoin="round"' +
                    ' d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path> ' +
                    '</svg> ' +
                    '</div> ' +
                    '<label class="file_upload"' +
                    ' style="width: 350px; height: 200px; border: 2px dashed #ddd; border-radius: 3px; cursor: pointer; text-align: center; overflow: hidden; padding: 5px; margin-top: 5px; margin-bottom : 5px; position : relative; display: flex; align-items: center; margin: auto; justify-content: center; flex-direction: column;"><a' +
                    ' href="javascript:void(0)" data-spartanindexremove="' + i + '"' +
                    ' style="right: 3px; top: 3px; background: rgb(237, 60, 32); border-radius: 3px; width: 30px; height: 30px; line-height: 30px; text-align: center; text-decoration: none; color: rgb(255, 255, 255); position: absolute !important;"' +
                    ' class="spartan_remove_row"> ' +
                    '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"' +
                    ' viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"> ' +
                    '<path stroke-linecap="round" stroke-linejoin="round"' +
                    ' d="M6 18L18 6M6 6l12 12"></path> ' +
                    '</svg> ' +
                    '</a><img' +
                    ' style="width: 64px; margin: 0px auto; vertical-align: middle; display: none;"' +
                    ' data-spartanindexi="' + i + '"' +
                    ' src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAQAAAAAYLlVAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADdcAAA3XAUIom3gAAAAHdElNRQfiBA4PGSVZX/u4AAAGhUlEQVRo3u2ZbXBU5RXHf8/NOy+BSOWtCbB3N5CIQBCwzDjjuE4xQUVKZ1od+WIhATttRVFpK9UPRUorg5bUtxacynSmQ6e2Io6lSgi0UxFrjNNRKrD3uUuIaBgmljdrJpvc0w/P7mbzstmkuQtfOJ/uOffs8//d5z773HvOhat2hU31dp0yq8ob7cfA0mZ9EDw/DAB3rrdJLWaijxcnaLWvc2PFxYwATXklG3mMPB/Fe+wUq4MNGQD0X1iajFzgS1+ES8hPzITcG9o9CIBbKzsAOMdGeSvk+HPhkYLcKm8t3wFQ7cy2z6RLLNXntWjRH5ya6o90qrl36ZgWLfpP6TKsnHsoBjpy7p32qf8A9l42A/DNyLVpAOQGAPndjI/9lwf4z2a+ALAWpQHgBgCasiMPC2O8bw7SAcwEIJItAJDjAMxKB6AARLIHoDwAlZMO4ArbVYDc4SS3FnXN88bkN5d9fkVmwK3rbPPeYX/nWb0tWnjZZ8C5T36ThF7fXUzdZZ0ByVHbUn1VG5l/WQF0Jdf0juTcNFBea1GWAKx+24j0i0TmO//uPOs8nhWAlqPmkZLyw3d7+9Eqq0FVMlr9VP88CwDhLn7SK/BK4Eiq686ThuRN+qH+he8AYNfLE3TGnd9T20t+LgdkAgCXANjgPjXUcdP+DaPjvXVqtHo60GZ85bEpuqN7sTVGNQWOpWbqOXIAI/9La7t3iOkgjzoq9OgIAKLjvQYWCLLi+C2zTieigTb29M10rucAXwFge/AhOBnuPsQ0UI84KvTI/3kLIsXemywAIJR7cLB3xchsdYBrAVR98EGAGdHuMK0A6mG9jYw2AMCxsepNbky65bGDJ6ekkb/OajSljKq31yWiM10vzCcArM+M0A/g6Ji8fWoxAP/gZTNi98Ho5P4/PVmZlP9VjzxAuZYwp+MITw8LoG104RuYPe7tjqX2Kl4CYJbXDyFa0d3IpLj8A32HDTmExbxlP8Q9QwZoLfridW6Oy9fMvqTErosjVHQ3upN6Mt1ZXiOTAeTZ/vIAwYhKIIwbIkC0sHMvYQAOx5bOvgSgxK6TnQCqUhqdeOmqZ8pBphj50A/SDR08Yd3KZ2SwJECkoHsPX4/L1/RUtEqCa+Kl23Wq0ZkIujwhz3Pp5QHs4yxPbF5S6k4fKEdpAVDVso7bAdQ7ndV9C2pR0RdlDQAfeWusP/JVIx/8/mDyTo16gFspSAl9KK+rPcH3BgBAE0wn3wchYc8Hv5deXM+UelU98Dm1S9b1tC4SAEbmiFSXXxj4Z6LcF1g7NHl3mexmVErgDKpX6+MTtcrebw5TFuFg8qDE/i4vxp0X7EEmX98prxp51S5PyO3WlODk4CSvzPsGWzDjl8pb7uq+M/Cud1t6+eQsbFB3e7uDW1XaSurjCflHzf7AG1Zt4lGWhJvGDm4D4KKaY7cAWrRo0Ucixfhizh+0aNGek1wxkWL3YbeuKdkActZqT4sW3SAqCeCEfZK/24znbk+JPalFi3Nfyjw8E7/s+5NrwJ/iNFJgPWcOCn+cEl4IEH++AJD/GKZifurYWF9LMxU270Wqdup/B8sr+1JWATA29w5/Ae4C4HP775kyQ4dVOwArhlUbZrTrAWg2TrSqazyAMi+rUyO3AOR8Zh8HkGaWgKr0F6AUwLRk3D3e8l7Tu8xaBiC4W+0NwPssASb7W55fAyDHoClPqtMlyQoA5QIwzsI0UNQQhs9sbQCqBBbG5Gd9Sxljql2eBBK366zFCQDKfQE4BWAea6FN9jiryCqyitgPIDuNF5gY2gWAadu1WfEG3cLhqw1gHwJQE7/W7kBHoCPQIV6qZ1pWTXliqut/WvIegFp5wvYB4FUzA9GvZUos+TamxfFnK/8VzgOjcn7bUjJSffttUxF49ZKyuFUXAF09EXeSMlt1y6lD1rRPWQ/AzbGP9MpI6UgAlLAFgBvdrSnRfQBqb09EnpcJgLA63NX/e8EZzo2AIdcsQZBnCzaUxb88ODepC0GzPogWelt4EIBfB++Pf7A4ml/0uPxoeB2zIZhj1Qb+1jukF8kuVQlAS2xOxcWUb0bOAjarRX0bMSM04TU5rJpzmyFWpeaziG9hOivn1HLzxOizAbnTmeeNGrZQH1OKldwxyPm/xmoTNbc/O+AA5tSoZ6gY4MQFtd5+KQUmWwDQlFdSxxKqmJEM/YvXZGeotddsZA8gYXqcmivF1umO1sr27KtdtWHb/wAERFuYrBJ1jgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOC0wNC0xNFQxNToyNTozNyswMjowMKaBIu8AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTgtMDQtMTRUMTU6MjU6MzcrMDI6MDDX3JpTAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAABJRU5ErkJggg=="' +
                    ' class="spartan_image_placeholder"> ' +
                    '<p data-spartanlbldropfile="' + i + '"' +
                    ' style="color : #5FAAE1; display: none; width : auto; ">Drop file ' +
                    'here</p><img id="downimg1" style="width: 100%;height: 100%;object-fit: contain; vertical-align: middle; "' +
                    ' class="img_" data-spartanindeximage="' + i + '"' +
                    ' src="/etech' + data[i] + '"><input id="downimg" class="form-control spartan_image_input" accept="image/*" data-spartanindexinput="' + i + '" style="display : none" name="file[]" type="file"> </label> </div> </div>';
                html = html + innerhtml;
                count1++;
                total_count1++;
            }

            div.innerHTML = html;

        });

}

loadProduct();

document.querySelector('#update-product').addEventListener('click', (evt) => {
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
        method: 'put',
        body: JSON.stringify({
            id: productId,
            name: productName,
            price: productPrice,
            description: productDescription,
            category: productCategory,
            stock: productStock
        })
    }).then(response => response.json())
        .then(data => {

            updateImages(productId);
        })
});


function updateImages(id) {

    let formData = new FormData();
    let images = document.querySelectorAll('#downimg1');
    let url = [];
    if (images !== null) {

        images.forEach((image) => {
            url.push(image.getAttribute("src"));
        });

    }
    let encodedurl = encodeURIComponent(JSON.stringify(url));

    let inputs = document.querySelectorAll('input[type=file]');
    inputs.forEach((input, index) => {
        alert(input.getAttribute("id"));
        if (inputs.length - 1 === index) {

            if (index !== -1 && input.getAttribute("id") === null) {
                let file = input.files[0];

                formData.append("file[]", file);
            }
        } else {
            if (index !== -1 && index !== inputs.length - 1 && input.getAttribute("id") === null) {
                let file = input.files[0];

                formData.append("file[]", file);
            }
        }


    });


    fetch('/etech/admin/api/product/' + productId + '/upload-image/' + encodedurl, {

        method: 'put',
        body: formData
    }).then(response => response.json())
        .then(data => {
            console.log(data);
            window.location.href = '/etech/admin/product';
        }).catch(error => {
        console.error('Error:', error);
    });
}
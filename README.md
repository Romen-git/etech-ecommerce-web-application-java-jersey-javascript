# ETech - Java Ecommerce Web Application

## (currently being updated...)

This project is an e-commerce web application built using Java and Jersey. The application supports e-commerce
functionalities such as product listing, user authentication, shopping cart, order processing, email verification and
more. Additionally, it includes admin functionalities for managing products, orders etc.

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

## Features

- User authentication and authorization
- Email verification
- Product management (listing, adding, updating, deleting)
- Shopping cart functionality
- Order processing and management
- RESTful API endpoints
- Error handling and validation
- Admin functionalities for managing products and orders

## Technologies

- Java
- Jersey (JAX-RS)
- Javascript
- Bootstrap
- Maven
- Hibernate (JPA)
- MySQL
- JWT (JSON Web Token) for authentication
- Mailtrap for email verification
- Embedded Tomcat

## Installation

1. **Clone the repository**
    ```sh
    git clone https://github.com/Romen-git/etech-ecommerce-web-application-java-jersey-javascript.git
    cd etech-ecommerce-web-application-java-jersey-javascript
    ```

2. **Setup MySQL database**
    - Run `database/etechdb.sql` to create the database.
    - Run `database/etechdb_admin.sql`, `database/etechdb_app_settings.sql`, `database/etechdb_product_image.sql`, `database/etechdb_productcategory.sql`, `database/etechdb_product.sql` to update tables data.

3. **Update configuration files**
    - Edit `src/main/resources/hibernate.cfg.xml` to set your database configuration.
    - Create `src/main/resources/db.properties` and `src/main/resources/application.properties` as described in the
      [Configuration](#configuration) section.

4. **Build the project**
    ```sh
    mvn clean install
    ```

## Configuration

### Mailtrap Setup

1. **Create a Mailtrap Account**
    - Go to [Mailtrap](https://mailtrap.io/) and sign up for a free account.

2. **Set Up a New Inbox**
    - Once logged in, create a new inbox.
    - Note the SMTP credentials (host, port, username, password) for the new inbox.

3. **Configure the Application**

### Using a Properties File

1. **Create a `src/main/resources/db.properties` file with the following content:**
   
   ```properties
   db.user=root
   db.password=password
   ```
2. **Create a `src/main/resources/application.properties` file with the following content:**

   ```properties
   mail.host=sandbox.smtp.mailtrap.io
   mail.port=port
   mail.username=username
   mail.password=password
   app.mail=mail
   ```

## Running the Application

1. **Start the Embedded Tomcat Server**

   ```sh
   mvn exec:java -Dexec.mainClass="com.ro.etech.Main"
   ```
2. **The application will be accessible at:**

   ```bash
   http://localhost:8080/etech
   ```

## Usage

1. **Register a new user**

   ```bash
   GET /signin
   ```
   ```bash
   POST /signin
   ```

2. **Verify email address**

   - After registering, an email will be sent to the user's email address with a verification link.
   - Check the inbox in Mailtrap to find the verification email.
   - Click the verification link to verify the email address.

3. **Login with an existing user**

   ```bash
   GET /login
   ```
   ```bash
   POST /login
   ```

4. **Access the product listing**

   ```bash
   GET /admin/api/product
   ```
   
5. **Admin functionalities**

   - Manage products
     - Add, update, delete products
     
   - Manage orders
     - View, update order status

## API Endpoints

   - **Authentication**
     - `POST /signin` - Register a new user and send email verification
     - `GET /verify` - Verify email address using the link sent in the email
     - `POST /login` - Login and obtain JWT token
   

   - **Products**
     - `GET /admin/api/product` - List all products
     - `POST /admin/api/product` - Add a new product (Admin only)
     - `PUT /admin/api/product` - Update a product (Admin only)
     - `DELETE /admin/api/product/{id}` - Delete a product (Admin only)

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository
2. Create a new feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

## License

This project is licensed under the BCD License. See the [LICENSE](LICENSE) file for details.
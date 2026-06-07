# Cinema-Booking-Website-with-XAMPP (PHP & MySQL)

A simple web-based cinema booking application developed using PHP, MySQL, HTML, CSS, and JavaScript. The system allows users to browse available movies, view showtimes, and create bookings through a user-friendly interface.

## Features

* Browse available movies
* View movie runtimes and showtimes
* Display ticket prices
* Create bookings for selected showtimes
* Input validation for customer information
* Persistent data storage using MySQL
* Responsive and easy-to-use interface

## Technologies Used

### Backend

* PHP
* MySQL
* MySQLi

### Frontend

* HTML5
* CSS3
* JavaScript

### Development Environment

* XAMPP
* Apache Web Server
* phpMyAdmin

## Database Structure

The application uses a relational database consisting of the following main tables:

### Movies

Stores movie information:

* Movie_ID
* Movie_Title
* Movie_Runtime

### Showtimes

Stores screening information:

* Showtime_ID
* Movie
* Datetime
* Price

### Bookings

Stores customer reservations:

* Booking_ID
* Showtime
* User_Name
* No_of_Seats

## How It Works

1. Users browse available movies.
2. Each movie displays its available showtimes.
3. Users select a showtime and proceed to booking.
4. The system collects customer information and number of seats.
5. Booking information is stored in the MySQL database.

## Installation

### Prerequisites

* XAMPP
* PHP 8+
* MySQL

### Setup Steps

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cinema-booking-system.git
```

2. Move the project folder into the XAMPP htdocs directory:

```text
xampp/htdocs/
```

3. Start:

   * Apache
   * MySQL

from the XAMPP Control Panel.

4. Create a MySQL database:

```sql
CREATE DATABASE Movie_Project;
```

5. Import the provided SQL schema.

6. Update database credentials inside:

```php
config.php
```

if necessary.

7. Open your browser and navigate to:

```text
http://localhost/cinema-booking-system/
```

## Security Notes

This project uses:

* Input validation
* Prepared statements for booking insertion
* Output escaping using `htmlspecialchars()`

These practices help reduce common web application vulnerabilities such as SQL Injection and Cross-Site Scripting (XSS).

## Learning Outcomes

Through this project I practiced:

* PHP backend development
* Relational database design
* SQL queries
* Database connectivity with MySQLi
* Form handling and validation
* Full-stack web application development
* Software project organization

## Future Improvements

* User authentication and registration
* Administrative dashboard
* Seat selection system
* Online payment integration
* REST API implementation
* Migration to Laravel framework
* Docker containerization

## Author

Nikolaos Tassopoulos

Electrical & Electronics Engineering Student
Minor in Information Technology

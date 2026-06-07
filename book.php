<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require "config.php";

$showtimeId = isset($_GET["showtime_id"]) ? (int)$_GET["showtime_id"] : 0;

$infoRes = $conn->query("
  SELECT s.Showtime_ID, s.Datetime, s.Price, m.Movie_Title
  FROM Showtimes s
  JOIN Movies m ON m.Movie_ID = s.Movie
  WHERE s.Showtime_ID = $showtimeId
");

$info = $infoRes->fetch_assoc();
$message = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $name  = trim($_POST["Client_Name"] ?? "");
  $seats = (int)($_POST["No_of_Seats"] ?? 0);

  if ($name === "" || $seats < 1) {
    $message = "Please enter a name and at least 1 seat.";
  } else {
    $stmt = $conn->prepare("INSERT INTO Bookings (Showtime, User_Name, No_of_Seats) VALUES (?, ?, ?)");

    $stmt->bind_param("isi", $showtimeId, $name, $seats);
    $stmt->execute();
    $stmt->close();

    $message = "Booking saved!";
  }
}
?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Book</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <a href="index.php"><- Go Back!</a>

  <h1>Booking</h1>
  <p class="small">
    Movie: <?php echo htmlspecialchars($info["Movie_Title"]); ?><br>
    Showtime: <?php echo htmlspecialchars($info["Datetime"]); ?> — €<?php echo number_format((float)$info["Price"], 2); ?>
  </p>

  <?php if ($message !== ""): ?>
    <p class="small"><?php echo htmlspecialchars($message); ?></p>
  <?php endif; ?>

  <div class="card">
    <form method="post">
      <p>
        <label>Your name<br>
          <input type="text" name="Client_Name" required>
        </label>
      </p>

      <p>
        <label>Seats<br>
          <input type="number" name="No_of_Seats" min="1" value="1" required>
        </label>
      </p>

      <p id="jsInfo" class="small">You selected 1 seat(s).</p>

      <button type="submit">Confirm</button>
    </form>
  </div>

  <script>
    const seatsInput = document.querySelector('input[name="No_of_Seats"]');
    const info = document.getElementById('jsInfo');
    seatsInput.addEventListener('input', () => {
      info.textContent = "You selected " + seatsInput.value + " seat(s).";
    });
  </script>
</body>
</html>

<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require "config.php";

$movies = $conn->query("SELECT Movie_ID, Movie_Title, Movie_Runtime FROM Movies ORDER BY Movie_Title ASC");
?>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Cinema</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Cinema</h1>
  <p class="small">Here are your options...</p>

  <?php while ($m = $movies->fetch_assoc()): ?>
    <div class="card">
      <h2><?php echo htmlspecialchars($m["Movie_Title"]); ?></h2>
      <div class="small">Runtime: <?php echo (int)$m["Movie_Runtime"]; ?> mins</div>

      <p>Showtimes:</p>
      <ul>
        <?php
          $movieId = (int)$m["Movie_ID"];
          $showtimes = $conn->query("
            SELECT Showtime_ID, Datetime, Price
            FROM Showtimes
            WHERE Movie = $movieId
            ORDER BY Datetime ASC
          ");
        ?>

        <?php if ($showtimes->num_rows === 0): ?>
          <li class="small">No showtimes yet.</li>
        <?php else: ?>
          <?php while ($s = $showtimes->fetch_assoc()): ?>
            <li>
              <?php echo htmlspecialchars($s["Datetime"]); ?>
              — €<?php echo number_format((float)$s["Price"], 2); ?>
              — <a href="book.php?showtime_id=<?php echo (int)$s["Showtime_ID"]; ?>">Book</a>
            </li>
          <?php endwhile; ?>
        <?php endif; ?>
      </ul>
    </div>
  <?php endwhile; ?>

</body>
</html>
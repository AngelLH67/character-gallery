<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a character - Dragon Ball Gallery</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <nav>
        <h2>Dragon Ball Gallery</h2>

        <div class="nav-links">
            <a href="index.html">Home</a>
            <a href="details.html">Details</a>
            <a href="about.html">About</a>
            <a href="new-character-form.html">Add a Character</a>
        </div>
    </nav>

    <main class="form-page">

        <h1>Add a New Character</h1>
        <p>
            Use the form below to add a new character to the gallery.
        </p>

        <form>
            <label for="name">Character Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter character name" required>

            <label for="universe">Universe:</label>
            <input type="text" id="universe" name="universe" placeholder="Enter universe" required>

            <label for="role">Role:</label>
            <input type="text" id="role" name="role" placeholder="Enter role" required>

            <label for="description"> Short Description:</label>
            <textarea id="description" name="description" rows="5" placeholder="Enter short description"
                required></textarea>

            <label for="image">Image URL:</label>
            <input type="url" id="image" name="image" placeholder="Enter image URL" required>

            <button type="submit">Add Character</button>

        </form>

    </main>

    <footer>
        <p>&copy; 2026 Dragon Ball Character Gallery.</p>
    </footer>


</body>

</html>
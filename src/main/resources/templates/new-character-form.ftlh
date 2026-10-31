
<#import "layout.ftlh" as layout>

<@layout.page title="Add a Character">
    <section class="form-page">
        <h1>Add a New Character</h1>
        <p>Use the form below to add a new character to the gallery.</p>

        <form action="/characters" method="post">
            <label for="name">Character Name:</label>
            <input type="text" id="name" name="name"
                   placeholder="Enter character name" required>

            <label for="universe">Universe:</label>
            <input type="text" id="universe" name="universe"
                   placeholder="Enter universe" required>

            <label for="species">Species:</label>
            <input type="text" id="species" name="species"
                   placeholder="Enter species" required>

            <label for="role">Role:</label>
            <input type="text" id="role" name="role"
                   placeholder="Enter role" required>

            <label for="description">Short Description:</label>
            <textarea id="description" name="description" rows="5"
                      placeholder="Enter short description" required></textarea>

            <label for="imageUrl">Image URL:</label>
            <input type="text" id="imageUrl" name="imageUrl"
                   placeholder="Example: Enter image image address here">

            <button type="submit" class="button">Add Character</button>
        </form>
    </section>
</@layout.page>

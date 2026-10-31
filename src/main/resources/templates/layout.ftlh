<#macro page title>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${title} - Dragon Ball Gallery</title>
        <link rel="stylesheet" href="/css/styles.css">
    </head>

    <body>

        <nav>
            <h2>Dragon Ball Gallery</h2>

            <div class="nav-links">
                <a href="/">Home</a>
                <a href="/characters/3">Details</a>
                <a href="/about">About</a>
                <a href="/characters/new">Add a Character</a>
            </div>
        </nav>

        <main>
            <#if successMessage??>
                <p class="success-message">${successMessage}</p>
            </#if>

            <#nested>
        </main>

        <footer>
            <p>&copy; 2026 Dragon Ball Character Gallery</p>
        </footer>

    </body>

    </html>
</#macro>
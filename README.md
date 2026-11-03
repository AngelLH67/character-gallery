# Dragon Ball Character Gallery

The Dragon Ball Character Gallery is a Spring Boot application that combines a REST API with a FreeMarker MVC website for managing Dragon Ball characters. Users can browse, search, view, add, edit, and delete characters. Character data is stored in a Neon PostgreSQL database.

## Live Deployment

**Live Website:** https://dragonball-api-5i0o.onrender.com/

**REST API:** https://dragonball-api-5i0o.onrender.com/api/characters

The application is deployed on Render and uses Neon PostgreSQL for persistent database storage.

### Cold-Start Note

This application uses Render's free tier. The service may sleep after a period of inactivity. The first request after the service has been idle may take about a minute to load while the service wakes up.

## Entity: TvCharacter

The `TvCharacter` entity represents a Dragon Ball character.

| Attribute | Type | Rules |
|---|---|---|
| `characterId` | `long` | Primary key; automatically generated |
| `name` | `String` | Required; cannot be null, empty, or blank |
| `description` | `String` | Required; cannot be null, empty, or blank |
| `universe` | `String` | Additional character attribute |
| `species` | `String` | Additional character attribute |
| `role` | `String` | Additional character attribute |
| `imageUrl` | `String` | Stores the character's image path or URL |

## Website Pages and Routes

The website uses Spring Boot MVC and FreeMarker templates.

| Method | Route | Template | Description |
|---|---|---|---|
| GET | `/` | `index.ftlh` | Displays characters with name search and universe filtering |
| GET | `/characters/{id}` | `details.ftlh` | Displays detailed character information |
| GET | `/about` | `about.ftlh` | Displays information about the gallery |
| GET | `/characters/new` | `new-character-form.ftlh` | Displays the add-character form |
| POST | `/characters` | `new-character-form.ftlh` | Saves a new character and redirects to the gallery |
| GET | `/characters/{id}/edit` | `new-character-form.ftlh` | Displays the pre-filled edit form |
| POST | `/characters/{id}` | `new-character-form.ftlh` | Updates a character and redirects to its details |
| POST | `/characters/{id}/delete` | None | Deletes a character and redirects to the gallery |
| Unknown character ID | N/A | `error.ftlh` | Displays a friendly character-not-found page |

The website uses a shared `layout.ftlh` template for consistent navigation, styling, and success messages.

## REST API Endpoints

All endpoints use the base path `/api/characters`.

| Method | Path | Description | Success Status |
|---|---|---|---|
| GET | `/api/characters` | Retrieve all characters | 200 OK |
| GET | `/api/characters/{id}` | Retrieve a character by ID | 200 OK |
| POST | `/api/characters` | Create a character | 201 Created |
| PUT | `/api/characters/{id}` | Update an existing character | 200 OK |
| DELETE | `/api/characters/{id}` | Delete a character | 204 No Content |
| GET | `/api/characters?universe=Universe%207` | Filter characters by universe | 200 OK |
| GET | `/api/characters?name=gok` | Search names using a partial, case-insensitive match | 200 OK |

Requests for a character ID that does not exist return `404 Not Found`. POST and PUT requests with a missing or blank name or description return `400 Bad Request`.

## Example POST Request

**Method:** `POST`

**Path:** `/api/characters`

**Request Body:**

```json
{
  "name": "Goku",
  "description": "A Saiyan warrior who protects Earth.",
  "universe": "Universe 7",
  "species": "Saiyan",
  "role": "Hero"
}
```

**Expected Success Status:** `201 Created`

## Example PUT Request

**Method:** `PUT`

**Path:** `/api/characters/3`

**Request Body:**

```json
{
  "name": "Goku",
  "description": "A Saiyan warrior and defender of Earth.",
  "universe": "Universe 7",
  "species": "Saiyan",
  "role": "Hero"
}
```

**Expected Success Status:** `200 OK`

The ID in the URL identifies the character being updated. The example uses ID `3`, which must exist for the request to succeed.

## Database Configuration

The database connection is configured using the `SPRING_DATASOURCE_URL` environment variable in Render. Passwords and database connection strings are intentionally excluded from this repository.

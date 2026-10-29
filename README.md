
# Dragon Ball Character API

The Dragon Ball Character API is a Spring Boot REST API for managing characters from the Dragon Ball franchise. It allows users to create, retrieve, update, delete, filter, and search character records. Character data is stored in a Neon PostgreSQL database.

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

## API Endpoints

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

**Request body:**

```json
{
  "name": "Goku",
  "description": "A Saiyan warrior who protects Earth.",
  "universe": "Universe 7",
  "species": "Saiyan",
  "role": "Hero"
}
```

**Expected success status:** `201 Created`

## Example PUT Request

**Method:** `PUT`

**Path:** `/api/characters/3`

**Request body:**

```json
{
  "name": "Goku",
  "description": "A Saiyan warrior and defender of Earth.",
  "universe": "Universe 7",
  "species": "Saiyan",
  "role": "Hero"
}
```

**Expected success status:** `200 OK`

The ID in the URL identifies the character being updated. The example uses ID `3`, which must exist for the request to succeed.

## Deployment

**Render API URL:** https://dragonball-api-5i0o.onrender.com/api/characters  

The API is deployed on Render and uses Neon PostgreSQL for persistent database storage.

### Cold-Start Note

This API uses Render's free tier. The service may sleep after a period of inactivity. The first request after the service has been idle can take up to a minute while it starts.

## Database Configuration

The database connection is configured using the `SPRING_DATASOURCE_URL` environment variable in Render. Passwords and database connection strings are intentionally excluded from this repository.

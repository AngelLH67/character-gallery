<#import "layout.ftlh" as layout>

       <@layout.page title="Add a Character">
              <section class="form-page">
                     <#if character??>
                            <h1>Edit Character</h1>
                            <#else>
                                   <h1>Add a New Character</h1>
                     </#if>
                     <p>Use the form below to add a new character to the gallery.</p>

                     <#if character??>
                            <form action="/characters/${character.characterId}" method="post">
                                   <#else>
                                          <form action="/characters" method="post">
                     </#if>
                     <label for="name">Character Name:</label>
                     <input type="text" id="name" name="name" placeholder="Enter character name"
                            value="${(character.name)!''}" required>

                     <label for="universe">Universe:</label>
                     <input type="text" id="universe" name="universe" placeholder="Enter universe"
                            value="${(character.universe)!''}" required>

                     <label for="species">Species:</label>
                     <input type="text" id="species" name="species" placeholder="Enter species"
                            value="${(character.species)!''}" required>

                     <label for="role">Role:</label>
                     <input type="text" id="role" name="role" placeholder="Enter role" value="${(character.role)!''}"
                            required>

                     <label for="description">Short Description:</label>
                     <textarea id="description" name="description" rows="5" placeholder="Enter short description"
                            required>${(character.description)!''}</textarea>

                     <label for="imageUrl">Image URL:</label>
                     <input type="text" id="imageUrl" name="imageUrl" placeholder="Enter image URL"
                            value="${(character.imageUrl)!''}">

                     <button type="submit" class="button">
                            <#if character??>
                                   Save Changes
                                   <#else>
                                          Add Character
                            </#if>
                     </button>
                     </form>
              </section>
       </@layout.page>
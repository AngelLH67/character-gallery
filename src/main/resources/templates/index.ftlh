
<#import "layout.ftlh" as layout>

<@layout.page title="Dragon Ball Character Gallery">

    <header>
        <h1>Dragon Ball Character Gallery</h1>
        <p>Explore some of the most iconic characters from the Dragon Ball series!</p>

        <form action="/" method="get" class="search-form">
            <input
                type="text"
                name="name"
                placeholder="Search characters..."
                value="${searchName!''}">

            <select name="universe">
                <option value="">All Universes</option>
                <option value="Universe 7" <#if selectedUniverse?? && selectedUniverse == "Universe 7">selected</#if>>Universe 7</option>
                <option value="Universe 6" <#if selectedUniverse?? && selectedUniverse == "Universe 6">selected</#if>>Universe 6</option>
            </select>

            <button type="submit" class="button">Search</button>
        </form>
    </header>

    <section class="gallery">

        <#if characters?has_content>
            <#list characters as character>
                <div class="character-card">

                    <#if character.imageUrl?? && character.imageUrl?has_content>
                        <img src="${character.imageUrl}" alt="${character.name}">
                    <#else>
                        <img src="/images/placeholder.svg" alt="No image available">
                    </#if>

                    <h2>${character.name}</h2>
                    <p><strong>Universe:</strong> ${character.universe!''}</p>
                    <p><strong>Role:</strong> ${character.role!''}</p>
                    <p>${character.description!''}</p>

                    <a class="button" href="/characters/${character.characterId}">View Details</a>
                </div>
            </#list>
        <#else>
            <p>No characters found. Try a different search.</p>
        </#if>

    </section>

</@layout.page>

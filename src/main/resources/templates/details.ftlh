<#import "layout.ftlh" as layout>

    <@layout.page title="${character.name} - Character Details">

        <main class="details-page">

            <h1>${character.name}</h1>

            <#if character.imageUrl?? && character.imageUrl?has_content>
                <img class="details-image" src="${character.imageUrl}" alt="${character.name}">
                <#else>
                    <img class="details-image" src="/images/placeholder.svg" alt="No image available">
            </#if>

            <section>
                <h2>Character Information</h2>

                <p><strong>Name:</strong> ${character.name}</p>
                <p><strong>Species:</strong> ${character.species!''}</p>
                <p><strong>Universe:</strong> ${character.universe!''}</p>
                <p><strong>Role:</strong> ${character.role!''}</p>

                <h2>Backstory</h2>

                <#if character.characterId==3>
                    <p>Goku, originally named Kakarot, was born on Planet Vegeta as a member of the Saiyan race. Sent to
                        Earth as a baby to conquer it, he hit his head on a waterfall giving him memory loss. He was raised by Grandpa 
                        Gohan and grew up to become one of the planet's greatest protectors. Throughout his journey, Goku has faced countless 
                        foes, made lifelong friends, and constantly pushed himself to reach new levels of strength.</p>
                    <#else>
                        <p>${character.description!''}</p>
                </#if>

                <#if character.characterId==3>
                    <h2>Abilities</h2>
                    <ul>
                        <li>Kamehameha</li>
                        <li>Instant Transmission</li>
                        <li>Spirit Bomb</li>
                        <li>Super Saiyan transformations</li>
                        <li>Kaoiken</li>
                        <li>Ultra Instinct</li>
                    </ul>

                    <h2>First Appearance</h2>
                    <ul>
                        <li>Dragon Ball Chapter 1 (1984)</li>
                        <li>Created by Akira Toriyama</li>
                    </ul>
                </#if>
            </section>

            <p><a class="button" href="/">Back to Gallery</a></p>

        </main>

    </@layout.page>

package com.example.dragonballapi.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dragonballapi.entity.TvCharacter;
import com.example.dragonballapi.service.TvCharacterService;

@Controller
public class CharacterUIController {

    private final TvCharacterService service;

    public CharacterUIController(TvCharacterService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String gallery(
            @RequestParam(defaultValue = "") String name,
            @RequestParam(defaultValue = "") String universe,
            Model model) {

        List<TvCharacter> characters = service.getAllCharacters();

        if (!name.isBlank()) {
            characters = characters.stream()
                    .filter(character -> character.getName()
                            .toLowerCase().contains(name.toLowerCase()))
                    .collect(Collectors.toList());
        }

        if (!universe.isBlank()) {
            characters = characters.stream()
                    .filter(character -> character.getUniverse() != null
                            && character.getUniverse().equalsIgnoreCase(universe))
                    .collect(Collectors.toList());
        }

        model.addAttribute("characters", characters);
        model.addAttribute("searchName", name);
        model.addAttribute("selectedUniverse", universe);

        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/characters/{id}")
    public String details(@PathVariable long id, Model model) {
        TvCharacter character = service.getCharacterById(id)
                .orElseThrow(() -> new RuntimeException("Character not found"));

        model.addAttribute("character", character);
        return "details";
    }
}


package com.example.dragonballapi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.dragonballapi.entity.TvCharacter;
import com.example.dragonballapi.service.TvCharacterService;

@Controller
public class CharacterUIController {

    private final TvCharacterService service;

    public CharacterUIController(TvCharacterService service) {
        this.service = service;
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


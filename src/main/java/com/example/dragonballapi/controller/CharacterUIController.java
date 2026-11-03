
package com.example.dragonballapi.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @GetMapping("/characters/new")
    public String newCharacterForm() {
        return "new-character-form";
    }

    @GetMapping("/characters/{id}/edit")
    public String editCharacterForm(@PathVariable long id, Model model) {
        TvCharacter character = service.getCharacterById(id)
            .orElseThrow(() -> new RuntimeException("Character not found"));

        model.addAttribute("character", character);
        return "new-character-form";
    }

    @PostMapping("/characters/{id}")
    public String updateCharacter(
            @PathVariable long id,
            @ModelAttribute TvCharacter character,
            RedirectAttributes redirectAttributes) {

        if (service.getCharacterById(id).isEmpty()) {
            throw new RuntimeException("Character not found");
        }

        service.updateCharacter(id, character);

        redirectAttributes.addFlashAttribute(
            "successMessage", "Character updated successfully!");

        return "redirect:/characters/" + id;
    }

    @PostMapping("/characters/{id}/delete")
    public String deleteCharacter(
            @PathVariable long id,
            RedirectAttributes redirectAttributes) {

        if (service.getCharacterById(id).isEmpty()) {
            throw new RuntimeException("Character not found");
        }

        service.deleteCharacter(id);

        redirectAttributes.addFlashAttribute(
            "successMessage", "Character deleted successfully!");

        return "redirect:/?name=&universe=";
    }

    @PostMapping("/characters")
    public String addCharacter(
        @ModelAttribute TvCharacter character,
        RedirectAttributes redirectAttributes) {

        service.addCharacter(character);

        redirectAttributes.addFlashAttribute(
            "successMessage", "Character added successfully!");

        return "redirect:/?name=&universe=";
    }

    @GetMapping("/characters/{id}")
    public String details(@PathVariable long id, Model model) {
        TvCharacter character = service.getCharacterById(id)
                .orElseThrow(() -> new RuntimeException("Character not found"));

        model.addAttribute("character", character);
        return "details";
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleNotFound() {
        return "error";
    }
}

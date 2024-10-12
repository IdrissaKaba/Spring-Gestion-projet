package tn.essat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tn.essat.dao.IEtudiant;
import tn.essat.model.Etudiant;


@Controller
//@RequestMapping(value = "/aaa", method = RequestMethod.GET)
public class EtudiantController {

    @Autowired
    private IEtudiant dao;

    @GetMapping("/etudiants")
    public String getAllEtudiants(Model model) {
    	List<Etudiant> liste = dao.findAll(); 
        model.addAttribute("etds", liste);
        return "etudiantList";
    }

    @GetMapping("/showAddForm")
    public String PreAjout(Model m) {
    	Etudiant etd = new Etudiant();
    	m.addAttribute("etd", etd);
    	return "ajoutEtudiant";
    }


    @PostMapping("/addEtudiant")
    public String addEtudiant(Model m, @ModelAttribute Etudiant etd) {
        dao.save(etd);
        return "redirect:/etudiants";
    }

    @GetMapping("/deleteEtudiant/{id}")
    public String deleteEtudiant(Model m, @PathVariable("id") int id) {
        dao.deleteById(id);
        return "redirect:/etudiants";
    }



}

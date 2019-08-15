package com.codingdojo.lookify.controlers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.models.Song;
import com.codingdojo.lookify.services.SongService;

@Controller
public class SongController {

	private final SongService songServ;
    
	public SongController(SongService songServ){
        this.songServ = songServ;
    }

////////// HOME  ///////////////////////////////////////////	

	@RequestMapping("/")
	public String home() { 
		return "songs/index.jsp";
	}
////////// DASHBOARD ///////////////////////////////////////
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) { 
		List<Song> songs = songServ.allSongs();
		model.addAttribute("songs", songs);
		return "/songs/dashboard.jsp";
	}

//////////  NEW      ///////////////////////////////////////
	
	@RequestMapping("/songs/new")
    public String newSong(Model model) {
		model.addAttribute("newSongObject", new Song());
        return "/songs/new.jsp";
    }
    @RequestMapping(value="/dashboard", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("newSongObject") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "/songs/new.jsp";
        } else {
            songServ.createSong(song);
            return "redirect:/dashboard";
        }
    }
    
/////////  SHOW  //////////////////////////////////////////
    
	@RequestMapping("/songs/{id}/show")
	public String show(Model model, @PathVariable("id") Long id) {
		Song song = songServ.findSong(id);
		model.addAttribute("showSongObject", song);
		return "/songs/show.jsp";
	}

///////// DELETE //////////////////////////////////////////
    
	@RequestMapping(value="/songs/{id}/delete", method=RequestMethod.POST)
	public String deleteSong(@PathVariable("id") Long id) {
		songServ.deleteSong(id);
		return "redirect:/dashboard";
	}
	
///////// TOP TEN  ///////////////////////////////////////
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model) { 
		List<Song> songs = songServ.topSongs();
		model.addAttribute("songs", songs);
		return "/songs/topTen.jsp";
	}

///////// SEARCH   ///////////////////////////////////////
	
@RequestMapping("/search/artist")
public String searchArtist(Model model, @RequestParam(value="name") String name) { 
	List<Song> songs = songServ.search(name);
	model.addAttribute("songs", songs);
	return "/songs/search.jsp";
}   
}

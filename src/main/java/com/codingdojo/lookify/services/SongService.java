package com.codingdojo.lookify.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.Song;
import com.codingdojo.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepo;
	    
    public SongService(SongRepository songRepo) {
        this.songRepo = songRepo;
    }

	public List<Song> allSongs() {
		return songRepo.findAll();
	}
	
    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepo.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
    
    public SongRepository getSongRepository() {
		return songRepo;
	}

	public void createSong(@Valid Song song) {
        songRepo.save(song);
    }

	public void deleteSong(Long id) {
		songRepo.deleteById(id);
		
	}

	public List<Song> topSongs() {
		
		return songRepo.findTop10ByOrderByRatingDesc();
	}

	public List<Song> search(String name) {
		return songRepo.findByArtistContaining(name);
	}
}

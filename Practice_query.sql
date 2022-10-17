-- 1. Fetch playlist by language name

-- select core_playlist.id, core_playlist.name, count(core_song.id) as "Total  Songs"
-- from core_playlist
-- inner join core_playlist_song on core_playlist.id = core_playlist_song.playlist_id
-- inner join core_song on core_song.id = core_playlist_song.song_id 
-- inner join core_language on core_song.language_id = core_language.id
-- and core_language.title = 'English'
-- group by core_playlist.id;


-- 2. Fetch playlist by genre and artist id

-- select core_playlist.id,core_playlist.name as "Playlilst Name", core_song.name as "song_name",
-- core_genre.title as "Genre", core_artist.name as "Artist" 
-- from core_playlist 
-- inner join core_playlist_song on core_playlist.id = core_playlist_song.playlist_id
-- inner join core_song on core_playlist_song.song_id = core_song.id  
-- inner join core_genre on core_genre.id = core_song.genre_id and core_genre.id = 17
-- inner join core_song_artist on core_song.id = core_song_artist.song_id 
-- inner join core_artist on core_song_artist.artist_id = core_artist.id and core_artist.id = 70 ;


-- 3. Fetch Songs And Artists by Genre ID

-- select core_song.id, core_song.name as "Song Name", core_artist.name as "Artist Name", core_genre.title as "Genre Name" 
-- from core_song
-- inner join core_genre on core_genre.id = core_song.genre_id and core_song.genre_id = 17  
-- inner join core_song_artist on core_song.id = core_song_artist.song_id
-- inner join core_artist on core_artist.id = core_song_artist.artist_id;


-- 4. Fetch Playlist Detail And Song Details By Artist ID

-- select core_song_artist.artist_id, core_playlist.name as "Playlist Name", core_song.* from core_playlist 
-- inner join core_playlist_song on core_playlist_song.playlist_id = core_playlist.id
-- right join core_song on core_playlist_song.song_id = core_song.id
-- inner join core_song_artist on core_song_artist.song_id = core_song.id and core_song_artist.artist_id = 92;


-- 5. Fetch Artist Song Cout and by Artist ID

-- select core_artist.id as "Artist ID", core_artist.name as "Artist Name", count(core_song_artist.song_id) 
-- from core_artist
-- inner join core_song_artist on core_song_artist.artist_id = core_artist.id
-- group by (core_artist.id);


-- 6. Fetch Artist Data and Song Data by Playlist ID

-- select core_playlist.id as "Playlist id", core_artist.id as "artist ID", core_song.id as "Song ID", core_artist.name as "Artist_name", core_song.name as "Song_Name" 
-- from core_song
-- inner join core_song_artist on core_song.id = core_song_artist.song_id
-- inner join core_artist on core_artist.id = core_song_artist.artist_id
-- inner join core_playlist_song on core_song.id = core_playlist_song.id
-- inner join core_playlist on core_playlist_song.playlist_id = core_playlist.id 
-- order by (core_playlist.id);


-- 7. Fetch Playlist Song Order and Artist Images by Playlist ID

-- SELECT core_playlist.id as "Playlist ID", core_song.id as "song ID", core_artist.name as "Artist Name", core_artist.image as "Artist_image" 
-- FROM core_playlist
-- inner join core_playlist_song on core_playlist.id = core_playlist_song.playlist_id
-- inner join core_song on core_playlist_song.song_id = core_song.id
-- inner join core_song_artist on core_song.id = core_song_artist.song_id
-- inner join core_artist on core_song_artist.artist_id = core_artist.id 
-- ORDER BY (core_playlist.id, core_song.id);


-- 8. Create a bulk query for Insert Playlist.

-- INSERT INTO core_playlist (name,user_id,is_featured,share_link,image) values
-- ('Kohinoor',202,false,null,null),
-- ('Kohinoor',202,true,CURRENT_TIMESTAMP,'img'),
-- ('Kohinoor',202,true,current_timestamp,null),
-- ('Kohinoor',202,false,null,'img');

-- select * from core_playlist where name = 'Kohinoor';

-- delete from core_playlist where name = 'Kohinoor';


-- 9. Create View For Playlist, Song, and Artist Data.

-- create view custom_playlist_artist as SELECT core_playlist.name as "Playlist Name", core_song.name as "Song Name", core_Artist.name as "Artist Name" 
-- from core_playlist
-- inner join core_playlist_song on core_playlist_song.playlist_id = core_playlist.id
-- inner join core_song on core_song.id = core_playlist_song.song_id
-- inner join core_song_artist on core_song.id = core_song_artist.song_id
-- inner join core_artist on core_artist.id = core_song_artist.artist_id;

-- select * from custom_playlist_artist;

-- Drop view custom_playlist_artist;


-- 10. Fetch Playlist If All Songs in Playlist Are from the same artist

-- select core_playlist.id, core_playlist.name, count(core_playlist_song.song_id) as "total Song"
-- -- , count(distinct core_song_artist.artist_id) as "Total Artist"
-- from core_playlist
-- inner join core_playlist_song on core_playlist.id = core_playlist_song.playlist_id 
-- inner join core_song_artist on core_playlist_song.song_id = core_song_artist.song_id
-- GROUP BY core_playlist.id,core_playlist.name
-- HAVING count(distinct core_song_artist.artist_id) = 1;

-- TEST CHECK FOR 10 TH QUERY IS RIGHT OR NOT 

-- select distinct core_playlist_song.song_id, core_song_artist.artist_id 
-- from core_playlist_song, core_song_artist 
-- where core_song_artist.song_id = core_playlist_song.song_id 
-- and core_playlist_song.playlist_id = 87;


-- 11. Fetch Playlist If All Songs in Playlist Are from the same genre

-- select core_playlist.id, core_playlist.name, count(core_playlist_song.song_id) as "SONGS", core_genre.id as "Genre ID"
-- from core_playlist
-- inner join core_playlist_song on core_playlist.id = core_playlist_song.playlist_id 
-- inner join core_song on core_playlist_song.song_id = core_song.id
-- inner join core_genre on core_song.genre_id = core_genre.id
-- GROUP BY core_playlist.id,core_playlist.name, core_genre.id
-- HAVING count(distinct core_song.genre_id) = 1;

-- TEST CHECK FOR 11 TH QUERY IS RIGHT OR NOT 

-- select distinct core_song.id, core_song.genre_id, core_playlist.name 
-- from core_song, core_playlist_song, core_playlist
-- where core_playlist.id = core_playlist_song.playlist_id 
-- and core_playlist_song.song_id = core_song.id
-- and core_playlist_song.playlist_id = 46 
-- and core_song.genre_id = 17


-- 12. Fetch like for songs by for each playlist

-- select core_playlist.id, core_playlist.name, core_song.name as "Songs Name", count(core_songlike.user_id) AS "Total Likes"
-- -- , core_songlike.user_id
-- FROM core_song
-- inner join core_playlist_song on core_playlist_song.song_id = core_song.id
-- inner join core_playlist on core_playlist_song.playlist_id = core_playlist.id
-- inner join core_songlike on core_song.id = core_songlike.song_id
-- group by core_playlist.id, core_playlist.name, core_song.name;
-- -- , core_songlike.user_id;




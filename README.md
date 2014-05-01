Soundcloud Set Stripper
=========

pulls out a steam file of the tracks in a soundcloud set that can be played on xmbc.

copy the file to you xmbc devise and start streaming.

tested on raspbmc

Use
-------
if this is the proper url
'https://soundcloud.com/boebzy/sets/stereodose'

then append the url
`/boebzy/sets/stereodose`

to `http://agile-everglades-3734.herokuapp.com/tracks`
or `http://agile-everglades-3734.herokuapp.com/stream_tracks`

Call
-----
`http://agile-everglades-3734.herokuapp.com/tracks/boebzy/sets/stereodose`
`http://agile-everglades-3734.herokuapp.com/stream_tracks/boebzy/sets/stereodose`

[try it][try_it_out]
[or download the stream file][download]

Response
------
```json
[
	"http://api.soundcloud.com/tracks/103997903/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/72527255/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/101834466/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/91460960/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/106315004/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/11496366/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/68552565/stream?consumer_key=hijuflqxoOtr6W4NA",
	"http://api.soundcloud.com/tracks/38899811/stream?consumer_key=hijuflqxoOqzLdtr6W4NAw"
]
```

[try_it_out]:http://agile-everglades-3734.herokuapp.com/tracks/boebzy/sets/stereodose
[download]:http://agile-everglades-3734.herokuapp.com/stream_tracks/boebzy/sets/stereodose
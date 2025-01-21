t
`var game_paused: bool = false:`
	`get:`
		`return game_paused`
	`set(value):`
		`game_paused = value`
		`get_tree().paused = game_paused`
		`emit_signal("toggle_game_paused", game_paused)`

# get
The get block will be executed only when the variable is accessed (i.e print(game_paused)) otherwise it will be ignored

# set 
The set block will be executed when the variable's value is being changed 
(i.e game_paused = true)


## Syntax
`set(value):`
    `game_paused = value`
...
...
...
`game_paused = !game_paused`

Here, the value = !game_paused.
because we are modifying the value of the game_paused variable. 


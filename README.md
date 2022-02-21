## Usage

Clone the repository and run the following commands:

```sh
touch docker/app_env.secrets
cd docker
docker-compose up --build
```

Go to [localhost:3000](http://localhost:3000) to see the application running.

## The Game

The game starts with an empty board. The player can place their boats on the board by dragging them on to the targetted cell.

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/595772e44c5c4c70a7b02e628ca3189f" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>


Once all ships are laid down, the player can start bombing the opponent's board. With every bomb placed, the opponent will randomly bomb back at the player.

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/051a5c7df24140a594022b3035c6354e" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>


The first player to bomb all of the opponent's ships wins.


## Running specs

```sh
docker compose run --rm app bundle exec rspec
```


## Known issues

- [ ] The game does not prevent the player from bombing their own cell.
- [ ] The game does not prevent the player from bombing a cell that is already bombed.
- [ ] The mechanism that automatically checks if a ships position is valid fails sometimes.
- [ ] Cache persists across sessions, which makes it impossible to play again without restarting the server.
- [ ] The game is not fully responsive.
- [ ] Cache sometimes does not clear properly, leaving random bombs or ship parts on the board.

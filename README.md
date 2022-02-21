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

[![Watch the video](https://cdn.loom.com/sessions/thumbnails/595772e44c5c4c70a7b02e628ca3189f-with-play.gif)](https://www.loom.com/embed/595772e44c5c4c70a7b02e628ca3189f)

Once all ships are laid down, the player can start bombing the opponent's board. With every bomb placed, the opponent will randomly bomb back at the player.

[![Watch the video](https://cdn.loom.com/sessions/thumbnails/051a5c7df24140a594022b3035c6354e-with-play.gif)](https://www.loom.com/embed/051a5c7df24140a594022b3035c6354e)


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

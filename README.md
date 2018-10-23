# TYPO3 8 LTS - InsanityMeetsHH

## Included
* [Bootstrap Grids](https://extensions.typo3.org/extension/bootstrap_grids/)
* [Dynamic Content Elements](https://extensions.typo3.org/extension/dce/)
* [Grid Elements](https://extensions.typo3.org/extension/gridelements/)
* [News system](https://extensions.typo3.org/extension/news/)
* [RealURL](https://extensions.typo3.org/extension/realurl/)
* [Scriptmerger](https://extensions.typo3.org/extension/scriptmerger/)
* [Source Optimization](https://extensions.typo3.org/extension/sourceopt/)

## Required
* PHP => 7.1
* Database like MySQL
* [Docker](https://www.docker.com/) ([for installation with Docker](https://github.com/InsanityMeetsHH/Slim-Skeleton#installation-with-docker))

## Installation with [Composer](https://getcomposer.org/) (Recommended)

```bash
$ composer create-project insanitymeetshh/typo3-skeleton [my-app-name]
```
## Installation with [Docker](https://www.docker.com/)
* Get skeleton via `$ git clone` or zip download
* Open a command prompt on your OS (if not already open) and navigate to the project folder
* `$ docker pull composer`
* `$ docker run --rm --env docker=true --interactive --tty --volume $PWD:/app composer update`
* `$ docker-compose build`
* `$ docker-compose up -d`
* `$ touch web/typo3conf/FIRST_INSTALL`
* `$ docker inspect typo3-8-db | grep IPAddress` and set IP address at the install process.
* Open [localhost:8080](http://localhost:8080) for website or [localhost:9999](http://localhost:9999) for database gui
* If you want to remove a container `$ docker rm [container-name] -f` e.g. `$ docker rm typo3-8-db -f`
* If you want to remove a volume `$ docker volume rm [volume-name]` e.g. `$ docker volume rm imhh-typo3_db_data` (first remove matching container)
* If you want to remove all container `$ docker rm $(docker ps -a -q) -f`
* If you want to remove all volumes `$ docker volume prune` (first remove all container)

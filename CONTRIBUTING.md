## Troubleshooting ##

_Before filing a issue, try these steps._

- Check that you are using the most recent version of the image. e.g. if you are testing `rocker/rstudio`, try running `docker pull rocker/rstudio` first.
- Check the documentation on the [Rocker wiki](https://github.com/rocker-org/rocker/wiki)

## Reporting bugs ##

To better help us diagnose a bug or problem, it helps if you can include the following information:

1. which host OS you are using.  
2. which Docker container(s) you tried. 
3. what command you launched
4. what you were expecting
5. which error you get

It's also nice if you can include: 

1. The output of `docker logs <container-id>`, where `<container-id>` is the hash for your container. (Use `docker ps` to see a list of running containers)
2. The image id for the container you are using. For instance, `docker images -q rocker/rstudio` will display your current image id.  
3. The version of Docker that you are using.
4. The version of _boot2docker_ if applicable (Mac/Windows).

## Pull requests ##

- Pull requests against the `master` branch should be fine.
- Review [How to Contribute](https://github.com/rocker-org/rocker/wiki/How-to-contribute) on the wiki


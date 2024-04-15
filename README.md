# Environment Setup

## Preparation

1. Clone this repository
2. Open `run.sh` with your editor of choice
3. Set `AI_GROUP` to your group number (1 - 8)
4. Set `AI_LOGIN` to a secure password to access your notebook
5. Save the file
6. Make sure there is a directory `workspace` directly in your user home. Otherwise, `mkdir ~/workspace`.

## Creating a Container

Run `sudo ./run.sh`. This will create your container.
A container for group `x` will spawn a Jupyter Lab server at port `8000 + x` and use GPU `x % 4`.

Follow the URL printed by the script to access your Jupyter Lab in the browser. Now, enter the secure password chosen before (you might want to change it here).

**Note:** From now on, you cannot re-run the script unless you delete your container using `sudo docker rm ai4se-<GROUP>` with `<GROUP>` being your group number. **MAKE SURE YOU ONLY DELETE YOUR OWN CONTAINER!**

## Managing a Container

You can start and stop your container using `sudo docker start|stop ai4se-<GROUP>`

Data created within Jupyter Lab (`/workspace` directory within the container) is synchronized to your `~/workspace` directory in your user home. Everything inside this directory survives when the container is removed and re-created. Data outside this directory **does not**!






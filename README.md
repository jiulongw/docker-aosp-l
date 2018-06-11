# Android Lollipop Builder
Tired of setting up build environment to hack your shiny Android based IoT devices?

With this docker image, you can build Android Lollipop anywhere without messing up with your environment.
No more headache setting up JDK 7 in your modern Linux distros.

No performance penalty when running under Linux.  You get almost 100% of your CPU power when building source code.

Tested with Firefly RK3288 kernel and framework.

## Usage
You can symbolic link `shell` to your `$PATH`.  E.g.
```
ln -s ~/github/docker-aosp-l/shell /usr/local/bin/aosp-l-shell
```

Now simply run it from directory where kernel source is located.

```
(~/gitlab/ff3288)$ aosp-l-shell
android@3daebcb3a056:/$ cd ~/ff3288
android@3daebcb3a056:~/ff3288$ source build.sh
...
android@3daebcb3a056:~/ff3288$ lunch rk3288_box-userdebug
...
android@3daebcb3a056:~/ff3288$ make -j4
...
```

## Note:
1. The shell script will attach to existing container if it exists.
If you want to change source code directory, delete existing container first.
```
docker rm aosp-l
```

2. The container shell runs as local user `android` instead of `root` to prevent generated file being owned by root.
To run any command inside the container that requires `root`, you can `sudo`, which does not require a password.

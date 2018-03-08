# Docker container for building android-x86 images

### build docker image
```
sudo docker build -t android-x86-builder .
```

### build android x86

volume must be link to android x86 existing repo
```
sudo docker run -v ~/android-x86:/root/android-x86 -i android-x86-builder
```


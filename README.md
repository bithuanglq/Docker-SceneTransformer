This is a docker version of [this](https://github.com/Chen-Albert-FENG/SceneTransformer), fixing some bugs and tutoring how to get the [Waymo-motion-dataset](https://console.cloud.google.com/storage/browser/waymo_open_dataset_motion_v_1_2_0;tab=objects?prefix=&forceOnObjectsSortingFiltering=false), for quickly getting started with [SceneTransformer](https://openreview.net/pdf?id=Wm3EA5OlHsG), a trajectory prediction and planning network for autonomous vehicles.

# 1. Prerequist
[ubuntu 20.04](https://releases.ubuntu.com/20.04/)

# 2. Build project
## 2.1 Create directory and clone project
```
cd /  && mkdir SceneTransformer_ws && cd SceneTransformer_ws
git clone git@github.com:bithuanglq/Docker-SceneTransformer.git
```

## 2.2 Create docker image from Dockerfile
Create your image (e.g. scenetransformer:latest).
```
docker build -f Dockerfile -t scenetransformer .
```

# 3. Running
## 3.1 Create docker container and enter 
You can create and run a container with the following command:
```
docker run -it -d --name container_name scenetransformer /bin/bash
```

And then, if you want to enter the container (to run commands inside the container interactively), you can use the docker exec command:
```
docker exec -it container_name /bin/bash
```

## 3.2 Dataset
Put your validation dataset in ___/mnt/SceneTransformer/data/tf_records/validation/___, the example validation data is ___uncompressed_tf_example_validation_validation_tfexample.tfrecord-00027-of-00150___


## 3.3 Test running
```
cd /mnt/SceneTransformer 
python datautil/create_idx.py
python tmp.py
```


# 4. How to download the Waymo motion dataset



# Acknowledge
Thanks to this [repo](https://github.com/Chen-Albert-FENG/SceneTransformer), [dataset](https://console.cloud.google.com/storage/browser/waymo_open_dataset_motion_v_1_2_0;tab=objects?prefix=&forceOnObjectsSortingFiltering=false), and [paper](https://openreview.net/pdf?id=Wm3EA5OlHsG).
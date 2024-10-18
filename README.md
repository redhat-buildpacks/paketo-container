# konflux-ci/paketo

A rebuild of the paketo and related tools:
- [pack](https://github.com/redhat-buildpacks/fork-pack), 
- [jam](https://github.com/redhat-buildpacks/fork-jam), 
- [create-package](https://github.com/redhat-buildpacks/fork-libpak), 
- [toml](https://github.com/pelletier/go-toml) lib
top of the red hat ubi9 image
and available at quay.io/redhat-user-workloads/cmoullia-tenant/paketo-container/paketo-container:latest

# How to guide

This section details what you should do as developer to design a project able to create an image packaging the executable that you need
and that you will next use on konflux to build your own artefacts in a hermetic environment. You will then be able to replace the default `buildah` image with yours
within the task: `build-container`.







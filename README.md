# konflux-ci/paketo

This project contains the information used by [cachi2](containerbuildsystem), when executed part of the Konflux `prefetch-dependencies` task (see the prefetch-input `parameter` of the [pipelinerun](.tekton/paketo-container-push.yaml)), to download the go modules which are used during the build 
of the [Dockerfile](Containerfile) to generate the binary of the following applications 
- [pack](https://github.com/redhat-buildpacks/fork-pack), 
- [jam](https://github.com/redhat-buildpacks/fork-jam), 
- [create-package](https://github.com/redhat-buildpacks/fork-libpak), 
- [toml](https://github.com/pelletier/go-toml) lib

**Note**: The go applications to be built are declared as [git submodules](.gitmodules)

The RPMs which should also be installed to build the project or within the final image created top of a red hat ubi9 image
are listed part of the file [rpms.in.yaml](rpms.in.yaml). The rpm urls are populated using the [tool](https://github.com/konflux-ci/rpm-lockfile-prototype) within the lock file: [rpms.lock.yaml](rpms.lock.yaml) and their [ubi.repo](ubi.repo).

The image generated `quay.io/redhat-user-workloads/cmoullia-tenant/paketo-container/paketo-container` by konflux 
is pushed on the quay registry: https://quay.io/repository/redhat-user-workloads/cmoullia-tenant/paketo-container/paketo-container?tab=tags&tag=latest

You can check locally the availability of the tools by running this command:
```bash
podman run -it quay.io/redhat-user-workloads/cmoullia-tenant/paketo-container/paketo-container:<TAG> pack
```

# How to guide

This section details what you should do as developer to design a project able to create an image packaging the executable that you need
and that you will next use on konflux to build your own artefacts in a hermetic environment. You will then be able to replace the default `buildah` image with yours
within the task: `build-container`.







# [CICFlowMeter](https://github.com/CanadianInstituteForCybersecurity/CICFlowMeter) over Docker

This project provides code for building a Docker image for CICFlowMeter, a PCAP-to-flow conversion tool from the
[Canadian Institute for Cybersecurity](https://github.com/CanadianInstituteForCybersecurity). Once built, the entry point
for the image admits three ways for running the container, depending on command line parameters:

1. `bash` or no parameter --
    Runs the `bash` shell into the container instance. Great for inspecting the container's runtime environment.
1. `sh` -- Same as above, but running the lesser-featured `sh` shell. Just because.
1. Other parameters -- Used as input and output paths for the `Cmd` class's `main` method. The former should either
   be a PCAP file or a folder container PCAP files; the latter is the directory where flow files are written.

Naturally, this container is most useful when bind-mounting directories containing your files, or as base for an
ad hoc Docker image.

## Building

```sh
docker build [-t <image tag you choose>] .
```

## Running

Let's assume the image was built with tag `cfm`.

Computing flows from packet capture files:

```sh
docker run --rm \
    -v <path to folder with pcap files>:/pcap \
    -v <path to output foler>:/flow \
    cfm /pcap /flow
```

Interactive shell:

```sh
docker run --rm -ti cfm bash
```

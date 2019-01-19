# ebpf-build

Docker image for building eBPF program based on [Debian sid image](https://hub.docker.com/_/debian/).

## build

```
docker run --rm -v $(pwd):/src higebu/ebpf-build xdp_prog.c
```

`$(pwd)/xdp_prog.o` is the result.

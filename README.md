# Overview

**Title:** sesame  
**Category:** Web  
**Flag:** libctf{415201c1-e5c8-4ace-94f3-f05391ae8289}  
**Difficulty:** easy to moderate

# Usage

The following will pull the latest 'elttam/ctf-sesame' image from DockerHub, run a new container named 'libctfso-sesame', and publish the vulnerable service on port 80:

```sh
docker run --rm \
  --publish 80:80 \
  --name libctfso-sesame \
  elttam/ctf-sesame:latest
```

# Build (Optional)

If you prefer to build the 'elttam/ctf-sesame' image yourself you can do so first with:

```sh
docker build ${PWD} \
  --tag elttam/ctf-sesame:latest
```

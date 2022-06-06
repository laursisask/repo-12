# agent-operator-images

Images for the [agent-operator](https://github.com/Contrast-Security-Inc/agent-operator) project.

Managed by the .NET team.

For questions, suggestions, bugs, see [#agent-operator](https://contrastsecurityinc.slack.com/archives/C03FNADV430).

## Images

Images are published to our internal container image registry hosted on Azure, while public images are deployed to DockerHub. Currently, this repo publishes:

```
# Internal images:
contrastdotnet.azurecr.io/agent-operator/agent-dotnet-core
contrastdotnet.azurecr.io/agent-operator/agent-java
contrastdotnet.azurecr.io/agent-operator/agent-nodejs
contrastdotnet.azurecr.io/agent-operator/agent-php

# Public images:
contrast/agent-dotnet-core
contrast/agent-java
contrast/agent-nodejs
contrast/agent-php
```

Tags are generated in the following format:

```
:2
:2.1
:2.1.10
:latest
```

For agents that support semantic versioning. For the Java agent, the format is similar.

## Image layout

All images contain a directory of `/contrast` containing all the agent files. This directory is stable and may be publicly documented.

Inside this directory is a json file `/contrast/image-manifest.json` with the layout of:

```json
{
    "version": "${VERSION}"
}
```

This file may be used by agents or for debugging containerized deployments in production. Additional information may be added in the future.

Upon starting, the default entrypoint of these images will copy all files from `/contrast` to `$CONTRAST_MOUNT_PATH` (defaults to `/contrast-init`) and exit. Some agents may require a specific `CONTRAST_MOUNT_PATH` to function correctly.

## Updating Images

Images are updated by executing a repository dispatch with a provided PAT.

```bash
curl -H "Authorization: token ${GH_PAT}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    "https://api.github.com/repos/Contrast-Security-Inc/agent-operator-images/dispatches" \
    -d '{"event_type": "oob-update", "client_payload": {"type": "dotnet-core", "version": "2.1.12"}}'
```

Once the dispatch request is received, the following events execute automatically:

- A pr with the requested version is created on a new branch.
- Basic checks are executed to ensure the version can be built.
- Upon successful validation, the PR is automatically merged into trunk.

Merging into trunk starts the following events:

- Create and publish all images in this repository.
- When all images have been built successfully, start a deployment to `internal`. This copies the artifact images from the first step, with final image tags.
- When the internal environment deployment has succeeded, start a deployment to `public` (currently requires 1 reviewer from the .NET team).

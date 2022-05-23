# agent-operator-images

Images for the [agent-operator](https://github.com/Contrast-Security-Inc/agent-operator) project.

Managed by the .NET team.

## Images

Images are published to our internal container image registry hosted on Azure. Currently, this repo publishes:

```
# Internal images:
contrastdotnet.azurecr.io/agent-operator/agents/dotnet-core
contrastdotnet.azurecr.io/agent-operator/agents/java
contrastdotnet.azurecr.io/agent-operator/agents/nodejs
contrastdotnet.azurecr.io/agent-operator/agents/php

# Public images:
contrastsecurityinc/agent-dotnet-core
contrastsecurityinc/agent-java
contrastsecurityinc/agent-nodejs
contrastsecurityinc/agent-php
```

Tags are generated in the following format:

```
:2
:2.1
:2.1.10
:latest
```

For agents that support semantic versioning. For the Java agent, the format is similar.

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

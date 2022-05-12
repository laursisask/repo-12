# agent-operator-images

Images for the [agent-operator](https://github.com/Contrast-Security-Inc/agent-operator) project.

Managed by the .NET team.

## Images

Images are published to our internal container image registry hosted on Azure. Currently, this repo publishes:

```
contrastdotnet.azurecr.io/agent-operator/agents/dotnet-core
contrastdotnet.azurecr.io/agent-operator/agents/java
contrastdotnet.azurecr.io/agent-operator/agents/nodejs
```

Tags are generated in the following format:

```
:2
:2.1
:2.1.10
:latest
```

For agents that support semantic versioning. For the Java agent, the format is similar.

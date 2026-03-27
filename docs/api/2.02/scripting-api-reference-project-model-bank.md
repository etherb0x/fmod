---
title: "FMOD - Scripting API Reference | Project.Model.Bank"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Bank

**Types:**

-   [model.Bank](scripting-api-reference-project-model-bank.html#modelbank "A collection of model.Events to build into a binary file, to be loaded by the FMOD Studio API.") A collection of `model.Event`s to build into a binary file, to be loaded by the FMOD Studio API.

**Extension Methods:**

-   [Bank.getPath](scripting-api-reference-project-model-bank.html#bankgetpath "Retrieves the bank's unique path identifier.") Retrieves the bank's unique path identifier.

## [model.Bank](#modelbank)

A collection of [model.Event](scripting-api-reference-project-model-event.html#modelevent)s to build into a binary file, to be loaded by the FMOD Studio API.

## [Bank.getPath](#bankgetpath)

Retrieves the bank's unique path identifier.

```javascript
Bank.getPath()
```

Returns the bank's [path](https://fmod.com/docs/2.02/studio/advanced-topics.html#paths) as a `string`.

**See Also:** [Banks](https://fmod.com/docs/2.02/studio/getting-events-into-your-game.html#banks)

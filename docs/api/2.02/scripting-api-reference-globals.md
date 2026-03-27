---
title: "Scripting API Reference | Globals"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Globals

## [Globals](#globals)

Available within the global object context (e.g. `console.log("hello");` ).

### [console.log(msg)](#consolelogmsg)

Logs a message. Alias for `studio.system.print`.

### [console.warn(msg)](#consolewarnmsg)

Logs a warning. Alias for `studio.system.warn`.

### [console.error(msg)](#consoleerrormsg)

Logs an error. Alias for `studio.system.error`.

### [console.dump(object)](#consoledumpobject)

Logs all members of object.

### [alert(msg)](#alertmsg)

Logs a message in a popup dialog (blocking). Alias for `studio.system.message`.

### [studio.os.platform](#studioosplatform)

The current operating system of the computer. Returns either "mac" for Mac OS X or "win" for all Windows versions.

### [studio.application.filePath](#studioapplicationfilepath)

The absolute file path of the [FMOD Studio](glossary.html#fmod-studio) process's executable.

### [studio.version](#studioversion)

An object containing version information for the Studio tool:

```javascript
{
    productVersion: [number],
    majorVersion: [number],
    minorVersion: [number],
    changelist: [number],
}
```

This object also implements `toString()` which returns the version in a human-readable format (e.g. "Version 1.00.00 (100000)").

### [\_\_dirname](#__dirname)

The absolute directory path of the file currently being loaded. This does not include a trailing '/' character.

### [\_\_filename](#__filename)

The absolute path of the file currently being loaded.

# Scripting API Reference | Globals

FMOD Studio User Manual 2.03.12

## Globals

Available within the global object context (e.g. `console.log("hello");`).

### console.log(msg)

Logs a message. Alias for `studio.system.print`.

### console.warn(msg)

Logs a warning. Alias for `studio.system.warn`.

### console.error(msg)

Logs an error. Alias for `studio.system.error`.

### console.dump(object)

Logs all members of object.

### alert(msg)

Logs a message in a popup dialog (blocking). Alias for `studio.system.message`.

### studio.os.platform

The current operating system of the computer. Returns either "mac" for Mac OS X or "win" for all Windows versions.

### studio.application.filePath

The absolute file path of the FMOD Studio process's executable.

### studio.version

An object containing version information for the Studio tool:

```js
{
    productVersion: [number],
    majorVersion: [number],
    minorVersion: [number],
    changelist: [number],
}
```

This object also implements `toString()` which returns the version in a human-readable format (e.g. "Version 1.00.00 (100000)").

### __dirname

The absolute directory path of the file currently being loaded. This does not include a trailing '/' character.

### __filename

The absolute path of the file currently being loaded.

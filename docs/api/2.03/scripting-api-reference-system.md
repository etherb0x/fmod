# Scripting API Reference | System

FMOD Studio User Manual 2.03.12

## Module: System

The `studio.system` module provides general system-wide functionality.

### system.require(fileName)

Loads a javascript file as a library. The `fileName` passed can be either a relative or absolute path. The file being loaded should contain a module. For example:

```js
module.exports = {
    foobar: function() {
        // implementation
    },
};
```

The module can then be used:

```js
var MyModule = studio.system.require("utils/file_name.js");
MyModule.foobar();
```

When loading relative module files, it is recommended that the modules are placed in a different folder, such as a subfolder. This ensures the module's files are not loaded as top-level script files. This loads scripts relative to the script making this call, so it is not possible to use `system.require` with relative paths from the console.

Returns the loaded js module object or `null` if unsuccessful.

### system.backtrace()

Returns the callstack as an array of strings.

### system.verbose(msg)

Logs a verbose message.

### system.print(msg)

Logs a message.

### system.warn(msg)

Logs a warning.

### system.error(msg)

Logs an error.

### system.message(msg)

Logs a message in a popup dialog (blocking).

### system.question(msg)

Prompts for a 'yes'/'no' response to a given message and returns a boolean value (blocking).

### system.getText(msg[, defaultText])

Prompts for text input and returns the string, or null if cancelled (blocking).

### system.getNumber(msg[, defaultText])

Prompts for numeric input and returns the value, or null if cancelled (blocking).

### system.start(pathToExecutable, processOptions)

Runs an external process with options object `{ workingDir, args, timeout (milliseconds) }` (blocking).

Returns a result object `{ exitCode, standardOutput, standardError }`.

### system.startAsync(pathToExecutable, processOptions)

Runs an external asynchronous process with options object `{ workingDir, args }`.

Returns a `studio.system.ScriptProcess` object representing the asynchronous process.

### system.readDir(filePath, readDirFiltersFlag)

Returns a string array from the filters specified by `readDirFiltersFlag` from the `filePath`. If `readDirFiltersFlag` is not defined, a default of `system.readDirFilters.AllEntries` will be used.

### system.readDirFilters

An enumeration used with `studio.system.readDir()` to describe the filters:

- `Dirs`: List directories that match the filters.
- `AllDirs`: List all directories; don't apply filters to directory names.
- `Files`: List files.
- `Drives`: List disk drives (ignored under Unix).
- `NoSymLinks`: Do not list symbolic links.
- `NoDotAndDotDot`: Do not list "." and "..".
- `NoDot`: Do not list ".".
- `NoDotDot`: Do not list "..".
- `AllEntries`: List directories, files, drives and symlinks.
- `Readable`: List files the application can read. Combine with Dirs or Files.
- `Writable`: List files the application can write. Combine with Dirs or Files.
- `Executable`: List files the application can execute. Combine with Dirs or Files.
- `Modified`: Only list modified files (ignored on Unix).
- `Hidden`: List hidden files.
- `System`: List system files.
- `CaseSensitive`: The filter should be case sensitive.

### system.getFile(filePath)

Returns a `studio.system.File` object representing the file at `filePath`.

### system.openMode

An enumeration used with `File.open()` to describe the mode in which a file is opened:

- `ReadOnly`: The file is open for reading.
- `WriteOnly`: The file is open for writing. Implies `Truncate`.
- `ReadWrite`: The file is open for reading and writing.
- `Append`: File opened in append mode; all data written to end of file.
- `Truncate`: If possible, file is truncated before opened. All earlier contents lost.

### system.permission

An enumeration used with `File.setPermissions()` to alter permissions. Values may be OR-ed together:

- `ReadOwner`, `WriteOwner`, `ExeOwner`
- `ReadUser`, `WriteUser`, `ExeUser`
- `ReadGroup`, `WriteGroup`, `ExeGroup`
- `ReadOther`, `WriteOther`, `ExeOther`
- `Exe`: Executable by everyone.
- `Write`: Writable by everyone.
- `Read`: Readable by everyone.

## Class: File

The `studio.system.File` object allows for interaction with files on disk. A File can be created using `system.getFile()`.

### File.exists()

Returns `true` if the file exists on disk.

### File.open(openModeFlag)

Opens the file in the mode specified by `openModeFlag`. Returns `true` on success.

### File.writeText(text)

Writes the `text` to the file as Utf8. Returns number of bytes written, or -1 on error.

### File.readText(maxSize)

Reads at most `maxSize` bytes from the file as Utf8, returns the resulting string.

### File.writeBinary(byteArray)

Writes the `byteArray` to the file. Returns number of bytes written, or -1 on error.

### File.readBinary(maxSize)

Reads at most `maxSize` bytes from the file and returns the result.

### File.close()

Closes the file and flushes changes to disk. Returns `true` on success.

### File.copy(filePath)

Copies the file to the absolute `filePath` specified. Directories that don't exist will be created.

### File.remove()

Removes the file from disk. Not undoable. Returns `true` on success.

### File.size()

Returns the size of the file in bytes.

### File.permissions()

Returns the complete OR-ed combination of system.permission flags, or 0 if file doesn't exist.

### File.setPermissions(permissions)

Sets the system.permission flags for the file. Returns true on success.

## Class: ScriptProcess

The `studio.system.ScriptProcess` object allows for interaction with a process started using `system.startAsync()`.

### ScriptProcess.isRunning()

Returns `true` if the process is running and ready for reading or writing.

### ScriptProcess.readAllStandardOutput()

Returns all data available from the standard output of the process.

### ScriptProcess.readAllStandardError()

Returns all data available from the standard error of the process.

### ScriptProcess.writeStandardInput(text, timeout)

Writes `text` to standard input and waits up to `timeout` milliseconds for the process to write back to standard output.

### ScriptProcess.kill()

Kills the process, causing it to exit immediately.

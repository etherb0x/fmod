---
title: "Scripting API Reference | System"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | System

## [Module: System](#module-system)

The `studio.system` module provides general system-wide functionality.

### [system.require(fileName)](#systemrequirefilename)

Loads a javascript file as a library. The `fileName` passed can be either a relative or absolute path. The file being loaded should contain a module. For example:

```javascript
module.exports = {
    foobar: function() {
        // implementation
    },
};
```

The module can then be used:

```javascript
var MyModule = studio.system.require("utils/file_name.js"); // absolute path or file path relative to the script
MyModule.foobar();
```

When loading relative module files, it is recommended that the modules are placed in a different folder, such as a subfolder. This ensures the module's files are not loaded as top-level [script files](scripting-terminal-reference.html#script-files). This loads scripts relative to the script making this call, so it is not possible to use `system.require` with relative paths from the console.

Returns the loaded js module object or `null` if unsuccessful.

### [system.backtrace()](#systembacktrace)

Returns the callstack as an array of strings.

### [system.verbose(msg)](#systemverbosemsg)

Logs a verbose message.

### [system.print(msg)](#systemprintmsg)

Logs a message.

### [system.warn(msg)](#systemwarnmsg)

Logs a warning.

### [system.error(msg)](#systemerrormsg)

Logs an error.

### [system.message(msg)](#systemmessagemsg)

Logs a message in a popup dialog (blocking).

### [system.question(msg)](#systemquestionmsg)

Prompts for a 'yes'/'no' response to a given message and returns a boolean value (blocking).

### [system.getText(msg[, defaultText])](#systemgettextmsg-defaulttext)

Prompts for text input and returns the string, or null if cancelled (blocking).

### [system.getNumber(msg[, defaultText])](#systemgetnumbermsg-defaulttext)

Prompts for numeric input and returns the value, or null if cancelled (blocking).

### [system.start(pathToExecutable, processOptions)](#systemstartpathtoexecutable-processoptions)

Runs an external process with options object `{ workingDir, args, timeout (milliseconds) }` (blocking).

Returns a result object `{ exitCode, standardOutput, standardError }`.

### [system.startAsync(pathToExecutable, processOptions)](#systemstartasyncpathtoexecutable-processoptions)

Runs an external asynchronous process with options object `{ workingDir, args }`.

Returns a [studio.system.ScriptProcess](#class-scriptprocess) object representing the asynchronous process.

### [system.readDir(filePath, readDirFiltersFlag)](#systemreaddirfilepath-readdirfiltersflag)

Returns a string array from the filters specified by `readDirFiltersFlag` from the `filePath`. If `readDirFiltersFlag` is not defined in the function call, a default of `system.readDirFilters.AllEntries` will be used. The available options are described by the [system.readDirFilters](#systemreaddirfilters) enum.

### [system.readDirFilters](#systemreaddirfilters)

An enumeration used with `studio.system.readDir(filePath, readDirFiltersFlag)` to describe the filters in which a string array will be returned. The filter value is specified by combining values from the following list using the bitwise OR operator:

-   `Dirs`: List directories that match the filters.
-   `AllDirs`: List all directories; i.e. don't apply the filters to directory names.
-   `Files`: List files.
-   `Drives`: List disk drives (ignored under Unix).
-   `NoSymLinks`: Do not list symbolic links (ignored by operating systems that don't support symbolic links).
-   `NoDotAndDotDot`: Do not list the special entries "." and "..".
-   `NoDot`: Do not list the special entry ".".
-   `NoDotDot`: Do not list the special entry "..".
-   `AllEntries`: List directories, files, drives and symlinks (this does not list broken symlinks unless you specify System).
-   `Readable`: List files for which the application has read access. The Readable value needs to be combined with Dirs or Files.
-   `Writable`: List files for which the application has write access. The Writable value needs to be combined with Dirs or Files.
-   `Executable`: List files for which the application has execute access. The Executable value needs to be combined with Dirs or Files.
-   `Modified`: Only list files that have been modified (ignored on Unix).
-   `Hidden`: List hidden files (on Unix, files starting with a ".").
-   `System`: List system files (on Unix, FIFOs, sockets and device files are included; on Windows, .lnk files are included).
-   `CaseSensitive`: The filter should be case sensitive.

### [system.getFile(filePath)](#systemgetfilefilepath)

Returns a [studio.system.File](#class-file) object representing the file at `filePath`.

### [system.openMode](#systemopenmode)

An enumeration used with `studio.system.File.open()` to describe the mode in which a file is opened. Possible values are:

-   `ReadOnly`: The file is open for reading.
-   `WriteOnly`: The file is open for writing. This mode implies `Truncate`.
-   `ReadWrite`: The file is open for reading and writing.
-   `Append`: The file is opened in append mode so that all data is written to the end of the file.
-   `Truncate`: If possible, the file is truncated before it is opened. All earlier contents of the file are lost.

### [system.permission](#systempermission)

An enumeration used with [studio.system.File.setPermissions()](#filesetpermissionspermissions) to alter the permissions of a file. The permissions of a file can be queried using [studio.system.File.permissions](#filepermissions). The values may be OR-ed together to test multiple permissions and ownership values. Possible values are:

-   `ReadOwner`: The file is readable by the owner of the file.
-   `WriteOwner`: The file is writable by the owner of the file.
-   `ExeOwner`: The file is executable by the owner of the file.
-   `ReadUser`: The file is readable by the user (platform-dependent).
-   `WriteUser`: The file is writable by the user (platform-dependent).
-   `ExeUser`: The file is executable by the user (platform-dependent).
-   `ReadGroup`: The file is readable by the group.
-   `WriteGroup`: The file is writable by the group.
-   `ExeGroup`: The file is executable by the group.
-   `ReadOther`: The file is readable by anyone.
-   `WriteOther`: The file is writable by anyone.
-   `ExeOther`: The file is executable by anyone.
-   `Exe`: The file is executable by everyone.
-   `Write`: The file is writable by everyone.
-   `Read`: The file is readable by everyone.

## [Class: File](#class-file)

The `studio.system.File` object allows for interaction with files on disk. A `studio.system.File` can be created using [system.getFile()](#systemgetfilefilepath).

### [File.exists()](#fileexists)

Returns `true` if the file the object represents exists on disk, or `false` otherwise.

### [File.open(openModeFlag)](#fileopenopenmodeflag)

Opens the file in the mode specified by `openModeFlag`. The available options are described by the [system.openMode](#systemopenmode) enum. Returns `true` if the operation succeeds, or `false` otherwise.

### [File.writeText(text)](#filewritetexttext)

Writes the `text` to the file as Utf8. Returns the number of bytes that were actually written, or -1 if an error occurred.

### [File.readText(maxSize)](#filereadtextmaxsize)

Reads at most `maxSize` bytes from the file as Utf8 and returns the resulting string.

### [File.writeBinary(byteArray)](#filewritebinarybytearray)

Writes the `byteArray` to the file. Returns the number of bytes that were actually written, or -1 if an error occurred.

### [File.readBinary(maxSize)](#filereadbinarymaxsize)

Reads at most `maxSize` bytes from the file and returns the result.

### [File.close()](#fileclose)

Closes the file and flushes any changes to disk. Returns `true` if the operation succeeds, or `false` otherwise.

### [File.copy(filePath)](#filecopyfilepath)

Copies the file to the absolute `filePath` specified. Directories that don't exist within the `filePath` will be created as required.

### [File.remove()](#fileremove)

Removes the file from disk. The operation is not undoable and the file will not be recoverable from the Recycle Bin on Windows or the Trash on Mac OS X. Returns `true` if the operation succeeds, or `false` otherwise.

### [File.size()](#filesize)

Returns the size of the file in bytes.

### [File.permissions()](#filepermissions)

Returns the complete OR-ed together combination of [system.permission](#systempermission) flags if the file exists on disk, or 0 otherwise.

### [File.setPermissions(permissions)](#filesetpermissionspermissions)

Sets the [system.permission](#systempermission) flags for the file to the `permissions` specified. Returns true if successful, or false if the permissions cannot be modified.

## [Class: ScriptProcess](#class-scriptprocess)

The `studio.system.ScriptProcess` object allows for interaction with a process started using [system.startAsync()](#systemstartasyncpathtoexecutable-processoptions).

### [ScriptProcess.isRunning()](#scriptprocessisrunning)

Returns `true` if the process is running and is ready for reading or writing, or `false` otherwise.

### [ScriptProcess.readAllStandardOutput()](#scriptprocessreadallstandardoutput)

Returns all data available from the standard output of the process.

### [ScriptProcess.readAllStandardError()](#scriptprocessreadallstandarderror)

Returns all data available from the standard error of the process.

### [ScriptProcess.writeStandardInput(text, timeout)](#scriptprocesswritestandardinputtext-timeout)

Writes the `text` to the standard input of the process and waits up to `timeout` number of milliseconds for the process to write back to the standard output.

### [ScriptProcess.kill()](#scriptprocesskill)

Kills the process, causing it to exit immediately.

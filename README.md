# Get Sketch Logs

This script will get all the support logs and basic system info required for troubleshooting any Sketch Mac app issues.

To execute the script, run this in Terminal:

```
bash <(curl -fsSL https://git.io/URL_PENDING) 1h
```

## Options

Adjust the `1h` to whatever period best covers the investigated incident time. 
The parameter can be set in

- `m` - minutes
- `h` - hours
- `d` - days

Normally the max amount of time the log is stored is `72h` (`3d`)

Running the script without this parameter defaults to `1h`.

## Logs

The script gathers the following logs for the given period:

- Sketch **Collaboration log**
- **Console log** filtered to `sketch` events only
- **Crash logs** for `Sketch` and/or `SketchMirrorHelper`
- List of enabled and disabled **Sketch Plugins**
- Sketch **preferences** plist
- Basic **OS/CPU/GPU info**

The logs are zipped up in a single file, ready to share with the support team.

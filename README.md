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

## Considerations

- Collaboration log is stored only for max `12h`
- Console log is stored only for max `3d`
- Running the script without the time parameter will default to `1h`
- To retrieve the Collaboration or Console log, admin rights are required. Otherwise the operation will be simply skipped.

## What’s in the logs

The following anonymous information is gathered, without any personal identifiers:

1. Sketch **Collaboration log**
2. **Console log** filtered to `sketch` events only
3. **Crash logs** for `Sketch` and `SketchMirrorHelper`
4. List of enabled and disabled **Sketch Plugins**
5. Sketch **preferences** plist
6. Basic **OS/CPU/GPU info**

The logs are zipped up in a single file, ready to share with the support team.



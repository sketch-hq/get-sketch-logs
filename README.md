# Get Sketch Logs

This script will get all the support logs and basic system information required for troubleshooting any [Sketch Mac app](https://sketch.com) issues.

Run the following command in Terminal to execute the script:

```
bash <(curl -fsSL https://git.io/sketchlogs) 1h
```

> ☝️ The logs will be zipped up in a single file, ready to share with the support team.
All the information inside these logs is **anonymous** and **doesn’t contain any personal identifiers**.


## Options

Adjust the `1h` to whatever period best covers the investigated incident time. 
The parameter can be set in:

- `m` - minutes
- `h` - hours
- `d` - days

## Considerations

- Collaboration log is stored only for max `12h`
- Console log is stored only for max `3d`
- Running the script without the time parameter will default to `1h`
- To retrieve the Collaboration or Console log, admin rights are required. Otherwise the operation will be simply skipped.

## Included information

The following information is collected by the script:

1. Sketch **Collaboration log**
2. **Console log** filtered to `sketch` events only
3. **Crash logs** for `Sketch` and `SketchMirrorHelper`
4. List of enabled and disabled **Sketch Plugins**
5. Sketch **preferences** plist
6. Basic **OS/CPU/GPU info**

# Localization Helper Bash Scripts

## get-msgstrs.sh

Extracts msgtxts from compiled localy installed .mo files.

Usage:

```
$ bash get-msgstrs.sh <appid> <query> [<template>]
```

whereas:

* `<appid>` usualy is the name of an application (such as KDEs 'dolphin')
* `<query>` is a term to search
* `<template>` is a printf format string (Default is: '%s %s\n')

use `Name[%s]=%s\n` as a template to create Desktop Entry Specification localized Names.


# Localization Helper Bash Scripts

## get_msgstrs.sh

Extracts msgtxts from compiled localy installed .mo files.

Usage:

```
$ bash get_msgstrs.sh <appid> <query> [<template>]
```

whereas:

<appid> usualy is the name of an application (such as KDEs 'dolphin')
<query> is a term to search
<template> is printf format string. like 'Name[%s]=%s\n' for creating Desktop Entry Specification localized names


# msToSpectra

## Description

Create a S4 Spectra object in R Environment from `.ms` files located in a specified folder.<p>
Files must be in `.ms` format. The first three lines must be 1) compound name, 2) precursor mass, and 3) collision energy.<br>
Current version excludes files that contain adduct information. In this case, change fragment information from 1:3 to 1:4 (line 23-24) to parse mz and intensity information correctly.<p>
Spectra objects can then be compared with MassBank records using the `matchSpectra` (MetaboAnnotation) or `compareSpectra` (MsCoreUtils) functions from their respective packages.

## Dependancies
```
library(tidyverse)
library(Spectra)
```

## Usage
```
msToSpectra(folder = "<path to .ms files>")
```

## Arguments
#### folder
Path to folder containing one or more `.ms` files.

## Value
A S4 Spectra object.

## Author
Drew Szabo <br>
GitHub: [drewszabo](https://github.com/drewszabo) <br>
ORCID: [0000-0002-0089-9218](https://orcid.org/0000-0002-0089-9218)

## Copyright
©️ KruveLab 2022. Stockholm University, Sweden 114 18.

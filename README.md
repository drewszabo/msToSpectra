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
Returns a S4 Spectra object including:<br>
#### Sample ID
  A character of the sample ID given in the `.ms` file.
#### Precursor m/z
  An integer of the precursor ion mass to charge ratio (assuming charge = +1).
#### Collision Energy
  An integer of the collision energy.
#### Product m/z
  A list of mass to charge ratios given in the MS2 mass spectrum.
#### Product intensity
  A list of intensities for each m/z ion present in mass spectrum.
#### Product relative intensity
  A list of intensities, relative to the highest MS2 peak, out of 1000.

## Author
Drew Szabo <br>
GitHub: [drewszabo](https://github.com/drewszabo) <br>
ORCID: [0000-0002-0089-9218](https://orcid.org/0000-0002-0089-9218)

## Copyright
©️ KruveLab 2022. Stockholm University, Sweden 114 18.

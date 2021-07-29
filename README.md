# ARGeoKit

A helper library for ARKit to place entities w.r.t real life coordinates

## Usage

``` swift
// Calculate an offsetVector of the two CLLocations
guard var offsetVector = locationService.lastLocation?.vector(to: referenceBlock.location) else {
    print("Couldn't compute offset vector from current position to referenceBlock")
    return
}
```

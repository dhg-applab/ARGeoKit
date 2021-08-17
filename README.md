# ARGeoKit

A helper library for ARKit to place entities w.r.t real life coordinates

## Usage

``` swift
// Calculate an offsetVector of the two CLLocations
let location1: CLLocation = ...
let location2: CLLocation = ...

guard var offsetVector = location1.vector(to: location2) else {
    print("Couldn't compute offset vector from location1 to location2")
    return
}
```

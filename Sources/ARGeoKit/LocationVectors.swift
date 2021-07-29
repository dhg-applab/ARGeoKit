//
//  File.swift
//  
//
//  Created by florian schweizer on 29.07.21.
//

import CoreLocation

extension CLLocation {
    /// Calculates the coordinate by adding a m^3 vector to another coordinate
    func add(axisAlignedVector vector: SIMD3<Float>) -> CLLocation {
        let radiusEarth: Double = 6371

        let newLatitude  = self.coordinate.latitude + (Double(vector.z) / radiusEarth) * (180.0 / Double.pi)
        let newLongitude = self.coordinate.longitude + (Double(vector.x) / radiusEarth) * (180.0 / Double.pi) / cos(self.coordinate.latitude * Double.pi / 180.0)
        let newAltitude = self.altitude + Double(vector.y)
        
        return CLLocation(coordinate: CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude), altitude: newAltitude, horizontalAccuracy: horizontalAccuracy, verticalAccuracy: verticalAccuracy, timestamp: Date())
    }
    
    /// Calculates the vector in m^3 between two coordinates
    ///
    /// Note: This is a N/E aligned vector, it needs to be transformed to the local coordinate space using the devices orientation...
    func vector(to location: CLLocation) -> SIMD3<Float> {
        let radiusEarth: Double = 6371
        
        let oldLatitude = coordinate.latitude
        let oldLongitude = coordinate.longitude
        
        let newLatitude = radiusEarth * ((location.coordinate.latitude - oldLatitude) / (180.0 / Double.pi))
        let newLongitude = radiusEarth * (location.coordinate.longitude - oldLongitude) / ((180.0 / Double.pi) / (cos(oldLatitude * Double.pi / 180.0)))
        
        let newAltitude: Float = 0
        
        return SIMD3(x: Float(newLatitude * 1000), y: newAltitude, z: Float(newLongitude * 1000))
    }
    
    static var zero: CLLocation {
        CLLocation(latitude: 0, longitude: 0)
    }
}
